function validateEmail(input_str) {
  var re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  if (re.test(input_str))
  {
    return (true)
  }
    alert("Email không đúng định dạng.\nVD: abc@gmail.com")
    return (false)
}