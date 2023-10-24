import '/backend/backend.dart';
import '/components/empty_search_results_message_widget.dart';
import '/components/feed_card_with_carousel_widget.dart';
import '/components/search_and_sort_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'feed_widget.dart' show FeedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  Local state fields for this page.

  String? animalBreed = '';

  String orderBy = 'distance';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SearchAndSortBar component.
  late SearchAndSortBarModel searchAndSortBarModel;
  Completer<List<PetsRecord>>? firestoreRequestCompleter;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchAndSortBarModel = createModel(context, () => SearchAndSortBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    searchAndSortBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
