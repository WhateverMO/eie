class AccessControlerInitError(Exception):
    def __init__(self, message):
        super().__init__(self.message)
        
class AccessControlerPermissionError(Exception):
    def __init__(self, message):
        super().__init__(self.message)

class AccessControl:
    def __init__(self, init_rule = None):
        if init_rule is None:
            raise AccessControlerInitError("Init Rule is None,it should be ['set','permission object']")
        elif init_rule not in ['set', 'permission object']:
            raise AccessControlerInitError("Init Rule should be ['set','permission object']")
        self.init_rule = init_rule
        if self.init_rule == 'set':
            self.AccessControlTable = ()
        elif self.init_rule == 'permission object':
            self.AccessControlTable = {}
        
    def add_controler(self, controler):
        if self.init_rule == 'set':
            self.AccessControlTable += (controler,)
        elif self.init_rule == 'permission object':
            self.AccessControlTable[controler] = None
        
    def add_rule(self, controler, rule):
        if self.init_rule == 'set':
            raise AccessControlerInitError("Init Rule is 'set',this method is not allowed")
        elif self.init_rule == 'permission object':
            self.AccessControlTable[controler] = rule
        
    def check_permission(self, controler=None):
        if self.init_rule == 'set':
            if controler is not None:
                raise AccessControlerPermissionError("Controler is not None,it should be None")
            ret = ()
            ret += self.AccessControlTable
            return ret
        elif self.init_rule == 'permission object':
            return self.AccessControlTable[controler]