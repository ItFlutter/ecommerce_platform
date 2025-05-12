import 'package:admin/view/screen/categories/add.dart';
import 'package:admin/view/screen/coupon/add.dart';
import 'package:admin/view/screen/coupon/view.dart';
import 'package:admin/view/screen/delivery/view.dart';
import 'package:admin/view/screen/items/view.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/successresetpassword.dart';
import 'view/screen/auth/forgetpassword/verifycode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/successsignup.dart';
import 'view/screen/auth/verifycodesignup.dart';
import 'view/screen/categories/edit.dart';
import 'view/screen/categories/view.dart';
import 'view/screen/coupon/edit.dart';
import 'view/screen/delivery/add.dart';
import 'view/screen/delivery/edit.dart';
import 'view/screen/home.dart';
import 'view/screen/items/add.dart';
import 'view/screen/items/edit.dart';
import 'view/screen/language.dart';
import 'view/screen/orders/details.dart';
import 'view/screen/orders/screen.dart';
import 'view/screen/users.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
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
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  //Orders
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  //Catrgories
  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),
  //Items
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),
  //Orders
  GetPage(name: AppRoute.ordershome, page: () => const OrderScreen()),
  //Items
  GetPage(name: AppRoute.couponview, page: () => const CouponView()),
  GetPage(name: AppRoute.couponadd, page: () => const CouponAdd()),
  GetPage(name: AppRoute.couponedit, page: () => const CouponEdit()),
  //Users
  GetPage(name: AppRoute.usersview, page: () => const UsersView()),
  //Delivery
  GetPage(name: AppRoute.deliveryview, page: () => const DeliveryView()),
  GetPage(name: AppRoute.deliveryadd, page: () => const DeliveryAdd()),
  GetPage(name: AppRoute.deliveryedit, page: () => const DeliveryEdit()),
];
