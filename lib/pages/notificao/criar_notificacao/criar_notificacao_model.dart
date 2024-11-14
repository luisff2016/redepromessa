import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'criar_notificacao_widget.dart' show CriarNotificacaoWidget;
import 'package:flutter/material.dart';

class CriarNotificacaoModel extends FlutterFlowModel<CriarNotificacaoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloMyoscMenu component.
  late TituloMyoscMenuModel tituloMyoscMenuModel;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode;
  TextEditingController? textFieldEditNomeCompletoTextController;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextControllerValidator;
  // State field(s) for TextFieldEditEmail widget.
  FocusNode? textFieldEditEmailFocusNode;
  TextEditingController? textFieldEditEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEditEmailTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;

  @override
  void initState(BuildContext context) {
    tituloMyoscMenuModel = createModel(context, () => TituloMyoscMenuModel());
  }

  @override
  void dispose() {
    tituloMyoscMenuModel.dispose();
    textFieldEditNomeCompletoFocusNode?.dispose();
    textFieldEditNomeCompletoTextController?.dispose();

    textFieldEditEmailFocusNode?.dispose();
    textFieldEditEmailTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController3?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
