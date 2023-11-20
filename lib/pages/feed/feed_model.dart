import '/backend/api_requests/api_calls.dart';
import '/components/feed_card_with_carousel_widget.dart';
import '/components/search_and_sort_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'feed_widget.dart' show FeedWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  Local state fields for this page.

  String? animalBreed = '';

  String orderBy = 'distance';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SearchAndSortBar component.
  late SearchAndSortBarModel searchAndSortBarModel;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Models for FeedCardWithCarousel dynamic component.
  late FlutterFlowDynamicModels<FeedCardWithCarouselModel>
      feedCardWithCarouselModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    searchAndSortBarModel = createModel(context, () => SearchAndSortBarModel());
    feedCardWithCarouselModels =
        FlutterFlowDynamicModels(() => FeedCardWithCarouselModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchAndSortBarModel.dispose();
    listViewPagingController?.dispose();
    feedCardWithCarouselModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

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
