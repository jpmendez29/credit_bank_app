import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:credit_bank_app/pages/results/table_model.dart';



class results_controller extends GetxController {

  late final List<table_model> tablarow = <table_model>[].obs;

  Future<void> setrow(saldo, numcuotas, cuota, interes, abono, saldoperiodo) async => {
        tablarow.add(table_model(saldo: saldo, numcuotas: numcuotas, cuota: cuota , interes: interes, abono: abono, saldoperiodo: saldoperiodo)),
  };
}
