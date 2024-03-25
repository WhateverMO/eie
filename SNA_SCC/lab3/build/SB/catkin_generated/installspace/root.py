from communicate.sign import generate_rsa_key_pair,sign_python_script,verify_python_script,save_private_key,load_private_key,save_public_key,load_public_key,save_signature,load_signature,boot_next,sign_all_nodes

if __name__ == '__main__':
    node_names = ['A','B','C']
    sign_all_nodes(node_names)