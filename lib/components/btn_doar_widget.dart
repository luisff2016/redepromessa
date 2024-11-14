import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'btn_doar_model.dart';
export 'btn_doar_model.dart';

class BtnDoarWidget extends StatefulWidget {
  const BtnDoarWidget({super.key});

  @override
  State<BtnDoarWidget> createState() => _BtnDoarWidgetState();
}

class _BtnDoarWidgetState extends State<BtnDoarWidget> {
  late BtnDoarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BtnDoarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        context.pushNamed('MenuDoacoes');
      },
      text: FFLocalizations.of(context).getText(
        'gpi7957w' /* Doar */,
      ),
      options: FFButtonOptions(
        height: 30.0,
        padding: const EdgeInsets.all(6.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).accent1,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 14.0,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
