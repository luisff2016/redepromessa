import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'relatorio_projeto_widget.dart' show RelatorioProjetoWidget;
import 'package:flutter/material.dart';

class RelatorioProjetoModel extends FlutterFlowModel<RelatorioProjetoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode;
  TextEditingController? textFieldEditNomeCompletoTextController;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    textFieldEditNomeCompletoFocusNode?.dispose();
    textFieldEditNomeCompletoTextController?.dispose();
  }
}
