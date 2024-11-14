import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'gerenciar_curso_widget.dart' show GerenciarCursoWidget;
import 'package:flutter/material.dart';

class GerenciarCursoModel extends FlutterFlowModel<GerenciarCursoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for RdButCriarEditar widget.
  FormFieldController<String>? rdButCriarEditarValueController;
  // State field(s) for TxFieldCriarNomeTreinamento widget.
  FocusNode? txFieldCriarNomeTreinamentoFocusNode;
  TextEditingController? txFieldCriarNomeTreinamentoTextController;
  String? Function(BuildContext, String?)?
      txFieldCriarNomeTreinamentoTextControllerValidator;
  // State field(s) for TxFieldCriarRespTreinamento widget.
  FocusNode? txFieldCriarRespTreinamentoFocusNode;
  TextEditingController? txFieldCriarRespTreinamentoTextController;
  String? Function(BuildContext, String?)?
      txFieldCriarRespTreinamentoTextControllerValidator;
  // State field(s) for TxFieldCriarDescrTreinamento widget.
  FocusNode? txFieldCriarDescrTreinamentoFocusNode;
  TextEditingController? txFieldCriarDescrTreinamentoTextController;
  String? Function(BuildContext, String?)?
      txFieldCriarDescrTreinamentoTextControllerValidator;
  // State field(s) for TxFieldAtivEditarEscolher widget.
  FocusNode? txFieldAtivEditarEscolherFocusNode;
  TextEditingController? txFieldAtivEditarEscolherTextController;
  String? Function(BuildContext, String?)?
      txFieldAtivEditarEscolherTextControllerValidator;
  // State field(s) for TxFieldEditarNomeTreinamento widget.
  FocusNode? txFieldEditarNomeTreinamentoFocusNode;
  TextEditingController? txFieldEditarNomeTreinamentoTextController;
  String? Function(BuildContext, String?)?
      txFieldEditarNomeTreinamentoTextControllerValidator;
  // State field(s) for TxFieldEditarRespTreinamento widget.
  FocusNode? txFieldEditarRespTreinamentoFocusNode;
  TextEditingController? txFieldEditarRespTreinamentoTextController;
  String? Function(BuildContext, String?)?
      txFieldEditarRespTreinamentoTextControllerValidator;
  // State field(s) for TxFieldEditarDescrTreinamento widget.
  FocusNode? txFieldEditarDescrTreinamentoFocusNode;
  TextEditingController? txFieldEditarDescrTreinamentoTextController;
  String? Function(BuildContext, String?)?
      txFieldEditarDescrTreinamentoTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    txFieldCriarNomeTreinamentoFocusNode?.dispose();
    txFieldCriarNomeTreinamentoTextController?.dispose();

    txFieldCriarRespTreinamentoFocusNode?.dispose();
    txFieldCriarRespTreinamentoTextController?.dispose();

    txFieldCriarDescrTreinamentoFocusNode?.dispose();
    txFieldCriarDescrTreinamentoTextController?.dispose();

    txFieldAtivEditarEscolherFocusNode?.dispose();
    txFieldAtivEditarEscolherTextController?.dispose();

    txFieldEditarNomeTreinamentoFocusNode?.dispose();
    txFieldEditarNomeTreinamentoTextController?.dispose();

    txFieldEditarRespTreinamentoFocusNode?.dispose();
    txFieldEditarRespTreinamentoTextController?.dispose();

    txFieldEditarDescrTreinamentoFocusNode?.dispose();
    txFieldEditarDescrTreinamentoTextController?.dispose();
  }

  /// Additional helper methods.
  String? get rdButCriarEditarValue => rdButCriarEditarValueController?.value;
}
