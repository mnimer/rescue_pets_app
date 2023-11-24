import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_and_filter_bottom_sheet_model.dart';
export 'search_and_filter_bottom_sheet_model.dart';

class SearchAndFilterBottomSheetWidget extends StatefulWidget {
  const SearchAndFilterBottomSheetWidget({
    Key? key,
    this.searchCallback,
  }) : super(key: key);

  final Future<dynamic> Function()? searchCallback;

  @override
  _SearchAndFilterBottomSheetWidgetState createState() =>
      _SearchAndFilterBottomSheetWidgetState();
}

class _SearchAndFilterBottomSheetWidgetState
    extends State<SearchAndFilterBottomSheetWidget> {
  late SearchAndFilterBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchAndFilterBottomSheetModel());

    _model.textController ??= TextEditingController();

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
        boxShadow: [
          BoxShadow(
            blurRadius: 7.0,
            color: Color(0x33000000),
            offset: Offset(0.0, -2.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
              child: Text(
                'Search & Filter pets',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    height: 135.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Autocomplete<String>(
                                  initialValue: TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return [
                                      'Domestic Short Hair (medium coat)',
                                      'Labrador Retriever',
                                      'American Pit Bull Terrier',
                                      'Husky'
                                    ].where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.textFieldKey,
                                      textController: _model.textController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      textHighlightStyle: TextStyle(),
                                      elevation: 4.0,
                                      optionBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      optionHighlightColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      maxHeight: 200.0,
                                    );
                                  },
                                  onSelected: (String selection) {
                                    setState(() => _model
                                        .textFieldSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.textFieldFocusNode = focusNode;

                                    _model.textController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.textFieldKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'SEARCH_AND_FILTER_BOTTOM_SHEET_TextField');
                                          logFirebaseEvent(
                                              'TextField_update_app_state');
                                          setState(() {
                                            FFAppState().searchBreed =
                                                _model.textFieldSelectedOption!;
                                          });
                                          logFirebaseEvent(
                                              'TextField_execute_callback');
                                          await widget.searchCallback?.call();
                                        },
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Find Breed',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shelters within',
                                  textAlign: TextAlign.start,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                FlutterFlowDropDown<int>(
                                  controller:
                                      _model.distanceOptionsValueController ??=
                                          FormFieldController<int>(
                                    _model.distanceOptionsValue ??=
                                        FFAppState().searchDistance,
                                  ),
                                  options: List<int>.from(
                                      [5, 25, 50, 100, 250, 500, -1]),
                                  optionLabels: [
                                    '5 miles',
                                    '25 miles',
                                    '50 miles',
                                    '100 miles',
                                    '250 miles',
                                    '500 miles',
                                    'anywhere'
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.distanceOptionsValue = val),
                                  width: 200.0,
                                  height: 40.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Select distance...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                  Container(
                    width: 125.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Dogs',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Switch.adaptive(
                              key: ValueKey('Dogs'),
                              value: _model.dogSwitchValue ??=
                                  FFAppState().searchDogs,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.dogSwitchValue = newValue!);
                                if (newValue!) {
                                  logFirebaseEvent(
                                      'SEARCH_AND_FILTER_BOTTOM_SHEET_dogSwitch');
                                  // Action 1.
                                  logFirebaseEvent('dogSwitch_Action1.');
                                  _model.updatePage(() {
                                    FFAppState().searchDogs = true;
                                  });
                                  logFirebaseEvent(
                                      'dogSwitch_execute_callback');
                                  await widget.searchCallback?.call();
                                } else {
                                  logFirebaseEvent(
                                      'SEARCH_AND_FILTER_BOTTOM_SHEET_dogSwitch');
                                  logFirebaseEvent(
                                      'dogSwitch_update_app_state');
                                  _model.updatePage(() {
                                    FFAppState().searchDogs = false;
                                  });
                                  logFirebaseEvent(
                                      'dogSwitch_execute_callback');
                                  await widget.searchCallback?.call();
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Cats',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Switch.adaptive(
                              key: ValueKey('Cats'),
                              value: _model.catSwitchValue ??=
                                  FFAppState().searchCats,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.catSwitchValue = newValue!);
                                if (newValue!) {
                                  logFirebaseEvent(
                                      'SEARCH_AND_FILTER_BOTTOM_SHEET_catSwitch');
                                  logFirebaseEvent(
                                      'catSwitch_update_app_state');
                                  _model.updatePage(() {
                                    FFAppState().searchCats = true;
                                  });
                                  logFirebaseEvent(
                                      'catSwitch_execute_callback');
                                  await widget.searchCallback?.call();
                                } else {
                                  logFirebaseEvent(
                                      'SEARCH_AND_FILTER_BOTTOM_SHEET_catSwitch');
                                  logFirebaseEvent(
                                      'catSwitch_update_app_state');
                                  _model.updatePage(() {
                                    FFAppState().searchCats = false;
                                  });
                                  logFirebaseEvent(
                                      'catSwitch_execute_callback');
                                  await widget.searchCallback?.call();
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ),
            Flexible(
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'SEARCH_AND_FILTER_BOTTOM_SHEET_CLOSE_BTN');
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    },
                    text: 'Close',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
