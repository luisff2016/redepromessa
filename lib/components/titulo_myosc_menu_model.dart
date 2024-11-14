import '/components/titulo_rede_pro_widget.dart';
import '/components/topo_perfil_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'titulo_myosc_menu_widget.dart' show TituloMyoscMenuWidget;
import 'package:flutter/material.dart';

class TituloMyoscMenuModel extends FlutterFlowModel<TituloMyoscMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // Model for TopoPerfil component.
  late TopoPerfilModel topoPerfilModel;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
    topoPerfilModel = createModel(context, () => TopoPerfilModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    topoPerfilModel.dispose();
  }
}
