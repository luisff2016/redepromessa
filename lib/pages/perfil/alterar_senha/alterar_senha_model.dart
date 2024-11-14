import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alterar_senha_widget.dart' show AlterarSenhaWidget;
import 'package:flutter/material.dart';

class AlterarSenhaModel extends FlutterFlowModel<AlterarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for password-current widget.
  FocusNode? passwordCurrentFocusNode;
  TextEditingController? passwordCurrentTextController;
  late bool passwordCurrentVisibility;
  String? Function(BuildContext, String?)?
      passwordCurrentTextControllerValidator;
  // State field(s) for password-new widget.
  FocusNode? passwordNewFocusNode;
  TextEditingController? passwordNewTextController;
  late bool passwordNewVisibility;
  String? Function(BuildContext, String?)? passwordNewTextControllerValidator;
  // State field(s) for password-new-confirm widget.
  FocusNode? passwordNewConfirmFocusNode;
  TextEditingController? passwordNewConfirmTextController;
  late bool passwordNewConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordNewConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
    passwordCurrentVisibility = false;
    passwordNewVisibility = false;
    passwordNewConfirmVisibility = false;
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    passwordCurrentFocusNode?.dispose();
    passwordCurrentTextController?.dispose();

    passwordNewFocusNode?.dispose();
    passwordNewTextController?.dispose();

    passwordNewConfirmFocusNode?.dispose();
    passwordNewConfirmTextController?.dispose();
  }
}
