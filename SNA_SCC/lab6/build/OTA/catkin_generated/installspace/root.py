from Authentication.utils_certificate import *
from diff import generate_diff
import os

if __name__ == "__main__":
    # Generate root certificate
    private_key, root_certificate = generate_self_signed_certificate("root")

    # Save root certificate to file
    save_certificate(root_certificate, "root.pem")

    # Save private key to file
    save_private_key(private_key, "root.key")

    print("Root certificate and private key generated successfully!")
    
    old_file_path = "src/OTA/diff/old_file.py"
    new_file_path = "src/OTA/diff/new_file.py"
    
    # Generate diff file
    generate_diff(old_file_path, new_file_path, "diff.patch")
    
    # Generate host file
    # cp old_file.py -> host.py
    os.system("cp src/OTA/diff/old_file.py host.py")