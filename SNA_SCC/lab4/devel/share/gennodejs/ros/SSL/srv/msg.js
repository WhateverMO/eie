// Auto-generated. Do not edit!

// (in-package SSL.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class msgRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.request = null;
    }
    else {
      if (initObj.hasOwnProperty('request')) {
        this.request = initObj.request
      }
      else {
        this.request = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type msgRequest
    // Serialize message field [request]
    bufferOffset = _arraySerializer.uint8(obj.request, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type msgRequest
    let len;
    let data = new msgRequest(null);
    // Deserialize message field [request]
    data.request = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.request.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'SSL/msgRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '225c0d3ce5e24840699723eab85d371d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8[] request
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new msgRequest(null);
    if (msg.request !== undefined) {
      resolved.request = msg.request;
    }
    else {
      resolved.request = []
    }

    return resolved;
    }
};

class msgResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.response = null;
    }
    else {
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type msgResponse
    // Serialize message field [response]
    bufferOffset = _arraySerializer.uint8(obj.response, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type msgResponse
    let len;
    let data = new msgResponse(null);
    // Deserialize message field [response]
    data.response = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.response.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'SSL/msgResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7a8ac86bd49d372821ba8e969a9222cc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8[] response
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new msgResponse(null);
    if (msg.response !== undefined) {
      resolved.response = msg.response;
    }
    else {
      resolved.response = []
    }

    return resolved;
    }
};

module.exports = {
  Request: msgRequest,
  Response: msgResponse,
  md5sum() { return 'c86ebe885efd9f142a198542f73f2d7f'; },
  datatype() { return 'SSL/msg'; }
};
