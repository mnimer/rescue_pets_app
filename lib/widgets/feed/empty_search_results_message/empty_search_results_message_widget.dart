import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_search_results_message_model.dart';
export 'empty_search_results_message_model.dart';

class EmptySearchResultsMessageWidget extends StatefulWidget {
  const EmptySearchResultsMessageWidget({
    Key? key,
    required this.species,
  }) : super(key: key);

  final String? species;

  @override
  _EmptySearchResultsMessageWidgetState createState() =>
      _EmptySearchResultsMessageWidgetState();
}

class _EmptySearchResultsMessageWidgetState
    extends State<EmptySearchResultsMessageWidget> {
  late EmptySearchResultsMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptySearchResultsMessageModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Text(
              'No pets were found matching your search.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Species: ',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                widget.species!,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
