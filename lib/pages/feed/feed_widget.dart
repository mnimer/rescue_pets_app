import '/backend/backend.dart';
import '/components/empty_search_results_message_widget.dart';
import '/components/feed_card_with_carousel_widget.dart';
import '/components/search_and_sort_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

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
            onPressed: () async {
              context.pushNamed('Home');
            },
          ),
          title: Text(
            'Dogs / Puppies',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
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
                      child: wrapWithModel(
                        model: _model.searchAndSortBarModel,
                        updateCallback: () => setState(() {}),
                        child: SearchAndSortBarWidget(),
                      ),
                    ),
                  ),
                  FutureBuilder<List<PetsRecord>>(
                    future: (_model.firestoreRequestCompleter ??=
                            Completer<List<PetsRecord>>()
                              ..complete(queryPetsRecordOnce(
                                queryBuilder: (petsRecord) => petsRecord
                                    .where(
                                      '_isDeleted',
                                      isEqualTo: false,
                                    )
                                    .where(
                                      'species',
                                      isEqualTo: widget.species != ''
                                          ? widget.species
                                          : null,
                                    )
                                    .orderBy('_lastUpdated', descending: true),
                                limit: 25,
                              )))
                        .future,
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<PetsRecord> listViewPetsRecordList = snapshot.data!;
                      if (listViewPetsRecordList.isEmpty) {
                        return EmptySearchResultsMessageWidget(
                          species: widget.species,
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(
                              () => _model.firestoreRequestCompleter = null);
                          await _model.waitForFirestoreRequestCompleted();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPetsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPetsRecord =
                                listViewPetsRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 24.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                child: Container(
                                  height: 475.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.feedCardWithCarouselModels
                                          .getModel(
                                        widget.species,
                                        listViewIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: FeedCardWithCarouselWidget(
                                        key: Key(
                                          'Keytvu_${widget.species}',
                                        ),
                                        pet: listViewPetsRecord,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
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
