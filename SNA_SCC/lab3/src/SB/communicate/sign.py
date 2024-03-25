from communicate.utils_encryption import generate_rsa_key_pair, rsa_sign,rsa_verify, sha256_hash,export_rsa_key_to_file,import_rsa_key_from_file
import os

def save_private_key(private_key, file_path):
    export_rsa_key_to_file(private_key, file_path)
        
def save_public_key(public_key, file_path):
    export_rsa_key_to_file(public_key, file_path)
        
def load_private_key(file_path):
    key = import_rsa_key_from_file(file_path)
    return key

def load_public_key(file_path):
    key = import_rsa_key_from_file(file_path)
    return key

def sign_python_script(private_key, script_path):
    with open(script_path, 'rb') as f:
        script = f.read()
    signature = rsa_sign(script, private_key, sha256_hash)
    return signature

def verify_python_script(public_key, script_path, signature):
    with open(script_path, 'rb') as f:
        script = f.read()
    return rsa_verify(script, public_key, signature, sha256_hash)
    
def save_signature(signature, file_path):
    with open(file_path, 'wb') as f:
        f.write(signature)
        
def load_signature(file_path):
    with open(file_path, 'rb') as f:
        signature = f.read()
    return signature

relatively_path = 'src/SB/scripts/'

def boot_next(node_name):
    public_key = load_public_key(node_name+'.pub')
    signature = load_signature(node_name+'.sign')
    try:
        verify_python_script(public_key, relatively_path+node_name+'.py', signature)
        print('Booting next node '+node_name)
        cmd = 'rosrun SB '+node_name+'.py'
        os.system(cmd)
        print('Booting '+node_name+' complete!')
    except (ValueError, TypeError):
        print('Signature verification failed!')
    
def sign_all_nodes(node_names):
    for node_name in node_names:
        private_key = generate_rsa_key_pair(1024)
        public_key = private_key.publickey()
        save_private_key(private_key, node_name+'.key')
        save_public_key(public_key, node_name+'.pub')
        script_path = relatively_path+node_name+'.py'
        signature = sign_python_script(private_key, script_path)
        save_signature(signature, node_name+'.sign')
        print('Signature of '+node_name+' generated!')