from Authentication.utils_certificate import *
import rospy
from std_msgs.msg import String

def callback_fun(data):
    rospy.loginfo("Received message: %s", data.data)
    print(data.data)
    path_list = data.data.split(',')
    print(path_list)
    certificate_chain = load_certificate_chain(path_list)
    if certificate_chain is not None:
        if verify_certificate_chain(certificate_chain):
            rospy.loginfo("Certificate chain is valid")
        else:
            rospy.loginfo("Certificate chain is invalid")
    else:
        rospy.loginfo("Failed to load certificate chain")
        

if __name__ == '__main__':
    rospy.init_node('B', anonymous=True)
    rospy.Subscriber("Authentication", String, callback_fun)
    rospy.loginfo("Press Ctrl-C to exit")
    rospy.spin()