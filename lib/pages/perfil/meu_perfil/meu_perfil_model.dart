import '/components/icone_usuario_widget.dart';
import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meu_perfil_widget.dart' show MeuPerfilWidget;
import 'package:flutter/material.dart';

class MeuPerfilModel extends FlutterFlowModel<MeuPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // Model for IconeUsuario component.
  late IconeUsuarioModel iconeUsuarioModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
    iconeUsuarioModel = createModel(context, () => IconeUsuarioModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    iconeUsuarioModel.dispose();
  }
}
