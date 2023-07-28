import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:credit_bank_app/pages/register/usuarios_model.dart';
import 'package:credit_bank_app/pages/profile/profile_controller.dart';


class register_controller extends GetxController {

  late final List<usuario_model> usuarios = <usuario_model>[
    usuario_model(
      email: "hola123",
      pasw: "12345",
      userProfile: UserProfile(
        id: '1',
        name: 'David Maldonado',
      ),
    ),
  ].obs;

  Future<void> setuser(em, pasw, name, id) async => {
        usuarios.add(usuario_model(email: em, pasw: pasw, userProfile: UserProfile( id: id, name: name))),
      };

  String usr() {
    final user =
        usuarios.map((e) => {"usuario : ${e.email},contraseña : ${e.pasw} , nombre: ${e.userProfile.name}, id: ${e.userProfile.id}"});
    return "$user";
  }

  usuario_model? currentUser;
  bool validatepasw(usr, pasw, name, id) {
    setuser(usr, pasw, name, id);
    return true;
  }

  bool exist(email, pasw) {
    try {
      final usexist = usuarios.singleWhere((element) => element.email == email);
      if (usexist.pasw == pasw) {
        currentUser = usexist;
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
