// Generated by gencpp from file SSL/msg.msg
// DO NOT EDIT!


#ifndef SSL_MESSAGE_MSG_H
#define SSL_MESSAGE_MSG_H

#include <ros/service_traits.h>


#include <SSL/msgRequest.h>
#include <SSL/msgResponse.h>


namespace SSL
{

struct msg
{

typedef msgRequest Request;
typedef msgResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct msg
} // namespace SSL


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::SSL::msg > {
  static const char* value()
  {
    return "c86ebe885efd9f142a198542f73f2d7f";
  }

  static const char* value(const ::SSL::msg&) { return value(); }
};

template<>
struct DataType< ::SSL::msg > {
  static const char* value()
  {
    return "SSL/msg";
  }

  static const char* value(const ::SSL::msg&) { return value(); }
};


// service_traits::MD5Sum< ::SSL::msgRequest> should match
// service_traits::MD5Sum< ::SSL::msg >
template<>
struct MD5Sum< ::SSL::msgRequest>
{
  static const char* value()
  {
    return MD5Sum< ::SSL::msg >::value();
  }
  static const char* value(const ::SSL::msgRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::SSL::msgRequest> should match
// service_traits::DataType< ::SSL::msg >
template<>
struct DataType< ::SSL::msgRequest>
{
  static const char* value()
  {
    return DataType< ::SSL::msg >::value();
  }
  static const char* value(const ::SSL::msgRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::SSL::msgResponse> should match
// service_traits::MD5Sum< ::SSL::msg >
template<>
struct MD5Sum< ::SSL::msgResponse>
{
  static const char* value()
  {
    return MD5Sum< ::SSL::msg >::value();
  }
  static const char* value(const ::SSL::msgResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::SSL::msgResponse> should match
// service_traits::DataType< ::SSL::msg >
template<>
struct DataType< ::SSL::msgResponse>
{
  static const char* value()
  {
    return DataType< ::SSL::msg >::value();
  }
  static const char* value(const ::SSL::msgResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SSL_MESSAGE_MSG_H
