import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listar_material_widget.dart' show ListarMaterialWidget;
import 'package:flutter/material.dart';

class ListarMaterialModel extends FlutterFlowModel<ListarMaterialWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloMyoscMenu component.
  late TituloMyoscMenuModel tituloMyoscMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    tituloMyoscMenuModel = createModel(context, () => TituloMyoscMenuModel());
  }

  @override
  void dispose() {
    tituloMyoscMenuModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
