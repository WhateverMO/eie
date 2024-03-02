// Auto-generated. Do not edit!

// (in-package car_agilex.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ActuatorState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor_current = null;
      this.motor_rpm = null;
      this.motor_pulses = null;
      this.motor_temperature = null;
      this.driver_voltage = null;
      this.driver_temperature = null;
      this.driver_state = null;
    }
    else {
      if (initObj.hasOwnProperty('motor_current')) {
        this.motor_current = initObj.motor_current
      }
      else {
        this.motor_current = 0.0;
      }
      if (initObj.hasOwnProperty('motor_rpm')) {
        this.motor_rpm = initObj.motor_rpm
      }
      else {
        this.motor_rpm = 0.0;
      }
      if (initObj.hasOwnProperty('motor_pulses')) {
        this.motor_pulses = initObj.motor_pulses
      }
      else {
        this.motor_pulses = 0;
      }
      if (initObj.hasOwnProperty('motor_temperature')) {
        this.motor_temperature = initObj.motor_temperature
      }
      else {
        this.motor_temperature = 0.0;
      }
      if (initObj.hasOwnProperty('driver_voltage')) {
        this.driver_voltage = initObj.driver_voltage
      }
      else {
        this.driver_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('driver_temperature')) {
        this.driver_temperature = initObj.driver_temperature
      }
      else {
        this.driver_temperature = 0.0;
      }
      if (initObj.hasOwnProperty('driver_state')) {
        this.driver_state = initObj.driver_state
      }
      else {
        this.driver_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ActuatorState
    // Serialize message field [motor_current]
    bufferOffset = _serializer.float64(obj.motor_current, buffer, bufferOffset);
    // Serialize message field [motor_rpm]
    bufferOffset = _serializer.float64(obj.motor_rpm, buffer, bufferOffset);
    // Serialize message field [motor_pulses]
    bufferOffset = _serializer.uint16(obj.motor_pulses, buffer, bufferOffset);
    // Serialize message field [motor_temperature]
    bufferOffset = _serializer.float64(obj.motor_temperature, buffer, bufferOffset);
    // Serialize message field [driver_voltage]
    bufferOffset = _serializer.float64(obj.driver_voltage, buffer, bufferOffset);
    // Serialize message field [driver_temperature]
    bufferOffset = _serializer.float64(obj.driver_temperature, buffer, bufferOffset);
    // Serialize message field [driver_state]
    bufferOffset = _serializer.uint8(obj.driver_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ActuatorState
    let len;
    let data = new ActuatorState(null);
    // Deserialize message field [motor_current]
    data.motor_current = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [motor_rpm]
    data.motor_rpm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [motor_pulses]
    data.motor_pulses = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [motor_temperature]
    data.motor_temperature = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [driver_voltage]
    data.driver_voltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [driver_temperature]
    data.driver_temperature = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [driver_state]
    data.driver_state = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 43;
  }

  static datatype() {
    // Returns string type for a message object
    return 'car_agilex/ActuatorState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9fbd9d68394311e2609797770a9092c6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 motor_current
    float64 motor_rpm
    uint16 motor_pulses
    float64 motor_temperature
    
    float64 driver_voltage
    float64 driver_temperature
    uint8 driver_state
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ActuatorState(null);
    if (msg.motor_current !== undefined) {
      resolved.motor_current = msg.motor_current;
    }
    else {
      resolved.motor_current = 0.0
    }

    if (msg.motor_rpm !== undefined) {
      resolved.motor_rpm = msg.motor_rpm;
    }
    else {
      resolved.motor_rpm = 0.0
    }

    if (msg.motor_pulses !== undefined) {
      resolved.motor_pulses = msg.motor_pulses;
    }
    else {
      resolved.motor_pulses = 0
    }

    if (msg.motor_temperature !== undefined) {
      resolved.motor_temperature = msg.motor_temperature;
    }
    else {
      resolved.motor_temperature = 0.0
    }

    if (msg.driver_voltage !== undefined) {
      resolved.driver_voltage = msg.driver_voltage;
    }
    else {
      resolved.driver_voltage = 0.0
    }

    if (msg.driver_temperature !== undefined) {
      resolved.driver_temperature = msg.driver_temperature;
    }
    else {
      resolved.driver_temperature = 0.0
    }

    if (msg.driver_state !== undefined) {
      resolved.driver_state = msg.driver_state;
    }
    else {
      resolved.driver_state = 0
    }

    return resolved;
    }
};

module.exports = ActuatorState;
