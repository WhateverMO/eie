import rospy
from RBAC.srv import access
from OTP import import_secret_key, generate_otp_code
from rbac import operations

server_operations = operations.copy()
server_operations.extend([
    "add_role",
    "show_roles",
    "show_resources",
])

def access_server(user_id,secret_key,call_server):
    # print server operations with index
    print("Available operations:")
    for i, operation in enumerate(server_operations):
        print(str(i)+". "+operation,end=" ")
    print()
    print("Please select an operation with index('9' to quit):")
    try:
        index = int(input())
    except ValueError:
        print("Invalid input")
        return True
    if index == 9:
        return False
    if index < 0 or index >= len(server_operations):
        print("Invalid operation index")
        return True
    operation = server_operations[index]
    print("You selected operation: "+operation)
    if operation == "show_roles":
        response = call_server(user_id,generate_otp_code(secret_key),operation,None,None)
        print(response.result)
        print(response.message)
        return True
    elif operation == "show_resources":
        response = call_server(user_id,generate_otp_code(secret_key),operation,None,None)
        print(response.result)
        print(response.message)
        return True
    elif operation == "add_role":
        role_name = input("Please enter the role name: ")
        response = call_server(user_id,generate_otp_code(secret_key),operation,None,role_name)
        print(response.result)
        print(response.message)
        return True
    else:
        resource_index = input("Please enter the resource index: ")
        content = None
        if operation == "w":
            content = input("Please enter the content: ")
        response = call_server(user_id,generate_otp_code(secret_key),operation,resource_index,content)
        print(response.result)
        print(response.message)
        return True
    
if __name__ == '__main__':
    rospy.init_node('client')
    user_id = 123
    secret_key = import_secret_key(str(user_id)+".otp_key")
    rospy.wait_for_service('RBAC')
    call_server = rospy.ServiceProxy('RBAC', access)
    while access_server(user_id,secret_key,call_server):
        pass