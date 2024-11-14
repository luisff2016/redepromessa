import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'relatorio_pessoal_widget.dart' show RelatorioPessoalWidget;
import 'package:flutter/material.dart';

class RelatorioPessoalModel extends FlutterFlowModel<RelatorioPessoalWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
  }
}
