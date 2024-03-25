from cryptography import x509
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives.serialization import Encoding, PrivateFormat, NoEncryption
import datetime
from cryptography.hazmat.primitives import serialization

def generate_self_signed_certificate(common_name):
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
        backend=default_backend()
    )

    subject = issuer = x509.Name([
        x509.NameAttribute(x509.NameOID.COMMON_NAME, common_name)
    ])

    certificate = x509.CertificateBuilder() \
        .subject_name(subject) \
        .issuer_name(issuer) \
        .public_key(private_key.public_key()) \
        .serial_number(x509.random_serial_number()) \
        .not_valid_before(datetime.datetime.utcnow()) \
        .not_valid_after(datetime.datetime.utcnow() + datetime.timedelta(days=365)) \
        .sign(private_key, hashes.SHA256(), default_backend())

    return private_key, certificate


def generate_child_certificate(parent_private_key, parent_certificate, common_name):
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
        backend=default_backend()
    )
    

    subject = issuer = x509.Name([
        x509.NameAttribute(x509.NameOID.COMMON_NAME, common_name)
    ])

    certificate = x509.CertificateBuilder() \
        .subject_name(subject) \
        .issuer_name(parent_certificate.subject) \
        .public_key(private_key.public_key()) \
        .serial_number(x509.random_serial_number()) \
        .not_valid_before(datetime.datetime.utcnow()) \
        .not_valid_after(datetime.datetime.utcnow() + datetime.timedelta(days=365)) \
        .add_extension(
            x509.AuthorityKeyIdentifier.from_issuer_public_key(parent_certificate.public_key()),
            critical=False
        ) \
        .sign(parent_private_key, hashes.SHA256(), default_backend())

    return private_key, certificate


def save_certificate(certificate, path):
    with open(path, "wb") as f:
        f.write(certificate.public_bytes(Encoding.PEM))


def load_certificate(path):
    with open(path, "rb") as f:
        cert_bytes = f.read()
        cert = x509.load_pem_x509_certificate(cert_bytes, default_backend())
        return cert


def verify_certificate(certificate, public_key):
    try:
        public_key.verify(
            certificate.signature,
            certificate.tbs_certificate_bytes,
            padding.PKCS1v15(),
            certificate.signature_hash_algorithm
        )
        return True
    except :
        return False


def save_private_key(private_key, path):
    with open(path, "wb") as f:
        f.write(private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.TraditionalOpenSSL,
            encryption_algorithm=serialization.NoEncryption()
        ))


def load_private_key(path):
    with open(path, "rb") as f:
        key_bytes = f.read()
        key = serialization.load_pem_private_key(
            key_bytes,
            password=None,
            backend=default_backend()
        )
        return key
    
def generate_certificate_chain(root_private_key, root_certificate, name_list):
    private_key_list = []
    certificate_list = []
    private_key_list.append(root_private_key)
    certificate_list.append(root_certificate)
    for i in range(len(name_list)):
        private_key, certificate = generate_child_certificate(private_key_list[-1], certificate_list[-1], name_list[i])
        private_key_list.append(private_key)
        certificate_list.append(certificate)
    return private_key_list, certificate_list

def save_certificate_chain(certificate_list, path_list):
    for i in range(len(certificate_list)):
        save_certificate(certificate_list[i], path_list[i])


def load_certificate_chain(path_list):
    certificate_list = []
    for i in range(len(path_list)):
        certificate_list.append(load_certificate(path_list[i]))
    return certificate_list


def verify_certificate_chain(certificate_list):
    for i in range(len(certificate_list)):
        if i == 0:
            if not verify_certificate(certificate_list[i], certificate_list[i].public_key()):
                return False
        else:
            if not verify_certificate(certificate_list[i], certificate_list[i-1].public_key()):
                return False
    return True