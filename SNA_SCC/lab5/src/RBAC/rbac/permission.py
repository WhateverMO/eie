operations = ['r', 'w', 'x']

class operationError(Exception):
    def __init__(self, message):
        super().__init__(message)

class Permission:
    def __init__(self, readable, writable, executable):
        if not isinstance(readable, bool) or not isinstance(writable, bool) or not isinstance(executable, bool):
            raise TypeError('readable, writable, and executable must be boolean values')
        self.operations = {
            'r': readable,
            'w': writable,
            'x': executable
        }
    
    def update(self, permission):
        if not isinstance(permission, Permission):
            raise TypeError('permission must be an instance of Permission')
        for op in operations:
            self.operations[op] = permission.operations[op]
        
    def is_allowed(self, operation):
        if operation not in operations:
            raise operationError('Invalid operation')
        # print(self.operations)
        return self.operations[operation]
        