#! /usr/bin/env python
import base64
from Cryptodome.PublicKey import RSA
from Cryptodome.Cipher import AES, DES, PKCS1_v1_5 as PKCS1_v1_5_Cipher
from Cryptodome.Random import get_random_bytes
from Cryptodome.Hash import SHA256, SHA512, MD5, SHA
from Cryptodome.Signature import PKCS1_v1_5 as PKCS1_v1_5_Signature

def generate_secret_key(length):
    return get_random_bytes(length)

def generate_rsa_key_pair(bits):
    key = RSA.generate(bits)
    return key

def import_rsa_key_from_file(filename):
    with open(filename, 'rb') as file:
        key = RSA.importKey(file.read())
        return key
    
def export_rsa_key_to_file(key, filename):
    with open(filename, 'wb') as file:
        file.write(key.exportKey())

def rsa_encrypt(data, public_key):
    cipher = PKCS1_v1_5_Cipher.new(public_key)
    encrypt_data = cipher.encrypt(data)
    encrypt_text = base64.b64encode(encrypt_data)
    return encrypt_text

def rsa_decrypt(data, private_key):
    cipher = PKCS1_v1_5_Cipher.new(private_key)
    decrypt_data = base64.b64decode(data)
    decrypt_text = cipher.decrypt(decrypt_data, None)
    return decrypt_text

def aes_encrypt(data, secret_key):
    iv = get_random_bytes(16)
    cipher = AES.new(secret_key, AES.MODE_CFB, iv)
    encrypt_data = iv + cipher.encrypt(data)
    encrypt_text = base64.b64encode(encrypt_data)
    return encrypt_text

def aes_decrypt(data, secret_key):
    decrypt_data = base64.b64decode(data)
    iv = decrypt_data[:16]
    cipher = AES.new(secret_key, AES.MODE_CFB, iv)
    decrypt_text = cipher.decrypt(decrypt_data[16:])
    return decrypt_text

def des_encrypt(data, secret_key):
    iv = get_random_bytes(8)
    cipher = DES.new(secret_key, DES.MODE_CFB, iv)
    encrypt_data = iv + cipher.encrypt(data)
    encrypt_text = base64.b64encode(encrypt_data)
    return encrypt_text

def des_decrypt(data, secret_key):
    decrypt_data = base64.b64decode(data)
    iv = decrypt_data[:8]
    cipher = DES.new(secret_key, DES.MODE_CFB, iv)
    decrypt_text = cipher.decrypt(decrypt_data[8:])
    return decrypt_text

def sha256_hash(data):
    hash = SHA256.new(data)
    return hash

def sha512_hash(data):
    hash = SHA512.new(data)
    return hash

def md5_hash(data):
    hash = MD5.new(data)
    return hash

def sha_hash(data):
    hash = SHA.new(data)
    return hash

def rsa_sign(data, private_key, hash_algorithm):
    signer = PKCS1_v1_5_Signature.new(private_key)
    hash = hash_algorithm.new(data)
    signature = signer.sign(hash)
    return signature

def rsa_verify(data, public_key, signature, hash_algorithm):
    verifier = PKCS1_v1_5_Signature.new(public_key)
    hash = hash_algorithm.new(data)
    return verifier.verify(hash, signature)