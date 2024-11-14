import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'topo_perfil_model.dart';
export 'topo_perfil_model.dart';

class TopoPerfilWidget extends StatefulWidget {
  const TopoPerfilWidget({super.key});

  @override
  State<TopoPerfilWidget> createState() => _TopoPerfilWidgetState();
}

class _TopoPerfilWidgetState extends State<TopoPerfilWidget> {
  late TopoPerfilModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopoPerfilModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).noColor,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: FlutterFlowIconButton(
        borderColor: FlutterFlowTheme.of(context).primary,
        borderRadius: 20.0,
        borderWidth: 2.0,
        buttonSize: 60.0,
        fillColor: FlutterFlowTheme.of(context).accent1,
        icon: Icon(
          Icons.menu_outlined,
          color: FlutterFlowTheme.of(context).primaryBackground,
          size: 36.0,
        ),
        onPressed: () {
          print('IconButton pressed ...');
        },
      ),
    );
  }
}
