import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sort_menu_model.dart';
export 'sort_menu_model.dart';

class SortMenuWidget extends StatefulWidget {
  const SortMenuWidget({Key? key}) : super(key: key);

  @override
  _SortMenuWidgetState createState() => _SortMenuWidgetState();
}

class _SortMenuWidgetState extends State<SortMenuWidget> {
  late SortMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SortMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
              child: Text(
                'Distance ',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
              child: Text(
                'Breed',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
              child: Text(
                'Age (oldest to youngest)',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
              child: Text(
                'Age (youngest to oldest)',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
