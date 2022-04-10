import 'package:get_storage/get_storage.dart';

final box = GetStorage('nice');

class Auth {
  Auth();

  static setSessionId(String sessionId) => box.write("sessionId", sessionId);

  static setUserId(int id) => box.write("userId", id);

  static setGroupId(int id) => box.write("groupId", id);

  static setFullName(String fullName) => box.write('fullName', fullName);

  static setGroupName(String groupName) => box.write('groupName', groupName);

  static setEmail(String email) => box.write('email', email);

  static setPosition(String position) => box.write('position', position);

  static setProfileImage(String path) => box.write('profileImage', path);

  static logout() => box.erase();

  static String get sessionId => box.read('sessionId');

  static int get userId => box.read('userId');

  static int get groupId => box.read('groupId');

  static String get groupName => box.read('groupName');

  static String get fullName => box.read('fullName');

  static String get email => box.read('email');

  static String get position => box.read('position');

  static String get profileImage => box.read('profileImage');

  static bool get isLoggedIn => box.hasData("fullName");
}
