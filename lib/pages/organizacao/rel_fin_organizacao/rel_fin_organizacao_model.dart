import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'rel_fin_organizacao_widget.dart' show RelFinOrganizacaoWidget;
import 'package:flutter/material.dart';

class RelFinOrganizacaoModel extends FlutterFlowModel<RelFinOrganizacaoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloMyoscMenu component.
  late TituloMyoscMenuModel tituloMyoscMenuModel;

  @override
  void initState(BuildContext context) {
    tituloMyoscMenuModel = createModel(context, () => TituloMyoscMenuModel());
  }

  @override
  void dispose() {
    tituloMyoscMenuModel.dispose();
  }
}
