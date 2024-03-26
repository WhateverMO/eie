import rospy
from RBAC.srv import access, accessResponse
from OTP import generate_secret_key, exprot_secret_key, verify_otp_code
from rbac import RBAC,operations

server_operations = operations.copy()
server_operations.extend([
    "add_role",
    "show_roles",
    "show_resources",
])

class RBACServer:
    def __init__(self):
        self.rbac = RBAC()
        self.rbac.add_resource("readme.md", 'this is a test file')
        self.rbac.add_resource("lsinfo", 'this is a command to list all files and directories', True, 'this system is RBAC system')
        self.rbac.add_resource("hello", 'this is a command to say hello', True, 'hello')
        self.rbac.add_role("admin")
        self.rbac.add_role("user")
        self.rbac.add_role("guest")
        user_id = 123
        self.rbac.add_user(user_id)
        self.secret_key = {user_id: generate_secret_key()}
        exprot_secret_key(self.secret_key[user_id], str(user_id)+".otp_key")
        self.rbac.add_resource2role(0, "admin", True, True, False)
        self.rbac.add_resource2role(1, "admin", True, True, True)
        self.rbac.add_resource2role(2, "admin", True, True, True)
        self.rbac.add_resource2role(0, "user", False, True, False)
        self.rbac.add_resource2role(1, "user", True, True, True)
        self.rbac.add_resource2role(2, "user", False, True, True)
        self.rbac.add_resource2role(2, "guest", False, True, True)
    
    def handle_access_request(self, req:access):
        user_id = req.user_id
        otp_code = req.otp_code
        if not verify_otp_code(self.secret_key[user_id], str(user_id)+".otp_key", otp_code):
            return accessResponse(False, "Invalid OTP code")
        op = req.operation
        if op not in server_operations:
            return accessResponse(False, "Invalid operation it should be one of the following: " + str(server_operations))
        if op == "add_role":
            self.rbac.assign_role_to_user(user_id, req.content)
            return accessResponse(True, "Role added successfully")
        elif op == "show_roles":
            roles = self.rbac.get_all_roles()
            return accessResponse(True, "Roles: " + str(roles))
        elif op == "show_resources":
            resources = self.rbac.get_all_resources()
            return accessResponse(True, "Resources: " + str(resources))
        else:
            try:
                self.rbac.access_resource(user_id, req.resource, op, req.content)
                return accessResponse(True, "Access granted")
            except Exception as e:
                return accessResponse(False, str(e))

if __name__ == "__main__":
    rospy.init_node("rbac_server")
    server = RBACServer()
    s = rospy.Service("RBAC", access, server.handle_access_request)
    rospy.spin()

