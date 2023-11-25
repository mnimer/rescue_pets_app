import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/feed/feed_card/feed_card_widget.dart';
import 'dart:async';
import 'favorites_widget.dart' show FavoritesWidget;
import 'package:flutter/material.dart';

class FavoritesModel extends FlutterFlowModel<FavoritesWidget> {
  ///  Local state fields for this page.

  String? animalBreed = '';

  String orderBy = 'distance';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for FeedCard dynamic component.
  late FlutterFlowDynamicModels<FeedCardModel> feedCardModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    feedCardModels = FlutterFlowDynamicModels(() => FeedCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    feedCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
