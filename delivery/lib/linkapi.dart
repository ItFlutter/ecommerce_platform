class AppLink {
  // static const String server = "http://172.20.10.7/ecommerce";
  static const String server = "http://192.168.1.103/ecommerce";
  // static const String server =
  //     "https://ahmaditecommerce.000webhostapp.com//ecommerce";
  // static const String server = "http://10.0.2.2/ecommerce";
  // ================================= Image =============================== === //

  // static const String imagestatic = "http://172.20.10.7/ecommerce/upload";
  static const String imagestatic = "http://192.168.1.103/ecommerce/upload";
  // static const String imagestatic =
  //     "https://ahmaditecommerce.000webhostapp.com//ecommerce/upload";
  // static const String imagestatic = "http://10.0.2.2/ecommerce/upload";
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  // ================================= Auth ================================== //
  static const String signUp = "$server/delivery/auth/signup.php";
  static const String login = "$server/delivery/auth/login.php";
  static const String verfiycode = "$server/delivery/auth/verfiycode.php";
  static const String resend = "$server/delivery/auth/resend.php";
  // ================================= ForgetPassword ================================== //
  static const String resetPassword =
      "$server/delivery/forgetpassword/resetpassword.php";
  static const String checkEmail =
      "$server/delivery/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/delivery/forgetpassword/verifycode.php";
  // ================================= Orders ================================== //
  static const String viewPendingOrders = "$server/delivery/orders/pending.php";
  static const String viewAcceptedOrders =
      "$server/delivery/orders/accepted.php";
  static const String viewArchiveOrders = "$server/delivery/orders/archive.php";
  static const String approveOrder = "$server/delivery/orders/approve.php";
  static const String detailsOrders = "$server/delivery/orders/details.php";
  static const String doneOrders = "$server/delivery/orders/done.php";
}
