import '/components/titulo_rede_pro_widget.dart';
import '/components/topo_perfil_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'titulo_myosc_menu_model.dart';
export 'titulo_myosc_menu_model.dart';

class TituloMyoscMenuWidget extends StatefulWidget {
  const TituloMyoscMenuWidget({super.key});

  @override
  State<TituloMyoscMenuWidget> createState() => _TituloMyoscMenuWidgetState();
}

class _TituloMyoscMenuWidgetState extends State<TituloMyoscMenuWidget> {
  late TituloMyoscMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TituloMyoscMenuModel());

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
      width: 400.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('HomePage');
              },
              child: wrapWithModel(
                model: _model.tituloRedeProModel,
                updateCallback: () => safeSetState(() {}),
                child: const TituloRedeProWidget(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
            child: wrapWithModel(
              model: _model.topoPerfilModel,
              updateCallback: () => safeSetState(() {}),
              child: const TopoPerfilWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
