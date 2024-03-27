import os
import hmac
import hashlib
import random
import time
from Cryptodome.Cipher import AES
from Cryptodome.Random import get_random_bytes
import base64
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import padding

def rsa_encrypt(data, public_key):
    encrypted_data = public_key.encrypt(data, padding.OAEP(mgf=padding.MGF1(algorithm=hashes.SHA256()), algorithm=hashes.SHA256(), label=None))
    return encrypted_data

def rsa_decrypt(encrypted_data, private_key):
    decrypted_data = private_key.decrypt(encrypted_data, padding.OAEP(mgf=padding.MGF1(algorithm=hashes.SHA256()), algorithm=hashes.SHA256(), label=None))
    return decrypted_data

def aes_encrypt(data, secret_key,iv=None):
    if iv is None:
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

def get_random_number():
    return get_random_bytes(16)

def generate_permaster_key():
    return ''.join([chr(random.randint(0,255)) for i in range(16)]).encode()

def generate_hmac_hash(secret_key,byte_data):
    return hmac.new(secret_key,byte_data,hashlib.sha256).hexdigest().encode()

def generate_secret_key(random_number1, random_number2, permaster_key):
    random_number = random_number1 + random_number2
    secret_key = generate_hmac_hash(permaster_key, random_number)
    # print('random_number1:', random_number1)
    # print('random_number2:', random_number2)
    # print('permaster_key:', permaster_key)
    # print('random_number:', random_number)
    # print('secret_key:', secret_key)
    return secret_key

def generate_working_key(secret_key, time_step=60):
    timestamp = int(time.time() / time_step)
    timestamp_bytes = timestamp.to_bytes(8, byteorder='big')
    working_key = generate_hmac_hash(secret_key, timestamp_bytes)
    return working_key[:16]

if __name__ == '__main__':
    # test
    data = b'hello world'
    random_number1 = get_random_number()
    random_number2 = get_random_number()
    permaster_key = generate_permaster_key()
    secret_key = generate_secret_key(random_number1, random_number2, permaster_key)
    while True:
        working_key = generate_working_key(secret_key, 2)
        working_key1 = generate_working_key(secret_key, 2)
        if working_key != working_key1:
            print('working_key not equal')
            print(working_key)
            print(working_key1)
            print('failed')
            break
        encrypt_data = aes_encrypt(data, working_key)
        decrypt_data = aes_decrypt(encrypt_data, working_key)
        if decrypt_data == data:
            print()
            print('secret_key:', secret_key)
            print('working_key:', working_key)
            print(data)
            print(encrypt_data)
            print(decrypt_data)
            print('success')
        else:
            print('failed')
            break
        from time import sleep
        sleep(1)
        
