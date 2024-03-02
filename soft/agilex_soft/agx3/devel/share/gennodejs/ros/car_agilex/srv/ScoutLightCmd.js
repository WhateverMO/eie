// Auto-generated. Do not edit!

// (in-package car_agilex.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ScoutLightCmdRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.enable_ctrl = null;
      this.front_mode = null;
      this.front_custom_value = null;
      this.rear_mode = null;
      this.rear_custom_value = null;
    }
    else {
      if (initObj.hasOwnProperty('enable_ctrl')) {
        this.enable_ctrl = initObj.enable_ctrl
      }
      else {
        this.enable_ctrl = false;
      }
      if (initObj.hasOwnProperty('front_mode')) {
        this.front_mode = initObj.front_mode
      }
      else {
        this.front_mode = 0;
      }
      if (initObj.hasOwnProperty('front_custom_value')) {
        this.front_custom_value = initObj.front_custom_value
      }
      else {
        this.front_custom_value = 0;
      }
      if (initObj.hasOwnProperty('rear_mode')) {
        this.rear_mode = initObj.rear_mode
      }
      else {
        this.rear_mode = 0;
      }
      if (initObj.hasOwnProperty('rear_custom_value')) {
        this.rear_custom_value = initObj.rear_custom_value
      }
      else {
        this.rear_custom_value = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ScoutLightCmdRequest
    // Serialize message field [enable_ctrl]
    bufferOffset = _serializer.bool(obj.enable_ctrl, buffer, bufferOffset);
    // Serialize message field [front_mode]
    bufferOffset = _serializer.uint8(obj.front_mode, buffer, bufferOffset);
    // Serialize message field [front_custom_value]
    bufferOffset = _serializer.uint8(obj.front_custom_value, buffer, bufferOffset);
    // Serialize message field [rear_mode]
    bufferOffset = _serializer.uint8(obj.rear_mode, buffer, bufferOffset);
    // Serialize message field [rear_custom_value]
    bufferOffset = _serializer.uint8(obj.rear_custom_value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ScoutLightCmdRequest
    let len;
    let data = new ScoutLightCmdRequest(null);
    // Deserialize message field [enable_ctrl]
    data.enable_ctrl = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [front_mode]
    data.front_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [front_custom_value]
    data.front_custom_value = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [rear_mode]
    data.rear_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [rear_custom_value]
    data.rear_custom_value = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'car_agilex/ScoutLightCmdRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '491f290a6642f3abad6c4ec4fed97f2f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool enable_ctrl
    
    uint8 front_mode
    uint8 front_custom_value
    uint8 rear_mode
    uint8 rear_custom_value
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ScoutLightCmdRequest(null);
    if (msg.enable_ctrl !== undefined) {
      resolved.enable_ctrl = msg.enable_ctrl;
    }
    else {
      resolved.enable_ctrl = false
    }

    if (msg.front_mode !== undefined) {
      resolved.front_mode = msg.front_mode;
    }
    else {
      resolved.front_mode = 0
    }

    if (msg.front_custom_value !== undefined) {
      resolved.front_custom_value = msg.front_custom_value;
    }
    else {
      resolved.front_custom_value = 0
    }

    if (msg.rear_mode !== undefined) {
      resolved.rear_mode = msg.rear_mode;
    }
    else {
      resolved.rear_mode = 0
    }

    if (msg.rear_custom_value !== undefined) {
      resolved.rear_custom_value = msg.rear_custom_value;
    }
    else {
      resolved.rear_custom_value = 0
    }

    return resolved;
    }
};

class ScoutLightCmdResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ScoutLightCmdResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ScoutLightCmdResponse
    let len;
    let data = new ScoutLightCmdResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'car_agilex/ScoutLightCmdResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool result
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ScoutLightCmdResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ScoutLightCmdRequest,
  Response: ScoutLightCmdResponse,
  md5sum() { return '2047fb36251c93f820b26cd1be3ecace'; },
  datatype() { return 'car_agilex/ScoutLightCmd'; }
};
