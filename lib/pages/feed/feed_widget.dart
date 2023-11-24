import '/backend/api_requests/api_calls.dart';
import '/components/empty_search_results_message_widget.dart';
import '/components/feed_card_widget.dart';
import '/components/search_and_filter_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/permissions_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({
    Key? key,
    String? species,
  })  : this.species = species ?? 'cat',
        super(key: key);

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
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
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
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    });

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Dogs / Puppies',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: 310.0,
                                          child:
                                              SearchAndFilterBottomSheetWidget(
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
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: 310.0,
                                          child:
                                              SearchAndFilterBottomSheetWidget(
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
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.filter_list,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.99,
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
                            next: nextPageMarker.nextPageNumber,
                            last: getJsonField(
                              (nextPageMarker.lastResponse ??
                                      ApiCallResponse({}, {}, 200))
                                  .jsonBody,
                              r'''$.last''',
                            ).toString(),
                            loadedItems: nextPageMarker.numItems,
                            page: nextPageMarker.nextPageNumber,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                  height: 500.0,
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
                                            AlignmentDirectional(0.00, 0.00),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
