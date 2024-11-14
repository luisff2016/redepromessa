import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'compartilhar_projeto_widget.dart' show CompartilharProjetoWidget;
import 'package:flutter/material.dart';

class CompartilharProjetoModel
    extends FlutterFlowModel<CompartilharProjetoWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
