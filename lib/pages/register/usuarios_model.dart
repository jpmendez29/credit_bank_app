import 'package:credit_bank_app/pages/profile/profile_controller.dart';
import 'package:get/get.dart';

class usuario_model extends GetxController {
  String email;
  String pasw;
  UserProfile userProfile;

  usuario_model({
    required this.email,
    required this.pasw,
    required this.userProfile,
  });
}
