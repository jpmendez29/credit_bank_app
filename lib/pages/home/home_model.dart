import '/flutter_flow/flutter_flow_util.dart';

import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';


class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Salary widget.
  TextEditingController? salaryController;
  String? Function(BuildContext, String?)? salaryControllerValidator;
  // State field(s) for Credit widget.
  TextEditingController? creditController;
  String? Function(BuildContext, String?)? creditControllerValidator;
  // State field(s) for Months widget.
  TextEditingController? monthsController;
  String? Function(BuildContext, String?)? monthsControllerValidator;

  String? _monthsControllerValidator(BuildContext context, String? val) {
    
    int valor = int.parse("${val}");
    if (val == null || val.isEmpty || valor <= 12 || valor >= 84) {
      return 'el numero de cuotas minimo es de 12 y maximo de 84';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    monthsControllerValidator = _monthsControllerValidator;

  }

  void dispose() {
    salaryController?.dispose();
    creditController?.dispose();
    monthsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
