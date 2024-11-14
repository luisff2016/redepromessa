import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_usuario_widget.dart' show EditarUsuarioWidget;
import 'package:flutter/material.dart';

class EditarUsuarioModel extends FlutterFlowModel<EditarUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for txf_up_display_name widget.
  FocusNode? txfUpDisplayNameFocusNode;
  TextEditingController? txfUpDisplayNameTextController;
  String? Function(BuildContext, String?)?
      txfUpDisplayNameTextControllerValidator;
  // State field(s) for txf_up_cpf widget.
  FocusNode? txfUpCpfFocusNode;
  TextEditingController? txfUpCpfTextController;
  String? Function(BuildContext, String?)? txfUpCpfTextControllerValidator;
  // State field(s) for txf_up_email widget.
  FocusNode? txfUpEmailFocusNode;
  TextEditingController? txfUpEmailTextController;
  String? Function(BuildContext, String?)? txfUpEmailTextControllerValidator;
  // State field(s) for txf_up_telefone widget.
  FocusNode? txfUpTelefoneFocusNode;
  TextEditingController? txfUpTelefoneTextController;
  String? Function(BuildContext, String?)? txfUpTelefoneTextControllerValidator;
  // State field(s) for txf_up_endereco widget.
  FocusNode? txfUpEnderecoFocusNode;
  TextEditingController? txfUpEnderecoTextController;
  String? Function(BuildContext, String?)? txfUpEnderecoTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    txfUpDisplayNameFocusNode?.dispose();
    txfUpDisplayNameTextController?.dispose();

    txfUpCpfFocusNode?.dispose();
    txfUpCpfTextController?.dispose();

    txfUpEmailFocusNode?.dispose();
    txfUpEmailTextController?.dispose();

    txfUpTelefoneFocusNode?.dispose();
    txfUpTelefoneTextController?.dispose();

    txfUpEnderecoFocusNode?.dispose();
    txfUpEnderecoTextController?.dispose();
  }
}
