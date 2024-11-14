import '/flutter_flow/flutter_flow_util.dart';
import 'recuperar_senha_widget.dart' show RecuperarSenhaWidget;
import 'package:flutter/material.dart';

class RecuperarSenhaModel extends FlutterFlowModel<RecuperarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
