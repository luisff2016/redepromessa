import '/components/titulo_rede_pro_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'gerenciar_projeto_model.dart';
export 'gerenciar_projeto_model.dart';

class GerenciarProjetoWidget extends StatefulWidget {
  const GerenciarProjetoWidget({super.key});

  @override
  State<GerenciarProjetoWidget> createState() => _GerenciarProjetoWidgetState();
}

class _GerenciarProjetoWidgetState extends State<GerenciarProjetoWidget> {
  late GerenciarProjetoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GerenciarProjetoModel());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.safePop();
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.keyboard_return,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                height: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 1100.0,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).tertiary
                    ],
                    stops: const [0.0, 1.0],
                    begin: const AlignmentDirectional(0.87, -1.0),
                    end: const AlignmentDirectional(-0.87, 1.0),
                  ),
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.tituloRedeProModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const TituloRedeProWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
