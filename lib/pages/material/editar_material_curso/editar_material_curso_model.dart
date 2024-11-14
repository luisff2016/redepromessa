import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_material_curso_widget.dart' show EditarMaterialCursoWidget;
import 'package:flutter/material.dart';

class EditarMaterialCursoModel
    extends FlutterFlowModel<EditarMaterialCursoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
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
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    textFieldEditNomeCompletoFocusNode?.dispose();
    textFieldEditNomeCompletoTextController?.dispose();

    textFieldEditCpfFocusNode?.dispose();
    textFieldEditCpfTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
