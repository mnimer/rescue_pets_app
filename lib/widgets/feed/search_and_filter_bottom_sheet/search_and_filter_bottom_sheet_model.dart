import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'search_and_filter_bottom_sheet_widget.dart'
    show SearchAndFilterBottomSheetWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchAndFilterBottomSheetModel
    extends FlutterFlowModel<SearchAndFilterBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DistanceOptions widget.
  int? distanceOptionsValue;
  FormFieldController<int>? distanceOptionsValueController;
  // State field(s) for dogSwitch widget.
  bool? dogSwitchValue;
  // State field(s) for catSwitch widget.
  bool? catSwitchValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
