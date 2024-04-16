import rospy
from OTA.srv import msg,msgResponse
from myssl import SSLclient,rsa_decrypt,rsa_encrypt
from Authentication.utils_certificate import *
from diff import apply_diff, reverse_apply_diff

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

host_file = "host.py"

def run_python_file(file_path):
    exec(open(file_path).read())

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
        request = " ".encode("utf-8")
        request = sslclient.encrypt(request)
    else:
        run_python_file(host_file)
        response = sslclient.decrypt(msg).decode("utf-8")
        rospy.loginfo("%d: SSL response received: %s", count, response)
        apply_diff(response, host_file)
        run_python_file(host_file)
        reverse_apply_diff(response, host_file)
        run_python_file(host_file)
        raise KeyboardInterrupt

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
        
    