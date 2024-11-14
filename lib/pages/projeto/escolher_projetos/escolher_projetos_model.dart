import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'escolher_projetos_widget.dart' show EscolherProjetosWidget;
import 'package:flutter/material.dart';

class EscolherProjetosModel extends FlutterFlowModel<EscolherProjetosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloMyoscMenu component.
  late TituloMyoscMenuModel tituloMyoscMenuModel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController4;
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
    tituloMyoscMenuModel = createModel(context, () => TituloMyoscMenuModel());
  }

  @override
  void dispose() {
    tituloMyoscMenuModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
  String? get radioButtonValue4 => radioButtonValueController4?.value;
  String? get radioButtonValue5 => radioButtonValueController5?.value;
  String? get radioButtonValue6 => radioButtonValueController6?.value;
  String? get radioButtonValue7 => radioButtonValueController7?.value;
  String? get radioButtonValue8 => radioButtonValueController8?.value;
}
