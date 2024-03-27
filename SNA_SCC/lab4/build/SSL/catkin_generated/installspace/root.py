from Authentication.utils_certificate import *

if __name__ == "__main__":
    # Generate root certificate
    private_key, root_certificate = generate_self_signed_certificate("root")

    # Save root certificate to file
    save_certificate(root_certificate, "root.pem")

    # Save private key to file
    save_private_key(private_key, "root.key")

    print("Root certificate and private key generated successfully!")