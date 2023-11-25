import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/feed/empty_search_results_message/empty_search_results_message_widget.dart';
import '/widgets/feed/feed_card/feed_card_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/permissions_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'favorites_model.dart';
export 'favorites_model.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({
    super.key,
    String? species,
  })  : species = species ?? 'cat';

  final String species;

  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  late FavoritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Favorites'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FAVORITES_PAGE_Favorites_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      logFirebaseEvent('Favorites_request_permissions');
      await requestPermission(locationPermission);
      logFirebaseEvent('Favorites_update_app_state');
      setState(() {
        FFAppState().userLocation = currentUserLocationValue;
      });
      logFirebaseEvent('Favorites_show_snack_bar');
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
          title: Text(
            'Favorites',
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
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter ??=
                              Completer<ApiCallResponse>()
                                ..complete(FavoritesSearchCall.call()))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
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
                          );
                        }
                        final listViewFavoritesSearchResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final feedListChildren =
                                (listViewFavoritesSearchResponse.jsonBody !=
                                                    null &&
                                                listViewFavoritesSearchResponse
                                                        .jsonBody !=
                                                    ''
                                            ? PetListStruct.fromMap(
                                                listViewFavoritesSearchResponse
                                                    .jsonBody)
                                            : null)
                                        ?.pets
                                        .toList() ??
                                    [];
                            if (feedListChildren.isEmpty) {
                              return EmptySearchResultsMessageWidget(
                                species: widget.species,
                              );
                            }
                            return RefreshIndicator(
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'FAVORITES_ListView_ixxqhm9u_ON_PULL_TO_R');
                                logFirebaseEvent(
                                    'ListView_refresh_database_request');
                                setState(
                                    () => _model.apiRequestCompleter = null);
                                await _model.waitForApiRequestCompleted();
                              },
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: feedListChildren.length,
                                itemBuilder: (context, feedListChildrenIndex) {
                                  final feedListChildrenItem =
                                      feedListChildren[feedListChildrenIndex];
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: wrapWithModel(
                                                model: _model.feedCardModels
                                                    .getModel(
                                                  feedListChildrenItem.animalID,
                                                  feedListChildrenIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child: FeedCardWidget(
                                                  key: Key(
                                                    'Keyc1j_${feedListChildrenItem.animalID}',
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
                            );
                          },
                        );
                      },
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
