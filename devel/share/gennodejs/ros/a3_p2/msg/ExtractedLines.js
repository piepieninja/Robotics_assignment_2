// Auto-generated. Do not edit!

// (in-package a3_p2.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ExtractedLine = require('./ExtractedLine.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ExtractedLines {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lines = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lines')) {
        this.lines = initObj.lines
      }
      else {
        this.lines = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExtractedLines
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lines]
    // Serialize the length for message field [lines]
    bufferOffset = _serializer.uint32(obj.lines.length, buffer, bufferOffset);
    obj.lines.forEach((val) => {
      bufferOffset = ExtractedLine.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExtractedLines
    let len;
    let data = new ExtractedLines(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lines]
    // Deserialize array length for message field [lines]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.lines = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.lines[i] = ExtractedLine.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 56 * object.lines.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a3_p2/ExtractedLines';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '84df0150225154ce23ef2354bc707c6e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    ExtractedLine[] lines
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: a3_p2/ExtractedLine
    # The r and alpha parameters define the extracted line.
    float32 r
    float32 alpha
    #
    # The following points are used for display / debugging purposes only.
    # These points come from the position of the first and last laser scan points
    # used to estimate the line. They do not define the line and may not have even
    # been used in estimating the line (e.g. they may have exceeded the
    # maximum_range parameter). However, they are useful in visualizing what range
    # of scan points were used to estimate the line.
    geometry_msgs/Point firstScanPoint
    geometry_msgs/Point lastScanPoint
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ExtractedLines(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lines !== undefined) {
      resolved.lines = new Array(msg.lines.length);
      for (let i = 0; i < resolved.lines.length; ++i) {
        resolved.lines[i] = ExtractedLine.Resolve(msg.lines[i]);
      }
    }
    else {
      resolved.lines = []
    }

    return resolved;
    }
};

module.exports = ExtractedLines;
