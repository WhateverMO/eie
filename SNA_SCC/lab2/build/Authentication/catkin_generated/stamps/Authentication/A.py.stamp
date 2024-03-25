from Authentication.utils_certificate import *
import rospy
from std_msgs.msg import String

root_name = "root"

root_private_key_path = f"{root_name}.key"
root_certificate_path = f"{root_name}.pem"

def generate_msg(root_private_key, root_certificate):
    name_list = ['root','father','son']
    private_keys, certificate_chain = generate_certificate_chain(root_private_key, root_certificate, name_list[1:])
    # certificate_chain = certificate_chain[1:]
    path_list = [f"{name}.pem" for name in name_list]
    save_certificate_chain(certificate_chain, path_list)
    rospy.loginfo(f"Generated certificate chain: {path_list}")
    rospy.loginfo(f"Private keys: {private_keys}")
    rospy.loginfo(f"Message: {path_list}")
    return ','.join(path_list)

if __name__ == '__main__':
    root_private_key = load_private_key(root_private_key_path)
    root_certificate = load_certificate(root_certificate_path)
    msg = generate_msg(root_private_key, root_certificate)
    # ros publisher
    rospy.init_node('A', anonymous=True)
    pub = rospy.Publisher('Authentication', String, queue_size=10)
    rate = rospy.Rate(1) # 10hz
    while not rospy.is_shutdown():
        pub.publish(msg)
        rospy.loginfo(f"Published message: {msg}")
        rospy.loginfo("Press Ctrl+C to exit")
        rate.sleep()
    rospy.spin()