import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/feed/empty_search_results_message/empty_search_results_message_widget.dart';
import '/widgets/feed/feed_card/feed_card_widget.dart';
import '/widgets/feed/search_and_filter_bottom_sheet/search_and_filter_bottom_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({
    super.key,
    String? species,
  })  : species = species ?? 'cat';

  final String species;

  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Feed'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEED_PAGE_Feed_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      logFirebaseEvent('Feed_request_permissions');
      await requestPermission(locationPermission);
      logFirebaseEvent('Feed_update_app_state');
      setState(() {
        FFAppState().userLocation = currentUserLocationValue;
      });
      logFirebaseEvent('Feed_show_snack_bar');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'User Location: ${FFAppState().userLocation?.toString()}',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            () {
              if (FFAppState().searchDogs && FFAppState().searchCats) {
                return 'Dogs & Cats';
              } else if (FFAppState().searchDogs && !FFAppState().searchCats) {
                return 'Dogs';
              } else {
                return 'Cats';
              }
            }(),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 40.0,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FEED_PAGE_Text_orzrsool_ON_TAP');
                              logFirebaseEvent('Text_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SearchAndFilterBottomSheetWidget(
                                        searchCallback: () async {
                                          logFirebaseEvent(
                                              '_refresh_database_request');
                                          setState(() => _model
                                              .listViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForListView();
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Text(
                              'Filter',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 8.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'FEED_PAGE_Icon_0uyughha_ON_TAP');
                              logFirebaseEvent('Icon_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SearchAndFilterBottomSheetWidget(
                                        searchCallback: () async {
                                          logFirebaseEvent(
                                              '_refresh_database_request');
                                          setState(() => _model
                                              .listViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForListView();
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Icon(
                              Icons.filter_list,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        logFirebaseEvent(
                            'FEED_ListView_pnww02dr_ON_PULL_TO_REFRES');
                        logFirebaseEvent('ListView_refresh_database_request');
                        setState(
                            () => _model.listViewPagingController?.refresh());
                        await _model.waitForOnePageForListView();
                      },
                      child: PagedListView<ApiPagingParams, dynamic>(
                        pagingController: _model.setListViewController(
                          (nextPageMarker) => PetSearchCall.call(
                            searchBreed: FFAppState().searchBreed,
                            searchDogs: FFAppState().searchDogs,
                            searchCats: FFAppState().searchCats,
                            last: getJsonField(
                              (nextPageMarker.lastResponse ??
                                      const ApiCallResponse({}, {}, 200))
                                  .jsonBody,
                              r'''$.last''',
                            ).toString(),
                            includeDeleted: false,
                            userLocationList:
                                functions.splitLatLng(currentUserLocationValue),
                            searchDistance: FFAppState().searchDistance,
                          ),
                        ),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<dynamic>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 48.0, 0.0, 0.0),
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 48.0, 0.0, 0.0),
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          noItemsFoundIndicatorBuilder: (_) =>
                              EmptySearchResultsMessageWidget(
                            species: widget.species,
                          ),
                          itemBuilder: (context, _, feedListChildrenIndex) {
                            final feedListChildrenItem = _model
                                .listViewPagingController!
                                .itemList![feedListChildrenIndex];
                            return Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: ClipRRect(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.00, 0.00),
                                        child: wrapWithModel(
                                          model: _model.feedCardModels.getModel(
                                            feedListChildrenItem.animalID,
                                            feedListChildrenIndex,
                                          ),
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: FeedCardWidget(
                                            key: Key(
                                              'Key7hi_${feedListChildrenItem.animalID}',
                                            ),
                                            pet: feedListChildrenItem,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
