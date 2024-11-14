import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_projeto_widget.dart' show HomeProjetoWidget;
import 'package:flutter/material.dart';

class HomeProjetoModel extends FlutterFlowModel<HomeProjetoWidget> {
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
  // State field(s) for TextFieldEditEmail widget.
  FocusNode? textFieldEditEmailFocusNode1;
  TextEditingController? textFieldEditEmailTextController1;
  String? Function(BuildContext, String?)?
      textFieldEditEmailTextController1Validator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController1;
  List<String>? get checkboxGroupValues1 =>
      checkboxGroupValueController1?.value;
  set checkboxGroupValues1(List<String>? v) =>
      checkboxGroupValueController1?.value = v;

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
  FocusNode? textFieldEditEmailFocusNode2;
  TextEditingController? textFieldEditEmailTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditEmailTextController2Validator;
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
    textFieldEditNomeCompletoFocusNode1?.dispose();
    textFieldEditNomeCompletoTextController1?.dispose();

    textFieldEditCpfFocusNode1?.dispose();
    textFieldEditCpfTextController1?.dispose();

    textFieldEditEmailFocusNode1?.dispose();
    textFieldEditEmailTextController1?.dispose();

    textFieldEditNomeCompletoFocusNode2?.dispose();
    textFieldEditNomeCompletoTextController2?.dispose();

    textFieldEditNomeCompletoFocusNode3?.dispose();
    textFieldEditNomeCompletoTextController3?.dispose();

    textFieldEditCpfFocusNode2?.dispose();
    textFieldEditCpfTextController2?.dispose();

    textFieldEditEmailFocusNode2?.dispose();
    textFieldEditEmailTextController2?.dispose();
  }
}
