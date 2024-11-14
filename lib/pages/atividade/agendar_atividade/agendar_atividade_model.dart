import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agendar_atividade_widget.dart' show AgendarAtividadeWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AgendarAtividadeModel extends FlutterFlowModel<AgendarAtividadeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TituloRedePro component.
  late TituloRedeProModel tituloRedeProModel;
  // State field(s) for TextFieldEditNomeCompleto widget.
  FocusNode? textFieldEditNomeCompletoFocusNode;
  TextEditingController? textFieldEditNomeCompletoTextController;
  String? Function(BuildContext, String?)?
      textFieldEditNomeCompletoTextControllerValidator;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode1;
  TextEditingController? textFieldEditCpfTextController1;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextController1Validator;
  // State field(s) for TextFieldEditCpf widget.
  FocusNode? textFieldEditCpfFocusNode2;
  TextEditingController? textFieldEditCpfTextController2;
  String? Function(BuildContext, String?)?
      textFieldEditCpfTextController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController4;
  final textFieldMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController5;
  final textFieldMask2 = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController6;
  final textFieldMask3 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController7;
  final textFieldMask4 = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? textController7Validator;

  @override
  void initState(BuildContext context) {
    tituloRedeProModel = createModel(context, () => TituloRedeProModel());
  }

  @override
  void dispose() {
    tituloRedeProModel.dispose();
    textFieldEditNomeCompletoFocusNode?.dispose();
    textFieldEditNomeCompletoTextController?.dispose();

    textFieldEditCpfFocusNode1?.dispose();
    textFieldEditCpfTextController1?.dispose();

    textFieldEditCpfFocusNode2?.dispose();
    textFieldEditCpfTextController2?.dispose();

    textFieldFocusNode1?.dispose();
    textController4?.dispose();

    textFieldFocusNode2?.dispose();
    textController5?.dispose();

    textFieldFocusNode3?.dispose();
    textController6?.dispose();

    textFieldFocusNode4?.dispose();
    textController7?.dispose();
  }
}
