import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'incluir_material_curso_model.dart';
export 'incluir_material_curso_model.dart';

class IncluirMaterialCursoWidget extends StatefulWidget {
  const IncluirMaterialCursoWidget({super.key});

  @override
  State<IncluirMaterialCursoWidget> createState() =>
      _IncluirMaterialCursoWidgetState();
}

class _IncluirMaterialCursoWidgetState
    extends State<IncluirMaterialCursoWidget> {
  late IncluirMaterialCursoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncluirMaterialCursoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: const Row(
          mainAxisSize: MainAxisSize.max,
          children: [],
        ),
      ),
    );
  }
}
