import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'titulo_rede_pro_model.dart';
export 'titulo_rede_pro_model.dart';

class TituloRedeProWidget extends StatefulWidget {
  const TituloRedeProWidget({super.key});

  @override
  State<TituloRedeProWidget> createState() => _TituloRedeProWidgetState();
}

class _TituloRedeProWidgetState extends State<TituloRedeProWidget> {
  late TituloRedeProModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TituloRedeProModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: const BoxConstraints(
            minWidth: 200.0,
            minHeight: 50.0,
          ),
          decoration: const BoxDecoration(),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90.0),
                      child: Image.asset(
                        'assets/images/icone_01c24006-edd6-45f1-80d8-5765475f48db.jpg',
                        fit: BoxFit.contain,
                        alignment: const Alignment(0.0, 0.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AutoSizeText(
                        FFLocalizations.of(context).getText(
                          '5zzbn4eb' /* Rede 
Promessa */
                          ,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Inter',
                              letterSpacing: 3.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
