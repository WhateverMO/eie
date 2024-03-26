from rbac.accessControl import AccessControl
from rbac.permission import Permission, operationError

class RoleAlreadyExistsError(Exception):
    def __init__(self, role_name):
        self.role_name = role_name
        super().__init__(f"Role {role_name} already exists")
        

class RoleNotFoundError(Exception):
    def __init__(self, role_name):
        self.role_name = role_name
        super().__init__(f"Role {role_name} not found")

        
class Role:
    def __init__(self, name):
        self.name = name
        self.access_control = AccessControl('permission object')
        
    def add_resource(self, resource, permission):
        self.access_control.add_controler(resource)
        self.access_control.add_rule(resource, permission)
        
    def access(self, resource_index, operation, resouce_dict, content = None):
        permission = self.access_control.check_permission(resource_index)
        if permission.is_allowed(operation):
            resource = resouce_dict[resource_index]
            resource.operate(operation, content)
        else:
            raise operationError(f"Operation {operation} is not allowed for Role {self.name} on {resource}")
        
    def change_permission(self, resource, permission):
        permission = self.access_control.check_permission(resource)
        permission.update(permission)