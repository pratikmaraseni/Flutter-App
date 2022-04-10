import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/auth/auth_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/post_splash/post_splash_screen.dart';
import 'utils/auth.dart';
import 'utils/service_locator.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue[200],
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.blue[200],
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('nice');
  setupServiceLocator();
  runApp(const Nice());
}

class Nice extends StatelessWidget {
  const Nice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nice',
      theme: ThemeData(
        primaryColor: Colors.blue[200],
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(16.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const StadiumBorder()),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
        ),
        scaffoldBackgroundColor: Colors.blue[200],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[200],
          elevation: 0.0,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontWeight: FontWeight.bold)),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(16.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const StadiumBorder()),
          ),
        ),
      ),
      defaultTransition: Transition.cupertino,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
      ],
      home: const PostSplashScreen(),
      onInit: () {
        SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
          if (Auth.isLoggedIn == true) {
            print("Already logged in");
            Get.offAll(() => HomeScreen());
          } else {
            print("Not logged in");
            Get.offAll(() => const AuthScreen());
          }
        });
      },
    );
  }
}
