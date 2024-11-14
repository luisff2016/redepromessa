import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_curso_widget.dart' show HomeCursoWidget;
import 'package:flutter/material.dart';

class HomeCursoModel extends FlutterFlowModel<HomeCursoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloMyoscMenu component.
  late TituloMyoscMenuModel tituloMyoscMenuModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFieldCriarCurso widget.
  FocusNode? textFieldCriarCursoFocusNode;
  TextEditingController? textFieldCriarCursoTextController;
  String? Function(BuildContext, String?)?
      textFieldCriarCursoTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController1;
  List<String>? get checkboxGroupValues1 =>
      checkboxGroupValueController1?.value;
  set checkboxGroupValues1(List<String>? v) =>
      checkboxGroupValueController1?.value = v;

  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode1;
  TextEditingController? textFieldEditNomeCompletoTextController1;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController1Validator;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode2;
  TextEditingController? textFieldEditNomeCompletoTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController2Validator;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode;
  TextEditingController? textFieldEditCpfTextController;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextControllerValidator;
  // State field(s) for TextFieldEditEmail widget.
  FocusNode? textFieldEditEmailFocusNode;
  TextEditingController? textFieldEditEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEditEmailTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController2;
  List<String>? get checkboxGroupValues2 =>
      checkboxGroupValueController2?.value;
  set checkboxGroupValues2(List<String>? v) =>
      checkboxGroupValueController2?.value = v;

  @override
  void initState(BuildContext context) {
    tituloMyoscMenuModel = createModel(context, () => TituloMyoscMenuModel());
  }

  @override
  void dispose() {
    tituloMyoscMenuModel.dispose();
    tabBarController?.dispose();
    textFieldCriarCursoFocusNode?.dispose();
    textFieldCriarCursoTextController?.dispose();

    textFieldEditNomeCompletoFocusNode1?.dispose();
    textFieldEditNomeCompletoTextController1?.dispose();

    textFieldEditNomeCompletoFocusNode2?.dispose();
    textFieldEditNomeCompletoTextController2?.dispose();

    textFieldEditCpfFocusNode?.dispose();
    textFieldEditCpfTextController?.dispose();

    textFieldEditEmailFocusNode?.dispose();
    textFieldEditEmailTextController?.dispose();
  }
}
