import 'package:get/get.dart';

class table_model extends GetxController {
  double saldo;
  int numcuotas;
  double cuota;
  double interes;
  double abono;
  double saldoperiodo;

  table_model({
    required this.saldo,
    required this.numcuotas,
    required this.cuota,
    required this.interes,
    required this.abono,
    required this.saldoperiodo,
  });

}
