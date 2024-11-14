import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nivel_acesso_copy_widget.dart' show NivelAcessoCopyWidget;
import 'package:flutter/material.dart';

class NivelAcessoCopyModel extends FlutterFlowModel<NivelAcessoCopyWidget> {
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
