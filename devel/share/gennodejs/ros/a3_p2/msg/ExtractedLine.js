// Auto-generated. Do not edit!

// (in-package a3_p2.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class ExtractedLine {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.r = null;
      this.alpha = null;
      this.firstScanPoint = null;
      this.lastScanPoint = null;
    }
    else {
      if (initObj.hasOwnProperty('r')) {
        this.r = initObj.r
      }
      else {
        this.r = 0.0;
      }
      if (initObj.hasOwnProperty('alpha')) {
        this.alpha = initObj.alpha
      }
      else {
        this.alpha = 0.0;
      }
      if (initObj.hasOwnProperty('firstScanPoint')) {
        this.firstScanPoint = initObj.firstScanPoint
      }
      else {
        this.firstScanPoint = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('lastScanPoint')) {
        this.lastScanPoint = initObj.lastScanPoint
      }
      else {
        this.lastScanPoint = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExtractedLine
    // Serialize message field [r]
    bufferOffset = _serializer.float32(obj.r, buffer, bufferOffset);
    // Serialize message field [alpha]
    bufferOffset = _serializer.float32(obj.alpha, buffer, bufferOffset);
    // Serialize message field [firstScanPoint]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.firstScanPoint, buffer, bufferOffset);
    // Serialize message field [lastScanPoint]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.lastScanPoint, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExtractedLine
    let len;
    let data = new ExtractedLine(null);
    // Deserialize message field [r]
    data.r = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [alpha]
    data.alpha = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [firstScanPoint]
    data.firstScanPoint = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [lastScanPoint]
    data.lastScanPoint = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'a3_p2/ExtractedLine';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f75a43af20e7eac85f98816304fa2031';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new ExtractedLine(null);
    if (msg.r !== undefined) {
      resolved.r = msg.r;
    }
    else {
      resolved.r = 0.0
    }

    if (msg.alpha !== undefined) {
      resolved.alpha = msg.alpha;
    }
    else {
      resolved.alpha = 0.0
    }

    if (msg.firstScanPoint !== undefined) {
      resolved.firstScanPoint = geometry_msgs.msg.Point.Resolve(msg.firstScanPoint)
    }
    else {
      resolved.firstScanPoint = new geometry_msgs.msg.Point()
    }

    if (msg.lastScanPoint !== undefined) {
      resolved.lastScanPoint = geometry_msgs.msg.Point.Resolve(msg.lastScanPoint)
    }
    else {
      resolved.lastScanPoint = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = ExtractedLine;
