function validate(email,phone) {
  var re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  var re2 = /^\d{10}$/;
  if (!email.value.match(re))
  {
    alert("Email không đúng định dạng.\nVD: abc@gmail.com")
    return (false)
  }
  
  if (!phone.value.match(re2))
  {
    alert("Số điện thoại không đúng định dạng.\nVD: 0123456789")
    return (false)
  }
  
  return(true)
}
