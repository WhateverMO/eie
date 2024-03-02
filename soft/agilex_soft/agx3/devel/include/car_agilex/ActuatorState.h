// Generated by gencpp from file car_agilex/ActuatorState.msg
// DO NOT EDIT!


#ifndef CAR_AGILEX_MESSAGE_ACTUATORSTATE_H
#define CAR_AGILEX_MESSAGE_ACTUATORSTATE_H


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
struct ActuatorState_
{
  typedef ActuatorState_<ContainerAllocator> Type;

  ActuatorState_()
    : motor_current(0.0)
    , motor_rpm(0.0)
    , motor_pulses(0)
    , motor_temperature(0.0)
    , driver_voltage(0.0)
    , driver_temperature(0.0)
    , driver_state(0)  {
    }
  ActuatorState_(const ContainerAllocator& _alloc)
    : motor_current(0.0)
    , motor_rpm(0.0)
    , motor_pulses(0)
    , motor_temperature(0.0)
    , driver_voltage(0.0)
    , driver_temperature(0.0)
    , driver_state(0)  {
  (void)_alloc;
    }



   typedef double _motor_current_type;
  _motor_current_type motor_current;

   typedef double _motor_rpm_type;
  _motor_rpm_type motor_rpm;

   typedef uint16_t _motor_pulses_type;
  _motor_pulses_type motor_pulses;

   typedef double _motor_temperature_type;
  _motor_temperature_type motor_temperature;

   typedef double _driver_voltage_type;
  _driver_voltage_type driver_voltage;

   typedef double _driver_temperature_type;
  _driver_temperature_type driver_temperature;

   typedef uint8_t _driver_state_type;
  _driver_state_type driver_state;





  typedef boost::shared_ptr< ::car_agilex::ActuatorState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::car_agilex::ActuatorState_<ContainerAllocator> const> ConstPtr;

}; // struct ActuatorState_

typedef ::car_agilex::ActuatorState_<std::allocator<void> > ActuatorState;

typedef boost::shared_ptr< ::car_agilex::ActuatorState > ActuatorStatePtr;
typedef boost::shared_ptr< ::car_agilex::ActuatorState const> ActuatorStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::car_agilex::ActuatorState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::car_agilex::ActuatorState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::car_agilex::ActuatorState_<ContainerAllocator1> & lhs, const ::car_agilex::ActuatorState_<ContainerAllocator2> & rhs)
{
  return lhs.motor_current == rhs.motor_current &&
    lhs.motor_rpm == rhs.motor_rpm &&
    lhs.motor_pulses == rhs.motor_pulses &&
    lhs.motor_temperature == rhs.motor_temperature &&
    lhs.driver_voltage == rhs.driver_voltage &&
    lhs.driver_temperature == rhs.driver_temperature &&
    lhs.driver_state == rhs.driver_state;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::car_agilex::ActuatorState_<ContainerAllocator1> & lhs, const ::car_agilex::ActuatorState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace car_agilex

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::car_agilex::ActuatorState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::car_agilex::ActuatorState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car_agilex::ActuatorState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car_agilex::ActuatorState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car_agilex::ActuatorState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car_agilex::ActuatorState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::car_agilex::ActuatorState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9fbd9d68394311e2609797770a9092c6";
  }

  static const char* value(const ::car_agilex::ActuatorState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9fbd9d68394311e2ULL;
  static const uint64_t static_value2 = 0x609797770a9092c6ULL;
};

template<class ContainerAllocator>
struct DataType< ::car_agilex::ActuatorState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "car_agilex/ActuatorState";
  }

  static const char* value(const ::car_agilex::ActuatorState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::car_agilex::ActuatorState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 motor_current\n"
"float64 motor_rpm\n"
"uint16 motor_pulses\n"
"float64 motor_temperature\n"
"\n"
"float64 driver_voltage\n"
"float64 driver_temperature\n"
"uint8 driver_state\n"
;
  }

  static const char* value(const ::car_agilex::ActuatorState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::car_agilex::ActuatorState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.motor_current);
      stream.next(m.motor_rpm);
      stream.next(m.motor_pulses);
      stream.next(m.motor_temperature);
      stream.next(m.driver_voltage);
      stream.next(m.driver_temperature);
      stream.next(m.driver_state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ActuatorState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::car_agilex::ActuatorState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::car_agilex::ActuatorState_<ContainerAllocator>& v)
  {
    s << indent << "motor_current: ";
    Printer<double>::stream(s, indent + "  ", v.motor_current);
    s << indent << "motor_rpm: ";
    Printer<double>::stream(s, indent + "  ", v.motor_rpm);
    s << indent << "motor_pulses: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.motor_pulses);
    s << indent << "motor_temperature: ";
    Printer<double>::stream(s, indent + "  ", v.motor_temperature);
    s << indent << "driver_voltage: ";
    Printer<double>::stream(s, indent + "  ", v.driver_voltage);
    s << indent << "driver_temperature: ";
    Printer<double>::stream(s, indent + "  ", v.driver_temperature);
    s << indent << "driver_state: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.driver_state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CAR_AGILEX_MESSAGE_ACTUATORSTATE_H
