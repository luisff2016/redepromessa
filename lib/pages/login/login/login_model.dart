import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for txf_email_login widget.
  FocusNode? txfEmailLoginFocusNode;
  TextEditingController? txfEmailLoginTextController;
  String? Function(BuildContext, String?)? txfEmailLoginTextControllerValidator;
  String? _txfEmailLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2nx5fouw' /* Email invalido! */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'dslcea5t' /* Digite um email valido! */,
      );
    }
    return null;
  }

  // State field(s) for txf_senha_login widget.
  FocusNode? txfSenhaLoginFocusNode;
  TextEditingController? txfSenhaLoginTextController;
  late bool txfSenhaLoginVisibility;
  String? Function(BuildContext, String?)? txfSenhaLoginTextControllerValidator;
  String? _txfSenhaLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ygxp61zm' /* Senha deve ter pelo menos 8 ca... */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'cj0e8izh' /* Digite pelo menos 8 caracteres */,
      );
    }

    if (!RegExp('^[a-zA-Z0-9]{8,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'n1em0eu1' /* Senha deve ter pelo menos 8 ca... */,
      );
    }
    return null;
  }

  // State field(s) for txf_email_criar widget.
  FocusNode? txfEmailCriarFocusNode;
  TextEditingController? txfEmailCriarTextController;
  String? Function(BuildContext, String?)? txfEmailCriarTextControllerValidator;
  // State field(s) for txf_senha_criar widget.
  FocusNode? txfSenhaCriarFocusNode;
  TextEditingController? txfSenhaCriarTextController;
  late bool txfSenhaCriarVisibility;
  String? Function(BuildContext, String?)? txfSenhaCriarTextControllerValidator;
  // State field(s) for txf_senha_confirmar widget.
  FocusNode? txfSenhaConfirmarFocusNode;
  TextEditingController? txfSenhaConfirmarTextController;
  late bool txfSenhaConfirmarVisibility;
  String? Function(BuildContext, String?)?
      txfSenhaConfirmarTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
    txfEmailLoginTextControllerValidator =
        _txfEmailLoginTextControllerValidator;
    txfSenhaLoginVisibility = false;
    txfSenhaLoginTextControllerValidator =
        _txfSenhaLoginTextControllerValidator;
    txfSenhaCriarVisibility = false;
    txfSenhaConfirmarVisibility = false;
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    tabBarController?.dispose();
    txfEmailLoginFocusNode?.dispose();
    txfEmailLoginTextController?.dispose();

    txfSenhaLoginFocusNode?.dispose();
    txfSenhaLoginTextController?.dispose();

    txfEmailCriarFocusNode?.dispose();
    txfEmailCriarTextController?.dispose();

    txfSenhaCriarFocusNode?.dispose();
    txfSenhaCriarTextController?.dispose();

    txfSenhaConfirmarFocusNode?.dispose();
    txfSenhaConfirmarTextController?.dispose();
  }
}
