// Generated by gencpp from file RBAC/accessRequest.msg
// DO NOT EDIT!


#ifndef RBAC_MESSAGE_ACCESSREQUEST_H
#define RBAC_MESSAGE_ACCESSREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace RBAC
{
template <class ContainerAllocator>
struct accessRequest_
{
  typedef accessRequest_<ContainerAllocator> Type;

  accessRequest_()
    : user_id(0)
    , otp_code()
    , operation()
    , resource()
    , content()  {
    }
  accessRequest_(const ContainerAllocator& _alloc)
    : user_id(0)
    , otp_code(_alloc)
    , operation(_alloc)
    , resource(_alloc)
    , content(_alloc)  {
  (void)_alloc;
    }



   typedef uint32_t _user_id_type;
  _user_id_type user_id;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _otp_code_type;
  _otp_code_type otp_code;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _operation_type;
  _operation_type operation;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _resource_type;
  _resource_type resource;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _content_type;
  _content_type content;





  typedef boost::shared_ptr< ::RBAC::accessRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::RBAC::accessRequest_<ContainerAllocator> const> ConstPtr;

}; // struct accessRequest_

typedef ::RBAC::accessRequest_<std::allocator<void> > accessRequest;

typedef boost::shared_ptr< ::RBAC::accessRequest > accessRequestPtr;
typedef boost::shared_ptr< ::RBAC::accessRequest const> accessRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::RBAC::accessRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::RBAC::accessRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::RBAC::accessRequest_<ContainerAllocator1> & lhs, const ::RBAC::accessRequest_<ContainerAllocator2> & rhs)
{
  return lhs.user_id == rhs.user_id &&
    lhs.otp_code == rhs.otp_code &&
    lhs.operation == rhs.operation &&
    lhs.resource == rhs.resource &&
    lhs.content == rhs.content;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::RBAC::accessRequest_<ContainerAllocator1> & lhs, const ::RBAC::accessRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace RBAC

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::RBAC::accessRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::RBAC::accessRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::RBAC::accessRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::RBAC::accessRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::RBAC::accessRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::RBAC::accessRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::RBAC::accessRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ca0b23659350d6edf8723286fce3061f";
  }

  static const char* value(const ::RBAC::accessRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xca0b23659350d6edULL;
  static const uint64_t static_value2 = 0xf8723286fce3061fULL;
};

template<class ContainerAllocator>
struct DataType< ::RBAC::accessRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "RBAC/accessRequest";
  }

  static const char* value(const ::RBAC::accessRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::RBAC::accessRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint32 user_id\n"
"string otp_code\n"
"string operation\n"
"string resource\n"
"string content\n"
;
  }

  static const char* value(const ::RBAC::accessRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::RBAC::accessRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.user_id);
      stream.next(m.otp_code);
      stream.next(m.operation);
      stream.next(m.resource);
      stream.next(m.content);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct accessRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::RBAC::accessRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::RBAC::accessRequest_<ContainerAllocator>& v)
  {
    s << indent << "user_id: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.user_id);
    s << indent << "otp_code: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.otp_code);
    s << indent << "operation: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.operation);
    s << indent << "resource: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.resource);
    s << indent << "content: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.content);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RBAC_MESSAGE_ACCESSREQUEST_H