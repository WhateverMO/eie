// Auto-generated. Do not edit!

// (in-package car_agilex.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ActuatorState = require('./ActuatorState.js');
let LightState = require('./LightState.js');

//-----------------------------------------------------------

class ScoutState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.base_state = null;
      this.control_mode = null;
      this.fault_code = null;
      this.battery_voltage = null;
      this.actuator_states = null;
      this.light_control_enabled = null;
      this.front_light_state = null;
      this.rear_light_state = null;
      this.linear_velocity = null;
      this.angular_velocity = null;
      this.left_odometry = null;
      this.right_odometry = null;
    }
    else {
      if (initObj.hasOwnProperty('base_state')) {
        this.base_state = initObj.base_state
      }
      else {
        this.base_state = 0;
      }
      if (initObj.hasOwnProperty('control_mode')) {
        this.control_mode = initObj.control_mode
      }
      else {
        this.control_mode = 0;
      }
      if (initObj.hasOwnProperty('fault_code')) {
        this.fault_code = initObj.fault_code
      }
      else {
        this.fault_code = 0;
      }
      if (initObj.hasOwnProperty('battery_voltage')) {
        this.battery_voltage = initObj.battery_voltage
      }
      else {
        this.battery_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('actuator_states')) {
        this.actuator_states = initObj.actuator_states
      }
      else {
        this.actuator_states = [];
      }
      if (initObj.hasOwnProperty('light_control_enabled')) {
        this.light_control_enabled = initObj.light_control_enabled
      }
      else {
        this.light_control_enabled = false;
      }
      if (initObj.hasOwnProperty('front_light_state')) {
        this.front_light_state = initObj.front_light_state
      }
      else {
        this.front_light_state = new LightState();
      }
      if (initObj.hasOwnProperty('rear_light_state')) {
        this.rear_light_state = initObj.rear_light_state
      }
      else {
        this.rear_light_state = new LightState();
      }
      if (initObj.hasOwnProperty('linear_velocity')) {
        this.linear_velocity = initObj.linear_velocity
      }
      else {
        this.linear_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('angular_velocity')) {
        this.angular_velocity = initObj.angular_velocity
      }
      else {
        this.angular_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('left_odometry')) {
        this.left_odometry = initObj.left_odometry
      }
      else {
        this.left_odometry = 0.0;
      }
      if (initObj.hasOwnProperty('right_odometry')) {
        this.right_odometry = initObj.right_odometry
      }
      else {
        this.right_odometry = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ScoutState
    // Serialize message field [base_state]
    bufferOffset = _serializer.uint8(obj.base_state, buffer, bufferOffset);
    // Serialize message field [control_mode]
    bufferOffset = _serializer.uint8(obj.control_mode, buffer, bufferOffset);
    // Serialize message field [fault_code]
    bufferOffset = _serializer.uint8(obj.fault_code, buffer, bufferOffset);
    // Serialize message field [battery_voltage]
    bufferOffset = _serializer.float64(obj.battery_voltage, buffer, bufferOffset);
    // Serialize message field [actuator_states]
    // Serialize the length for message field [actuator_states]
    bufferOffset = _serializer.uint32(obj.actuator_states.length, buffer, bufferOffset);
    obj.actuator_states.forEach((val) => {
      bufferOffset = ActuatorState.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [light_control_enabled]
    bufferOffset = _serializer.bool(obj.light_control_enabled, buffer, bufferOffset);
    // Serialize message field [front_light_state]
    bufferOffset = LightState.serialize(obj.front_light_state, buffer, bufferOffset);
    // Serialize message field [rear_light_state]
    bufferOffset = LightState.serialize(obj.rear_light_state, buffer, bufferOffset);
    // Serialize message field [linear_velocity]
    bufferOffset = _serializer.float64(obj.linear_velocity, buffer, bufferOffset);
    // Serialize message field [angular_velocity]
    bufferOffset = _serializer.float64(obj.angular_velocity, buffer, bufferOffset);
    // Serialize message field [left_odometry]
    bufferOffset = _serializer.float64(obj.left_odometry, buffer, bufferOffset);
    // Serialize message field [right_odometry]
    bufferOffset = _serializer.float64(obj.right_odometry, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ScoutState
    let len;
    let data = new ScoutState(null);
    // Deserialize message field [base_state]
    data.base_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [control_mode]
    data.control_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [fault_code]
    data.fault_code = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [battery_voltage]
    data.battery_voltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [actuator_states]
    // Deserialize array length for message field [actuator_states]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.actuator_states = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.actuator_states[i] = ActuatorState.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [light_control_enabled]
    data.light_control_enabled = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [front_light_state]
    data.front_light_state = LightState.deserialize(buffer, bufferOffset);
    // Deserialize message field [rear_light_state]
    data.rear_light_state = LightState.deserialize(buffer, bufferOffset);
    // Deserialize message field [linear_velocity]
    data.linear_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angular_velocity]
    data.angular_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [left_odometry]
    data.left_odometry = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [right_odometry]
    data.right_odometry = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 43 * object.actuator_states.length;
    return length + 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'car_agilex/ScoutState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ad42d15ec27ffc879e399e0f8f4d5a2b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 base_state
    uint8 control_mode
    uint8 fault_code
    float64 battery_voltage
    
    ActuatorState[] actuator_states
    
    bool light_control_enabled
    LightState front_light_state
    LightState rear_light_state
    
    float64 linear_velocity
    float64 angular_velocity
    
    float64 left_odometry
    float64 right_odometry
    ================================================================================
    MSG: car_agilex/ActuatorState
    float64 motor_current
    float64 motor_rpm
    uint16 motor_pulses
    float64 motor_temperature
    
    float64 driver_voltage
    float64 driver_temperature
    uint8 driver_state
    ================================================================================
    MSG: car_agilex/LightState
    uint8 mode
    uint8 custom_value
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ScoutState(null);
    if (msg.base_state !== undefined) {
      resolved.base_state = msg.base_state;
    }
    else {
      resolved.base_state = 0
    }

    if (msg.control_mode !== undefined) {
      resolved.control_mode = msg.control_mode;
    }
    else {
      resolved.control_mode = 0
    }

    if (msg.fault_code !== undefined) {
      resolved.fault_code = msg.fault_code;
    }
    else {
      resolved.fault_code = 0
    }

    if (msg.battery_voltage !== undefined) {
      resolved.battery_voltage = msg.battery_voltage;
    }
    else {
      resolved.battery_voltage = 0.0
    }

    if (msg.actuator_states !== undefined) {
      resolved.actuator_states = new Array(msg.actuator_states.length);
      for (let i = 0; i < resolved.actuator_states.length; ++i) {
        resolved.actuator_states[i] = ActuatorState.Resolve(msg.actuator_states[i]);
      }
    }
    else {
      resolved.actuator_states = []
    }

    if (msg.light_control_enabled !== undefined) {
      resolved.light_control_enabled = msg.light_control_enabled;
    }
    else {
      resolved.light_control_enabled = false
    }

    if (msg.front_light_state !== undefined) {
      resolved.front_light_state = LightState.Resolve(msg.front_light_state)
    }
    else {
      resolved.front_light_state = new LightState()
    }

    if (msg.rear_light_state !== undefined) {
      resolved.rear_light_state = LightState.Resolve(msg.rear_light_state)
    }
    else {
      resolved.rear_light_state = new LightState()
    }

    if (msg.linear_velocity !== undefined) {
      resolved.linear_velocity = msg.linear_velocity;
    }
    else {
      resolved.linear_velocity = 0.0
    }

    if (msg.angular_velocity !== undefined) {
      resolved.angular_velocity = msg.angular_velocity;
    }
    else {
      resolved.angular_velocity = 0.0
    }

    if (msg.left_odometry !== undefined) {
      resolved.left_odometry = msg.left_odometry;
    }
    else {
      resolved.left_odometry = 0.0
    }

    if (msg.right_odometry !== undefined) {
      resolved.right_odometry = msg.right_odometry;
    }
    else {
      resolved.right_odometry = 0.0
    }

    return resolved;
    }
};

module.exports = ScoutState;
