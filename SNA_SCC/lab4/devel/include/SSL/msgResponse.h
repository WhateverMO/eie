// Generated by gencpp from file SSL/msgResponse.msg
// DO NOT EDIT!


#ifndef SSL_MESSAGE_MSGRESPONSE_H
#define SSL_MESSAGE_MSGRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace SSL
{
template <class ContainerAllocator>
struct msgResponse_
{
  typedef msgResponse_<ContainerAllocator> Type;

  msgResponse_()
    : response()  {
    }
  msgResponse_(const ContainerAllocator& _alloc)
    : response(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _response_type;
  _response_type response;





  typedef boost::shared_ptr< ::SSL::msgResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::SSL::msgResponse_<ContainerAllocator> const> ConstPtr;

}; // struct msgResponse_

typedef ::SSL::msgResponse_<std::allocator<void> > msgResponse;

typedef boost::shared_ptr< ::SSL::msgResponse > msgResponsePtr;
typedef boost::shared_ptr< ::SSL::msgResponse const> msgResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::SSL::msgResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::SSL::msgResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::SSL::msgResponse_<ContainerAllocator1> & lhs, const ::SSL::msgResponse_<ContainerAllocator2> & rhs)
{
  return lhs.response == rhs.response;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::SSL::msgResponse_<ContainerAllocator1> & lhs, const ::SSL::msgResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace SSL

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::SSL::msgResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::SSL::msgResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::SSL::msgResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::SSL::msgResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::SSL::msgResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::SSL::msgResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::SSL::msgResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7a8ac86bd49d372821ba8e969a9222cc";
  }

  static const char* value(const ::SSL::msgResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7a8ac86bd49d3728ULL;
  static const uint64_t static_value2 = 0x21ba8e969a9222ccULL;
};

template<class ContainerAllocator>
struct DataType< ::SSL::msgResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "SSL/msgResponse";
  }

  static const char* value(const ::SSL::msgResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::SSL::msgResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8[] response\n"
;
  }

  static const char* value(const ::SSL::msgResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::SSL::msgResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.response);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct msgResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::SSL::msgResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::SSL::msgResponse_<ContainerAllocator>& v)
  {
    s << indent << "response[]" << std::endl;
    for (size_t i = 0; i < v.response.size(); ++i)
    {
      s << indent << "  response[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.response[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SSL_MESSAGE_MSGRESPONSE_H