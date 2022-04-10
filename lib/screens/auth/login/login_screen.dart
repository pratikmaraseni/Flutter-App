import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../home/components/top_bar.dart';
import '../change_password/controller/change_password_controller.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _loginController = Get.put(LoginController());
  final _changePasswordController = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          label: const Text('ログイン'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset("assets/sun.svg"),
              ),
              Form(
                key: _loginController.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'メールアドレス',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      key: _changePasswordController.fieldKey,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null) {
                          value = value.trim();
                          if (value.isEmpty) {
                            return 'Enter your email';
                          }
                          if (!value.isEmail) {
                            return 'Enter a valid email';
                          }
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value != null) {
                          _loginController.mail = value.trim();
                          _changePasswordController.mail = value.trim();
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'パスワード',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null) {
                          value = value.trim();
                          if (value.isEmpty) {
                            return 'Enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be 6 characters or more';
                          }
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value != null) {
                          _loginController.password = value.trim();
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _loginController.login();
                      },
                      child: const Text('ログイン'),
                    ),
                    const SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          _changePasswordController.requestOtp();
                        },
                        child: const Text('パスワードを忘れた'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
