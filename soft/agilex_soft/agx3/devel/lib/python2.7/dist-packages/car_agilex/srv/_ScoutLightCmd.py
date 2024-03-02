# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from car_agilex/ScoutLightCmdRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ScoutLightCmdRequest(genpy.Message):
  _md5sum = "491f290a6642f3abad6c4ec4fed97f2f"
  _type = "car_agilex/ScoutLightCmdRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """bool enable_ctrl

uint8 front_mode
uint8 front_custom_value
uint8 rear_mode
uint8 rear_custom_value

"""
  __slots__ = ['enable_ctrl','front_mode','front_custom_value','rear_mode','rear_custom_value']
  _slot_types = ['bool','uint8','uint8','uint8','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       enable_ctrl,front_mode,front_custom_value,rear_mode,rear_custom_value

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ScoutLightCmdRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.enable_ctrl is None:
        self.enable_ctrl = False
      if self.front_mode is None:
        self.front_mode = 0
      if self.front_custom_value is None:
        self.front_custom_value = 0
      if self.rear_mode is None:
        self.rear_mode = 0
      if self.rear_custom_value is None:
        self.rear_custom_value = 0
    else:
      self.enable_ctrl = False
      self.front_mode = 0
      self.front_custom_value = 0
      self.rear_mode = 0
      self.rear_custom_value = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_5B().pack(_x.enable_ctrl, _x.front_mode, _x.front_custom_value, _x.rear_mode, _x.rear_custom_value))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 5
      (_x.enable_ctrl, _x.front_mode, _x.front_custom_value, _x.rear_mode, _x.rear_custom_value,) = _get_struct_5B().unpack(str[start:end])
      self.enable_ctrl = bool(self.enable_ctrl)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_5B().pack(_x.enable_ctrl, _x.front_mode, _x.front_custom_value, _x.rear_mode, _x.rear_custom_value))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 5
      (_x.enable_ctrl, _x.front_mode, _x.front_custom_value, _x.rear_mode, _x.rear_custom_value,) = _get_struct_5B().unpack(str[start:end])
      self.enable_ctrl = bool(self.enable_ctrl)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_5B = None
def _get_struct_5B():
    global _struct_5B
    if _struct_5B is None:
        _struct_5B = struct.Struct("<5B")
    return _struct_5B
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from car_agilex/ScoutLightCmdResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ScoutLightCmdResponse(genpy.Message):
  _md5sum = "eb13ac1f1354ccecb7941ee8fa2192e8"
  _type = "car_agilex/ScoutLightCmdResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """
bool result
"""
  __slots__ = ['result']
  _slot_types = ['bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       result

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ScoutLightCmdResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.result is None:
        self.result = False
    else:
      self.result = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.result
      buff.write(_get_struct_B().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 1
      (self.result,) = _get_struct_B().unpack(str[start:end])
      self.result = bool(self.result)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.result
      buff.write(_get_struct_B().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 1
      (self.result,) = _get_struct_B().unpack(str[start:end])
      self.result = bool(self.result)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
class ScoutLightCmd(object):
  _type          = 'car_agilex/ScoutLightCmd'
  _md5sum = '2047fb36251c93f820b26cd1be3ecace'
  _request_class  = ScoutLightCmdRequest
  _response_class = ScoutLightCmdResponse