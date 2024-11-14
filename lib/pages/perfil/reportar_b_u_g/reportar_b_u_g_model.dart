import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reportar_b_u_g_widget.dart' show ReportarBUGWidget;
import 'package:flutter/material.dart';

class ReportarBUGModel extends FlutterFlowModel<ReportarBUGWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}