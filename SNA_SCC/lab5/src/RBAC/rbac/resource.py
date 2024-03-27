from rbac.permission import operations

class ResourceAlreadyExistsError(Exception):
    def __init__(self, resource_name):
        self.resource_name = resource_name
        super().__init__(f"Resource {resource_name} already exists")

class ResourceNotFoundError(Exception):
    def __init__(self, resource_name):
        self.resource_name = resource_name
        super().__init__(f"Resource {resource_name} not found")

class ResourceExecutionError(Exception):
    def __init__(self, resource_name, error):
        self.resource_name = resource_name
        self.error = error
        super().__init__(f"Error executing resource {resource_name}: {error}")

class Resource:
    def __init__(self, name, content, executable=False, execute_print=None):
        self.name = name
        self.content = content
        if executable:
            self.executable = True
            if execute_print is None:
                raise ResourceExecutionError(name, "Executable resource must have execute_print String")
            self.execute_print = execute_print
        else:
            self.executable = False

    def execute(self):
        if not self.executable:
            raise ResourceExecutionError(self.name, "Resource is not executable")
        print('Executing resource:', self.name)
        print(self.execute_print)
        print('Resource content:', self.content)
        print('Execution complete.')
        
    def operate(self, operation, content = None):
        if operation not in operations:
            raise ValueError(f"Invalid operation: {operation}")
        if operation == 'r':
            return self.content
        elif operation == 'w':
            if content is None:
                raise ValueError("Content must be provided for write operation")
            self.content = content
            return True
        elif operation == 'x':
            self.execute()
            return True
        else:
            raise ValueError(f"Invalid operation: {operation}")