from myssl.utils import *


class SSLclient:
    def __init__(self):
        pass

    def hello(self):
        self.secret_key = get_random_number()
        return self.secret_key
    
    def OK(self, random_number):
        permaster_key = generate_permaster_key()
        self.secret_key = generate_secret_key(self.secret_key, random_number, permaster_key)
        return permaster_key
    
    def update(self):
        self.work_key = generate_working_key(self.secret_key)
        
    def encrypt(self, message):
        return aes_encrypt(message, self.work_key)
    
    def decrypt(self, message):
        return aes_decrypt(message, self.work_key)
    

class SSLserver:
    def __init__(self):
        pass
    
    def hi(self, random_number):
        self.secret_key = get_random_number()
        self.work_key = random_number
        return self.secret_key
    
    def OK(self, permaster_key):
        self.secret_key = generate_secret_key(self.work_key, self.secret_key, permaster_key)
        return self.secret_key
    
    def update(self):
        try:
            self.work_key = generate_working_key(self.secret_key)
        except AttributeError:
            pass
    
    def encrypt(self, message):
        return aes_encrypt(message, self.work_key)
    
    def decrypt(self, message):
        return aes_decrypt(message, self.work_key)
    
    