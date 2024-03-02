// Generated by gencpp from file car_agilex/ScoutLightCmdRequest.msg
// DO NOT EDIT!


#ifndef CAR_AGILEX_MESSAGE_SCOUTLIGHTCMDREQUEST_H
#define CAR_AGILEX_MESSAGE_SCOUTLIGHTCMDREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace car_agilex
{
template <class ContainerAllocator>
struct ScoutLightCmdRequest_
{
  typedef ScoutLightCmdRequest_<ContainerAllocator> Type;

  ScoutLightCmdRequest_()
    : enable_ctrl(false)
    , front_mode(0)
    , front_custom_value(0)
    , rear_mode(0)
    , rear_custom_value(0)  {
    }
  ScoutLightCmdRequest_(const ContainerAllocator& _alloc)
    : enable_ctrl(false)
    , front_mode(0)
    , front_custom_value(0)
    , rear_mode(0)
    , rear_custom_value(0)  {
  (void)_alloc;
    }



   typedef uint8_t _enable_ctrl_type;
  _enable_ctrl_type enable_ctrl;

   typedef uint8_t _front_mode_type;
  _front_mode_type front_mode;

   typedef uint8_t _front_custom_value_type;
  _front_custom_value_type front_custom_value;

   typedef uint8_t _rear_mode_type;
  _rear_mode_type rear_mode;

   typedef uint8_t _rear_custom_value_type;
  _rear_custom_value_type rear_custom_value;





  typedef boost::shared_ptr< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ScoutLightCmdRequest_

typedef ::car_agilex::ScoutLightCmdRequest_<std::allocator<void> > ScoutLightCmdRequest;

typedef boost::shared_ptr< ::car_agilex::ScoutLightCmdRequest > ScoutLightCmdRequestPtr;
typedef boost::shared_ptr< ::car_agilex::ScoutLightCmdRequest const> ScoutLightCmdRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator1> & lhs, const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator2> & rhs)
{
  return lhs.enable_ctrl == rhs.enable_ctrl &&
    lhs.front_mode == rhs.front_mode &&
    lhs.front_custom_value == rhs.front_custom_value &&
    lhs.rear_mode == rhs.rear_mode &&
    lhs.rear_custom_value == rhs.rear_custom_value;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator1> & lhs, const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace car_agilex

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "491f290a6642f3abad6c4ec4fed97f2f";
  }

  static const char* value(const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x491f290a6642f3abULL;
  static const uint64_t static_value2 = 0xad6c4ec4fed97f2fULL;
};

template<class ContainerAllocator>
struct DataType< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "car_agilex/ScoutLightCmdRequest";
  }

  static const char* value(const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool enable_ctrl\n"
"\n"
"uint8 front_mode\n"
"uint8 front_custom_value\n"
"uint8 rear_mode\n"
"uint8 rear_custom_value\n"
"\n"
;
  }

  static const char* value(const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.enable_ctrl);
      stream.next(m.front_mode);
      stream.next(m.front_custom_value);
      stream.next(m.rear_mode);
      stream.next(m.rear_custom_value);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ScoutLightCmdRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::car_agilex::ScoutLightCmdRequest_<ContainerAllocator>& v)
  {
    s << indent << "enable_ctrl: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.enable_ctrl);
    s << indent << "front_mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.front_mode);
    s << indent << "front_custom_value: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.front_custom_value);
    s << indent << "rear_mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.rear_mode);
    s << indent << "rear_custom_value: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.rear_custom_value);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CAR_AGILEX_MESSAGE_SCOUTLIGHTCMDREQUEST_H
