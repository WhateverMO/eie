// Generated by gencpp from file car_agilex/ScoutLightCmdResponse.msg
// DO NOT EDIT!


#ifndef CAR_AGILEX_MESSAGE_SCOUTLIGHTCMDRESPONSE_H
#define CAR_AGILEX_MESSAGE_SCOUTLIGHTCMDRESPONSE_H


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
struct ScoutLightCmdResponse_
{
  typedef ScoutLightCmdResponse_<ContainerAllocator> Type;

  ScoutLightCmdResponse_()
    : result(false)  {
    }
  ScoutLightCmdResponse_(const ContainerAllocator& _alloc)
    : result(false)  {
  (void)_alloc;
    }



   typedef uint8_t _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ScoutLightCmdResponse_

typedef ::car_agilex::ScoutLightCmdResponse_<std::allocator<void> > ScoutLightCmdResponse;

typedef boost::shared_ptr< ::car_agilex::ScoutLightCmdResponse > ScoutLightCmdResponsePtr;
typedef boost::shared_ptr< ::car_agilex::ScoutLightCmdResponse const> ScoutLightCmdResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator1> & lhs, const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator2> & rhs)
{
  return lhs.result == rhs.result;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator1> & lhs, const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace car_agilex

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "eb13ac1f1354ccecb7941ee8fa2192e8";
  }

  static const char* value(const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xeb13ac1f1354ccecULL;
  static const uint64_t static_value2 = 0xb7941ee8fa2192e8ULL;
};

template<class ContainerAllocator>
struct DataType< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "car_agilex/ScoutLightCmdResponse";
  }

  static const char* value(const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"bool result\n"
;
  }

  static const char* value(const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ScoutLightCmdResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::car_agilex::ScoutLightCmdResponse_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CAR_AGILEX_MESSAGE_SCOUTLIGHTCMDRESPONSE_H
