class AppLink {
  // static const String server = "http://172.20.10.7/ecommerce";
  static const String server = "http://192.168.1.108/ecommerce/admin";
  // static const String server =
  //     "https://ahmaditecommerce.000webhostapp.com//ecommerce";
  // static const String server = "http://10.0.2.2/ecommerce";
  // ================================= Image ================================== //

  // static const String imagestatic = "http://172.20.10.7/ecommerce/upload";
  static const String imagestatic = "http://192.168.1.108/ecommerce/upload";
  // static const String imagestatic =
  //     "https://ahmaditecommerce.000webhostapp.com//ecommerce/upload";
  // static const String imagestatic = "http://10.0.2.2/ecommerce/upload";
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  // ================================= Auth ================================== //
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verfiycode = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";
  // ================================= ForgetPassword ================================== //
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";
  // ================================= Orders ================================== //
  static const String approveOrder = "$server/orders/approve.php";
  static const String prepare = "$server/orders/prepare.php";

  static const String viewArchiveOrders = "$server/orders/archive.php";
  static const String viewPendingOrders =
      "$server/orders/viewpendingorders.php";
  static const String viewAcceptedOrders =
      "$server/orders/viewacceptedorders.php";
  static const String detailsOrders = "$server/orders/details.php";
  // ================================= Categories ================================== //
  static const String categoriesview = "$server/categories/view.php";
  static const String categoriesadd = "$server/categories/add.php";
  static const String categoriesedit = "$server/categories/edit.php";
  static const String categoriesdelete = "$server/categories/delete.php";
  // ================================= Items ================================== //
  static const String itemsview = "$server/items/view.php";
  static const String itemsadd = "$server/items/add.php";
  static const String itemsedit = "$server/items/edit.php";
  static const String itemsdelete = "$server/items/delete.php";
  // ================================= Coupon ================================== //
  static const String couponview = "$server/coupon/view.php";
  static const String couponadd = "$server/coupon/add.php";
  static const String couponedit = "$server/coupon/edit.php";
  static const String coupondelete = "$server/coupon/delete.php";
  // ================================= Users ================================== //
  static const String usersview = "$server/users/view.php";
  static const String usersdelete = "$server/users/delete.php";
  // ================================= Delivery ================================== //
  static const String deliveryview = "$server/delivery/view.php";
  static const String deliverydelete = "$server/delivery/delete.php";
  static const String deliveryadd = "$server/delivery/add.php";
  static const String deliveryedit = "$server/delivery/edit.php";
}
