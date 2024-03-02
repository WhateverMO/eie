from communicate.utils_encryption import rsa_encrypt, rsa_decrypt, aes_encrypt, aes_decrypt, des_encrypt, des_decrypt

def encrypt_message(message, rsa_encrypt_option=True,aes_encrypt_option=False,des_encrypt_option=False,rsa_public_key=None,aes_secret_key=None,des_secret_key=None):
    encrypted_message = message.encode('utf-8')
    if rsa_encrypt_option:
        encrypted_message = rsa_encrypt(encrypted_message, rsa_public_key)
    if aes_encrypt_option:
        encrypted_message = aes_encrypt(encrypted_message, aes_secret_key)
    if des_encrypt_option:
        encrypted_message = des_encrypt(encrypted_message, des_secret_key)
    return encrypted_message.decode('utf-8')

def decrypt_message(encrypted_message, rsa_decrypt_option=True,aes_decrypt_option=False,des_decrypt_option=False,rsa_private_key=None,aes_secret_key=None,des_secret_key=None):
    decrypted_message = encrypted_message.encode('utf-8')
    if rsa_decrypt_option:
        decrypted_message = rsa_decrypt(decrypted_message, rsa_private_key)
    if aes_decrypt_option:
        decrypted_message = aes_decrypt(decrypted_message, aes_secret_key)
    if des_decrypt_option:
        decrypted_message = des_decrypt(decrypted_message, des_secret_key)
    return decrypted_message.decode('utf-8')