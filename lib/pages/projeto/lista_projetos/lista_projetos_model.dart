import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lista_projetos_widget.dart' show ListaProjetosWidget;
import 'package:flutter/material.dart';

class ListaProjetosModel extends FlutterFlowModel<ListaProjetosWidget> {
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
