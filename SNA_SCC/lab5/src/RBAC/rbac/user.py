from rbac.accessControl import AccessControl
from rbac.role import Role

class UserAlreadyExists(Exception):
    def __init__(self, user_id):
        self.user_id = user_id
        super().__init__(f"User with id {user_id} already exists")

class UserNotFound(Exception):
    def __init__(self, user_id):
        self.user_id = user_id
        super().__init__(f"User with id {user_id} not found")
        
class User:
    def __init__(self, user_id):
        self.user_id = user_id
        self.access_control = AccessControl('set')

    def add_role(self, role):
        self.access_control.add_controler(role)
        
    def access(self, resource, operation, role_dict, resource_dict, content = None):
        roles = self.access_control.check_permission()
        for role in roles:
            role = role_dict[role.name]
            try:
                ret = role.access(resource, operation, resource_dict, content)
                if ret:
                    return ret
            except KeyError:
                continue
        return False