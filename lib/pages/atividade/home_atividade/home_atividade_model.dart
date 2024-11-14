import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_atividade_widget.dart' show HomeAtividadeWidget;
import 'package:flutter/material.dart';

class HomeAtividadeModel extends FlutterFlowModel<HomeAtividadeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloMyoscMenu component.
  late TituloMyoscMenuModel tituloMyoscMenuModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TxFieldAtivNomeCriar widget.
  FocusNode? txFieldAtivNomeCriarFocusNode1;
  TextEditingController? txFieldAtivNomeCriarTextController1;
  String? Function(BuildContext, String?)?
      txFieldAtivNomeCriarTextController1Validator;
  // State field(s) for TxFieldAtivNomeCriar widget.
  FocusNode? txFieldAtivNomeCriarFocusNode2;
  TextEditingController? txFieldAtivNomeCriarTextController2;
  String? Function(BuildContext, String?)?
      txFieldAtivNomeCriarTextController2Validator;
  // State field(s) for TxFieldAtivDescrCriar widget.
  FocusNode? txFieldAtivDescrCriarFocusNode;
  TextEditingController? txFieldAtivDescrCriarTextController;
  String? Function(BuildContext, String?)?
      txFieldAtivDescrCriarTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController1;
  List<String>? get checkboxGroupValues1 =>
      checkboxGroupValueController1?.value;
  set checkboxGroupValues1(List<String>? v) =>
      checkboxGroupValueController1?.value = v;

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController2;
  List<String>? get checkboxGroupValues2 =>
      checkboxGroupValueController2?.value;
  set checkboxGroupValues2(List<String>? v) =>
      checkboxGroupValueController2?.value = v;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TxFieldAtivEditarEscolher widget.
  FocusNode? txFieldAtivEditarEscolherFocusNode;
  TextEditingController? txFieldAtivEditarEscolherTextController;
  String? Function(BuildContext, String?)?
      txFieldAtivEditarEscolherTextControllerValidator;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode;
  TextEditingController? textFieldEditNomeCompletoTextController;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextControllerValidator;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode;
  TextEditingController? textFieldEditCpfTextController;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController3;
  List<String>? get checkboxGroupValues3 =>
      checkboxGroupValueController3?.value;
  set checkboxGroupValues3(List<String>? v) =>
      checkboxGroupValueController3?.value = v;

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController4;
  List<String>? get checkboxGroupValues4 =>
      checkboxGroupValueController4?.value;
  set checkboxGroupValues4(List<String>? v) =>
      checkboxGroupValueController4?.value = v;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;

  @override
  void initState(BuildContext context) {
    tituloMyoscMenuModel = createModel(context, () => TituloMyoscMenuModel());
  }

  @override
  void dispose() {
    tituloMyoscMenuModel.dispose();
    tabBarController?.dispose();
    txFieldAtivNomeCriarFocusNode1?.dispose();
    txFieldAtivNomeCriarTextController1?.dispose();

    txFieldAtivNomeCriarFocusNode2?.dispose();
    txFieldAtivNomeCriarTextController2?.dispose();

    txFieldAtivDescrCriarFocusNode?.dispose();
    txFieldAtivDescrCriarTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController4?.dispose();

    textFieldFocusNode2?.dispose();
    textController5?.dispose();

    txFieldAtivEditarEscolherFocusNode?.dispose();
    txFieldAtivEditarEscolherTextController?.dispose();

    textFieldEditNomeCompletoFocusNode?.dispose();
    textFieldEditNomeCompletoTextController?.dispose();

    textFieldEditCpfFocusNode?.dispose();
    textFieldEditCpfTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController9?.dispose();
  }
}
