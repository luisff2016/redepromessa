import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'page_material_widget.dart' show PageMaterialWidget;
import 'package:flutter/material.dart';

class PageMaterialModel extends FlutterFlowModel<PageMaterialWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloMyoscMenu component.
  late TituloMyoscMenuModel tituloMyoscMenuModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
  // State field(s) for RButMaterial widget.
  FormFieldController<String>? rButMaterialValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for RButAvaliacao widget.
  FormFieldController<String>? rButAvaliacaoValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode2;
  TextEditingController? textFieldEditNomeCompletoTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController2Validator;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode3;
  TextEditingController? textFieldEditNomeCompletoTextController3;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController3Validator;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode2;
  TextEditingController? textFieldEditCpfTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextController2Validator;
  // State field(s) for TextFieldEditEmail widget.
  FocusNode? textFieldEditEmailFocusNode;
  TextEditingController? textFieldEditEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEditEmailTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  @override
  void initState(BuildContext context) {
    tituloMyoscMenuModel = createModel(context, () => TituloMyoscMenuModel());
  }

  @override
  void dispose() {
    tituloMyoscMenuModel.dispose();
    tabBarController?.dispose();
    textFieldEditNomeCompletoFocusNode1?.dispose();
    textFieldEditNomeCompletoTextController1?.dispose();

    textFieldEditCpfFocusNode1?.dispose();
    textFieldEditCpfTextController1?.dispose();

    textFieldEditNomeCompletoFocusNode2?.dispose();
    textFieldEditNomeCompletoTextController2?.dispose();

    textFieldEditNomeCompletoFocusNode3?.dispose();
    textFieldEditNomeCompletoTextController3?.dispose();

    textFieldEditCpfFocusNode2?.dispose();
    textFieldEditCpfTextController2?.dispose();

    textFieldEditEmailFocusNode?.dispose();
    textFieldEditEmailTextController?.dispose();
  }

  /// Additional helper methods.
  String? get rButMaterialValue => rButMaterialValueController?.value;
  String? get radioButtonValue => radioButtonValueController?.value;
  String? get rButAvaliacaoValue => rButAvaliacaoValueController?.value;
}
