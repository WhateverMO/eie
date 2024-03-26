// Auto-generated. Do not edit!

// (in-package RBAC.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class accessRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.user_id = null;
      this.otp_code = null;
      this.operation = null;
      this.resource = null;
      this.content = null;
    }
    else {
      if (initObj.hasOwnProperty('user_id')) {
        this.user_id = initObj.user_id
      }
      else {
        this.user_id = 0;
      }
      if (initObj.hasOwnProperty('otp_code')) {
        this.otp_code = initObj.otp_code
      }
      else {
        this.otp_code = '';
      }
      if (initObj.hasOwnProperty('operation')) {
        this.operation = initObj.operation
      }
      else {
        this.operation = '';
      }
      if (initObj.hasOwnProperty('resource')) {
        this.resource = initObj.resource
      }
      else {
        this.resource = '';
      }
      if (initObj.hasOwnProperty('content')) {
        this.content = initObj.content
      }
      else {
        this.content = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type accessRequest
    // Serialize message field [user_id]
    bufferOffset = _serializer.uint32(obj.user_id, buffer, bufferOffset);
    // Serialize message field [otp_code]
    bufferOffset = _serializer.string(obj.otp_code, buffer, bufferOffset);
    // Serialize message field [operation]
    bufferOffset = _serializer.string(obj.operation, buffer, bufferOffset);
    // Serialize message field [resource]
    bufferOffset = _serializer.string(obj.resource, buffer, bufferOffset);
    // Serialize message field [content]
    bufferOffset = _serializer.string(obj.content, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type accessRequest
    let len;
    let data = new accessRequest(null);
    // Deserialize message field [user_id]
    data.user_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [otp_code]
    data.otp_code = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [operation]
    data.operation = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [resource]
    data.resource = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [content]
    data.content = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.otp_code);
    length += _getByteLength(object.operation);
    length += _getByteLength(object.resource);
    length += _getByteLength(object.content);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'RBAC/accessRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ca0b23659350d6edf8723286fce3061f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 user_id
    string otp_code
    string operation
    string resource
    string content
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new accessRequest(null);
    if (msg.user_id !== undefined) {
      resolved.user_id = msg.user_id;
    }
    else {
      resolved.user_id = 0
    }

    if (msg.otp_code !== undefined) {
      resolved.otp_code = msg.otp_code;
    }
    else {
      resolved.otp_code = ''
    }

    if (msg.operation !== undefined) {
      resolved.operation = msg.operation;
    }
    else {
      resolved.operation = ''
    }

    if (msg.resource !== undefined) {
      resolved.resource = msg.resource;
    }
    else {
      resolved.resource = ''
    }

    if (msg.content !== undefined) {
      resolved.content = msg.content;
    }
    else {
      resolved.content = ''
    }

    return resolved;
    }
};

class accessResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type accessResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type accessResponse
    let len;
    let data = new accessResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'RBAC/accessResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b543fbd3518c791be28589b850702201';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool result
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new accessResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: accessRequest,
  Response: accessResponse,
  md5sum() { return 'a35aabb2e81bd422fdd731c4a33a3278'; },
  datatype() { return 'RBAC/access'; }
};
