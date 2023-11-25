import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/feed/feed_card/feed_card_widget.dart';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'feed_widget.dart' show FeedWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  Local state fields for this page.

  String? animalBreed = '';

  String orderBy = 'distance';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

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
    listViewPagingController?.dispose();
    feedCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewPetSearchPage);
  }

  void listViewPetSearchPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewPetSearchResponse) {
        final pageItems =
            (PetListStruct.fromMap(listViewPetSearchResponse.jsonBody).pets ??
                    [])
                .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewPetSearchResponse,
                )
              : null,
        );
      });
}
