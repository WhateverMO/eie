from rbac.resource import Resource
from rbac.role import Role
from rbac.user import User
from rbac.permission import Permission

class RBAC:
    def __init__(self):
        self.roles = {}
        self.users = {}
        self.resources = {}
        self.resources_index = 0
        
    def add_resource(self, resource_name, resource_content, executable=False, execute_print=None):
        resource = Resource(resource_name, resource_content, executable, execute_print)
        self.resources[self.resources_index] = resource
        self.resources_index += 1
        
    def add_role(self, role_name):
        role = Role(role_name)
        if role_name not in self.roles.keys():
            self.roles[role_name] = role
        else:
            raise ValueError("Role already exists")
        
    def add_user(self, user_id):
        if user_id not in self.users:
            self.users[user_id] = User(user_id)
        else:
            raise ValueError("User already exists")
        
    def add_resource2role(self, resource_index, role_name, writable, readable, executable):
        permission = Permission( readable, writable, executable)
        if role_name in self.roles.keys():
            role = self.roles[role_name]
            if resource_index in self.resources.keys():
                role.add_resource(resource_index, permission)
            else:
                raise ValueError("Resource does not exist")
        else:
            raise ValueError("Role does not exist")
    
    def update_role_resource_permission(self, role_name, resource_index, writable, readable, executable):
        permission = Permission(writable, readable, executable)
        if role_name in self.roles.keys():
            role = self.roles[role_name]
            if resource_index in self.resources.keys():
                role.change_permission(resource_index, permission)
            else:
                raise ValueError("Resource does not exist")
        else:
            raise ValueError("Role does not exist")
        
    def assign_role_to_user(self, user_id, role_name):
        if user_id not in self.users.keys():
            raise ValueError("User does not exist")
        user = self.users[user_id]
        if role_name in self.roles.keys():
            role = self.roles[role_name]
            user.add_role(role)
        else:
            raise ValueError("Role does not exist")
    
    def access_resource(self, user_id, resource_index, operation, content = None):
        if user_id not in self.users.keys():
            raise ValueError("User does not exist")
        user = self.users[user_id]
        return user.access(resource_index, operation, self.roles, self.resources, content)
        
    def get_all_resources(self):
        resources = {}
        for i, resource in self.resources.items():
            resources[i] = resource.name
        return resources
    
    def get_all_roles(self):
        return self.roles.keys()
    
    def get_all_users(self):
        return self.users.keys()