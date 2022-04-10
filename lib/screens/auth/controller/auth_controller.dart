import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../utils/auth.dart';
import '../../../utils/service_locator.dart';
import '../auth_screen.dart';
import '../change_password/service/change_password_service.dart';
import '../service/auth_service.dart';

class AuthController extends BaseController {
  final _authService = serviceLocator<AuthService>();
  final _changePasswordService = serviceLocator<ChangePasswordService>();

  logout() {
    _authService.logout(data: {'sessionId': Auth.sessionId});
    Auth.logout();
    Get.offAll(() => const AuthScreen());
  }
}
