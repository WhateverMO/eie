import rospy
from std_msgs.msg import String
from communicate.utils_encryption import import_rsa_key_from_file
from communicate.communicate import decrypt_message

topic_name = "A"

private_key = None

def read_key_from_file(filename):
    return import_rsa_key_from_file(filename)

def callback(data):
    rospy.loginfo("Received: %s", data.data)
    decrypted_message = decrypt_message(data.data, rsa_private_key=private_key)
    rospy.loginfo("Decrypted message: %s", decrypted_message)

def main():
    global private_key
    rospy.init_node('B_node', anonymous=True)
    private_key = read_key_from_file("rsa_key.pem")
    rospy.loginfo("Private key: %s", private_key.exportKey())
    rospy.Subscriber(topic_name, String, callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        rospy.loginfo("B_node stopped")