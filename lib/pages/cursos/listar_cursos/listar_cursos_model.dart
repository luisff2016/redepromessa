import '/components/titulo_myosc_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'listar_cursos_widget.dart' show ListarCursosWidget;
import 'package:flutter/material.dart';

class ListarCursosModel extends FlutterFlowModel<ListarCursosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloMyoscMenu component.
  late TituloMyoscMenuModel tituloMyoscMenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

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
