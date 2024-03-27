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
        rospy.loginfo("Received access request for user " + str(req.user_id) + " with operation " + str(req.operation) + " on resource " + str(req.resource) + " with content " + str(req.content))
        user_id = req.user_id
        otp_code = req.otp_code
        if not verify_otp_code(self.secret_key[user_id], otp_code):
            return accessResponse(False, "Invalid OTP code")
        op = req.operation
        if op not in server_operations:
            return accessResponse(False, "Invalid operation it should be one of the following: " + str(server_operations))
        if op == "add_role":
            self.rbac.assign_role_to_user(user_id, req.content)
            rospy.loginfo("Role added to user " + str(user_id) + " with content " + str(req.content))
            return accessResponse(True, "Role added successfully")
        elif op == "show_roles":
            roles = self.rbac.get_all_roles()
            rospy.loginfo("Roles: " + str(roles))
            return accessResponse(True, "Roles: " + str(roles))
        elif op == "show_resources":
            resources = self.rbac.get_all_resources()
            rospy.loginfo("Resources: " + str(resources))
            return accessResponse(True, "Resources: " + str(resources))
        else:
            try:
                if req.content == "":
                    content = None
                else:
                    content = req.content
                try:
                    resource_index = int(req.resource)
                except:
                    resource_index = None
                resources = self.rbac.access_resource(user_id, resource_index, op, content)
                if not resources:
                    resources = "Access denied"
                elif resources == True:
                    resources = "Access granted"
                rospy.loginfo("Access granted to user " + str(user_id) + " for operation " + str(op) + " on resource " + str(req.resource) + " with content " + str(req.content))
                return accessResponse(True, resources)
            except Exception as e:
                msg = "Access denied to user " + str(user_id) + " for operation " + str(op) + " on resource " + str(req.resource) + " with content " + str(req.content) + " due to error: " + str(e)
                rospy.loginfo(msg)
                # import traceback
                # traceback.print_exc()
                return accessResponse(False, msg)

if __name__ == "__main__":
    rospy.init_node("rbac_server")
    server = RBACServer()
    s = rospy.Service("RBAC", access, server.handle_access_request)
    rospy.spin()

