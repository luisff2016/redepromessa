import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'gerenciar_material_widget.dart' show GerenciarMaterialWidget;
import 'package:flutter/material.dart';

class GerenciarMaterialModel extends FlutterFlowModel<GerenciarMaterialWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for RdButCriarEditar widget.
  FormFieldController<String>? rdButCriarEditarValueController;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode1;
  TextEditingController? textFieldEditNomeCompletoTextController1;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController1Validator;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode1;
  TextEditingController? textFieldEditCpfTextController1;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextController1Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController4;
  // State field(s) for TxFieldAtivEditarEscolher widget.
  FocusNode? txFieldAtivEditarEscolherFocusNode;
  TextEditingController? txFieldAtivEditarEscolherTextController;
  String? Function(BuildContext, String?)?
      txFieldAtivEditarEscolherTextControllerValidator;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode2;
  TextEditingController? textFieldEditNomeCompletoTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController2Validator;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode2;
  TextEditingController? textFieldEditCpfTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextController2Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController5;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController6;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController7;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController8;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    textFieldEditNomeCompletoFocusNode1?.dispose();
    textFieldEditNomeCompletoTextController1?.dispose();

    textFieldEditCpfFocusNode1?.dispose();
    textFieldEditCpfTextController1?.dispose();

    txFieldAtivEditarEscolherFocusNode?.dispose();
    txFieldAtivEditarEscolherTextController?.dispose();

    textFieldEditNomeCompletoFocusNode2?.dispose();
    textFieldEditNomeCompletoTextController2?.dispose();

    textFieldEditCpfFocusNode2?.dispose();
    textFieldEditCpfTextController2?.dispose();
  }

  /// Additional helper methods.
  String? get rdButCriarEditarValue => rdButCriarEditarValueController?.value;
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
  String? get radioButtonValue4 => radioButtonValueController4?.value;
  String? get radioButtonValue5 => radioButtonValueController5?.value;
  String? get radioButtonValue6 => radioButtonValueController6?.value;
  String? get radioButtonValue7 => radioButtonValueController7?.value;
  String? get radioButtonValue8 => radioButtonValueController8?.value;
}
