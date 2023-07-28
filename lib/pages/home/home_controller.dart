import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'dart:math';

class home_controller extends GetxController {
  RxDouble cuota = 0.0.obs;
  RxDouble interest = 0.0.obs; 
  RxDouble credits = 0.0.obs; 


  Future<double> getcredit(String salary) async {
    double resultado = (double.parse(salary) * 7) / 0.15;
    return resultado;  
  }

  calcfee(type, cred, numfee) {
    double credit = double.parse(cred.replaceAll('\$', '').replaceAll('.', ''));

    switch(type){
      case 'Crédito de Vehiculo':
        interest.value = 0.3;
      break;
      case 'Crédito de Vivienda':
        interest.value = 0.1;
      break;
      case 'Crédito de Libre Inversión':
        interest.value = 0.35;
      break;
    }
    
    cuota.value = (credit * interest.value) / (1 - pow(1 + interest.value, int.parse(numfee)));

    credits.value = credit;
  }
  

}
