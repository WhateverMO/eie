import rospy
from std_msgs.msg import String
from communicate.utils_encryption import generate_rsa_key_pair, export_rsa_key_to_file
from communicate.communicate import encrypt_message

topic_name = "A"

def write_key_to_file(key, filename):
    export_rsa_key_to_file(key, filename)

def main():
    rospy.init_node('A_node', anonymous=True)
    pub = rospy.Publisher(topic_name, String, queue_size=10)
    rate = rospy.Rate(10) # 10hz
    key = generate_rsa_key_pair(1024)
    public_key = key.publickey()
    private_key = key
    write_key_to_file(private_key, "rsa_key.pem")
    rospy.loginfo("Public key: %s", public_key.exportKey())
    rospy.loginfo("Private key: %s", private_key.exportKey())
    message = "Hello B, this is A"
    rospy.loginfo("Sending: %s", message)
    encrypted_message = encrypt_message(message, rsa_public_key=public_key)
    rospy.loginfo("Encrypted message: %s", encrypted_message)
    pub.publish(encrypted_message)
    rospy.Rate(1)
    i = 0
    while not rospy.is_shutdown():
        message = "Hello B, this is A " + str(i)
        rospy.loginfo("Sending: %s", message)
        encrypted_message = encrypt_message(message, rsa_public_key=public_key)
        rospy.loginfo("Encrypted message: %s", encrypted_message)
        pub.publish(encrypted_message)
        i += 1
        rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        rospy.loginfo("A_node stopped")