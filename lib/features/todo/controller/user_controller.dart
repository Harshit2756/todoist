import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../common/widgets/popups/full_screen_loader.dart';
import '../../../common/widgets/popups/loaders.dart';
import '../../../data/repository/authentication/authentication_repository.dart';
import '../../../data/repository/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../authentication/models/user_model.dart';
import '../../authentication/screens/login/login.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variables
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Get User Details
    fetchUserDetails();
  }

  /// Fetch User Details
  Future<void> fetchUserDetails() async {
    try {
      profileLoading(true);
      // fetch user details from firebase
      final currentUser = await userRepository.fetchUserDetails();
      user(currentUser);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading(false);
    }
  }

  /// Save User Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // First Update Rx User and then check if user data is already stored. if not store new data.
      fetchUserDetails();

      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // Convert Name to First Name and Last Name
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUserName(
              userCredential.user!.displayName ?? '');

          // Create User Model
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save User Record in firebase
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      HLoarders.waringSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }

  /// Re-Authenticate User
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      HFullScreenLoader.openLoadingDialog(
        'Processing....',
        HImages.loadingAnimations,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        HFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        HFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticatorRepository.instance.reAuthenticateEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      AuthenticatorRepository.instance.deleteAccount();

      // Stop Loading
      HFullScreenLoader.stopLoading();

      // Redirect to the relevant screen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      HFullScreenLoader.stopLoading();

      HLoarders.errorSnackBar(title: 'Oh Snap!', message: 'error: $e');
    }
  }
}
