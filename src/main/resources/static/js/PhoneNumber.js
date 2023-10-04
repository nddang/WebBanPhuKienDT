function validatePhoneNumber(input_str) {
  var re = /^\d{10}$/;
  if (input_str.value.match(re))
  {
    return (true)
  }
    alert("Số điện thoại không đúng định dạng.\nVD: 0123456789")
    return (false)
}