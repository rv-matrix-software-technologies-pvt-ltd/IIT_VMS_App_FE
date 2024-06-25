import 'package:get/get.dart';
import 'package:vms_application/utils/constant/stringconstant.dart';
import 'package:vms_application/utils/error_view/common_nointernet_view.dart';
import 'package:vms_application/utils/web_view/common_webview.dart';
import 'package:vms_application/views/device_connection_qr/device_connection_qr.dart';
import 'package:vms_application/views/dynamic_id_card_view/dynamic_id_card_view.dart';
import 'package:vms_application/views/loginscreen_view/login_screen.dart';
import 'package:vms_application/views/loginscreen_view/password_reset_view/password_reset_view.dart';
import 'package:vms_application/views/loginscreen_view/user_types_view/user_types_view.dart';
import 'package:vms_application/views/registration_view/registration_status_view/registration_status_view.dart';
import 'package:vms_application/views/registration_view/registration_view.dart';
import 'package:vms_application/views/security_user_view/security_user_view.dart';
import 'package:vms_application/views/splashscreen_view/splash_screen.dart';
import 'package:vms_application/views/splashscreen_view/welcome_view/welcome_view.dart';
import 'package:vms_application/views/visitor_management_user_view/visitor_management_user_screen.dart';

List<GetPage> appRoutes = [
  GetPage(name: splashRoute, page: () => const SplashView()),
  GetPage(name: userTypeRoute, page: () => VisitorTypeView()),
  GetPage(name: welcomeRoute, page: () => const WelcomeScreen()),
  GetPage(name: loginRoute, page: () => const LoginView()),
  GetPage(name: registerRoute, page: () => const RegistrationView()),
  GetPage(name: registerStatusRoute, page: () => const RegistrationStatusView()),
  GetPage(name: visitorUserRoute, page: () => const VisitorManagementUserScreen()),
  GetPage(name: securityUserRoute, page: () => const SecurityUserScreen()),
  GetPage(name: securityQRAuthenticateRoute, page: () => const UserAuthenticationUsingQR()),
  GetPage(name: dynamicIDCardRoute, page: () => const DynamicIDCardView()),
  GetPage(name: passwordResetRoute, page: () => const PasswordResetView()),
  GetPage(name: errorRoute, page: () => const CommonNoInternetView()),
  GetPage(name: commonWebViewRoute, page: () => const CommonWebView()),
];