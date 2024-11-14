import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aviso_notificacao_apagada_widget.dart'
    show AvisoNotificacaoApagadaWidget;
import 'package:flutter/material.dart';

class AvisoNotificacaoApagadaModel
    extends FlutterFlowModel<AvisoNotificacaoApagadaWidget> {
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
