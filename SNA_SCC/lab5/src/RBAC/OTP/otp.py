# otp

import hmac
import random
import hashlib
import time

def generate_secret_key(length = 16):
    return ''.join([chr(random.randint(0,255)) for i in range(length)])

def generate_hmac_hash(secret_key,message):
    return hmac.new(secret_key.encode(),message.encode(),hashlib.sha256).hexdigest()

def generate_otp_code(secret_key,time_step = 60,otp_length = 6):
    time_step = 60
    otp_length = 6
    current_time = int(time.time())
    message = str(current_time//time_step)
    hmac_hash = generate_hmac_hash(secret_key,message)
    otp_code = hmac_hash[:otp_length]
    return otp_code

def verify_otp_code(secret_key,otp_code,time_step = 60,otp_length = 6):
    time_step = 60
    otp_length = 6
    current_time = int(time.time())
    message = str(current_time//time_step)
    hmac_hash = generate_hmac_hash(secret_key,message)
    return hmac_hash[:otp_length] == otp_code

def exprot_secret_key(secret_key,file_path):
    with open(file_path,'w') as f:
        f.write(secret_key)

def import_secret_key(file_path):
    with open(file_path,'r') as f:
        secret_key = f.read()
    return secret_key