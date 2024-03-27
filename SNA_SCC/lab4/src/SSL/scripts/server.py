import rospy
from SSL.srv import msg, msgResponse
from myssl import SSLserver,rsa_decrypt,rsa_encrypt
from Authentication.utils_certificate import *

root_name = "root"

root_private_key_path = f"{root_name}.key"
root_certificate_path = f"{root_name}.pem"

root_private_key = load_private_key(root_private_key_path)
root_certificate = load_certificate(root_certificate_path)
name_list = ['root','server']
private_keys, certificate_chain = generate_certificate_chain(root_private_key, root_certificate, name_list[1:])
server_private_key = private_keys[1]
server_certificate = certificate_chain[1]

count = 0
sslserver = SSLserver()

def handle_ssl(req):
    global count, sslserver
    msg = req.request
    rospy.loginfo(" %d: SSL request received: %s", count, msg)
    if count == 0:
        client_certificate_bytes = msg[:1038]
        client_certificate = bytes_to_certification(client_certificate_bytes)
        msg = msg[1038:]
        if not verify_certificate_chain([root_certificate, client_certificate]):
            raise Exception("Invalid client certificate chain")
        client_public_key = client_certificate.public_key()
        response = sslserver.hi(msg)
        response = certification_to_bytes(server_certificate) + rsa_encrypt(response, client_public_key)
    elif count == 1:
        msg = rsa_decrypt(msg, server_private_key)
        sslserver.OK(msg)
        response = "OK".encode("utf-8")
    else:
        sslserver.update()
        msg = sslserver.decrypt(msg).decode("utf-8")
        rospy.loginfo(" %d: SSL decrypted message: %s", count, msg)
        msg += " "+str(count)+" "
        response = sslserver.encrypt(msg.encode("utf-8"))
    
    if count == 5:
        raise KeyboardInterrupt
    
    rospy.loginfo(" %d: SSL response: %s", count, response)
    count += 1
    return msgResponse(response)
    

if __name__ == "__main__":
    rospy.init_node("server")
    rospy.Service("ssl", msg, handle_ssl)
    rospy.spin()
    