import 'package:delivery/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:delivery/view/screen/auth/signup.dart';
import 'package:delivery/view/screen/auth/successsignup.dart';
import 'package:delivery/view/screen/auth/verifycodesignup.dart';
import 'package:delivery/view/screen/language.dart';
import 'package:delivery/view/screen/orders/details.dart';
import 'package:delivery/view/screen/orders/tracking.dart';
import 'package:delivery/view/screen/test.dart';
import 'package:delivery/view/screen/test2.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/homescreen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(
  //   name: "/",
  //   page: () => const Test(),
  // ),
  //TEST

  GetPage(
    name: AppRoute.test2,
    page: () => const Test2(),
  ),
  //Auth
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SucessSignUp()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  //Home
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  //Orders
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  //Tracking
  GetPage(name: AppRoute.tracking, page: () => const OrdersTracking()),
];
