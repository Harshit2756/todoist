import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repository/authentication/authentication_repository.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  // Add Widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp app) => Get.put(AuthenticatorRepository()));
  runApp(const MyApp());
}
