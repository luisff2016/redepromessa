import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_organizacao_widget.dart' show HomeOrganizacaoWidget;
import 'package:flutter/material.dart';

class HomeOrganizacaoModel extends FlutterFlowModel<HomeOrganizacaoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode3;
  TextEditingController? textFieldEditNomeCompletoTextController3;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController3Validator;
  // State field(s) for TextFieldEditEmail widget.
  FocusNode? textFieldEditEmailFocusNode1;
  TextEditingController? textFieldEditEmailTextController1;
  String? Function(BuildContext, String?)?
      textFieldEditEmailTextController1Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode1;
  TextEditingController? textFieldEditCpfTextController1;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextController1Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode4;
  TextEditingController? textFieldEditNomeCompletoTextController4;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController4Validator;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode5;
  TextEditingController? textFieldEditNomeCompletoTextController5;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController5Validator;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode6;
  TextEditingController? textFieldEditNomeCompletoTextController6;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextController6Validator;
  // State field(s) for TextFieldEditEmail widget.
  FocusNode? textFieldEditEmailFocusNode2;
  TextEditingController? textFieldEditEmailTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditEmailTextController2Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode2;
  TextEditingController? textFieldEditCpfTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextController2Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController4;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    tabBarController?.dispose();
    textFieldEditNomeCompletoFocusNode1?.dispose();
    textFieldEditNomeCompletoTextController1?.dispose();

    textFieldEditNomeCompletoFocusNode2?.dispose();
    textFieldEditNomeCompletoTextController2?.dispose();

    textFieldEditNomeCompletoFocusNode3?.dispose();
    textFieldEditNomeCompletoTextController3?.dispose();

    textFieldEditEmailFocusNode1?.dispose();
    textFieldEditEmailTextController1?.dispose();

    textFieldEditCpfFocusNode1?.dispose();
    textFieldEditCpfTextController1?.dispose();

    textFieldEditNomeCompletoFocusNode4?.dispose();
    textFieldEditNomeCompletoTextController4?.dispose();

    textFieldEditNomeCompletoFocusNode5?.dispose();
    textFieldEditNomeCompletoTextController5?.dispose();

    textFieldEditNomeCompletoFocusNode6?.dispose();
    textFieldEditNomeCompletoTextController6?.dispose();

    textFieldEditEmailFocusNode2?.dispose();
    textFieldEditEmailTextController2?.dispose();

    textFieldEditCpfFocusNode2?.dispose();
    textFieldEditCpfTextController2?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
  String? get radioButtonValue4 => radioButtonValueController4?.value;
}
