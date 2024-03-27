import rospy
from SSL.srv import msg,msgResponse
from myssl import SSLclient,rsa_decrypt,rsa_encrypt
from Authentication.utils_certificate import *

root_name = "root"

root_private_key_path = f"{root_name}.key"
root_certificate_path = f"{root_name}.pem"

root_private_key = load_private_key(root_private_key_path)
root_certificate = load_certificate(root_certificate_path)
name_list = ['root','client']
private_keys, certificate_chain = generate_certificate_chain(root_private_key, root_certificate, name_list[1:])
client_private_key = private_keys[1]
client_certificate = certificate_chain[1]

count = 0

def handle_ssl(req, sslclient:SSLclient):
    global count, client_certificate, client_private_key
    msg = req.response
    rospy.loginfo("%d: SSL request received: %s", count, msg)
    
    if count == 0:
        request = sslclient.hello()
        request = certification_to_bytes(client_certificate) + request
    elif count == 1:
        server_certification_bytes = msg[:1038]
        server_certification = bytes_to_certification(server_certification_bytes)
        msg = rsa_decrypt(msg[1038:], client_private_key)
        if not verify_certificate_chain([root_certificate, server_certification]):
            raise Exception("Server certificate is not valid")
        server_public_key = server_certification.public_key()
        request = sslclient.OK(msg)
        request = rsa_encrypt(request, server_public_key)
    elif count == 2:
        request = "how are you?".encode("utf-8")
        request = sslclient.encrypt(request)
    else:
        response = sslclient.decrypt(msg).decode("utf-8")
        rospy.loginfo("%d: SSL response received: %s", count, response)
        request = "i am fine, thank you.".encode("utf-8")
        request = sslclient.encrypt(request)

    rospy.loginfo("%d: SSL request sent: %s", count, request)
    count += 1
    return request

if __name__ == "__main__":
    rospy.init_node('ssl_client')
    sslclient = SSLclient()
    rospy.loginfo("SSL client started")
    rospy.wait_for_service('ssl')
    call_ssl = rospy.ServiceProxy('ssl', msg)
    response = msgResponse(response="")
    while not rospy.is_shutdown():
        request = handle_ssl(response, sslclient)
        response = call_ssl(request)
        sslclient.update()
        
    