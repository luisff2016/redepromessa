import '/components/btn_doar_widget.dart';
import '/components/icone_usuario_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for IconeUsuario component.
  late IconeUsuarioModel iconeUsuarioModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for BtnDoar component.
  late BtnDoarModel btnDoarModel1;
  // Model for BtnDoar component.
  late BtnDoarModel btnDoarModel2;
  // Model for BtnDoar component.
  late BtnDoarModel btnDoarModel3;
  // Model for BtnDoar component.
  late BtnDoarModel btnDoarModel4;

  @override
  void initState(BuildContext context) {
    iconeUsuarioModel = createModel(context, () => IconeUsuarioModel());
    btnDoarModel1 = createModel(context, () => BtnDoarModel());
    btnDoarModel2 = createModel(context, () => BtnDoarModel());
    btnDoarModel3 = createModel(context, () => BtnDoarModel());
    btnDoarModel4 = createModel(context, () => BtnDoarModel());
  }

  @override
  void dispose() {
    iconeUsuarioModel.dispose();
    btnDoarModel1.dispose();
    btnDoarModel2.dispose();
    btnDoarModel3.dispose();
    btnDoarModel4.dispose();
  }
}
