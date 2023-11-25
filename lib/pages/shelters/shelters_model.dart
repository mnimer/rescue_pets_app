import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/custom_nav_bar/custom_nav_bar_widget.dart';
import 'shelters_widget.dart' show SheltersWidget;
import 'package:flutter/material.dart';

class SheltersModel extends FlutterFlowModel<SheltersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for CustomNavBar component.
  late CustomNavBarModel customNavBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    customNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
