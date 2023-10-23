// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImageShufflekModel extends FlutterFlowModel {
  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

class ImageShuffleWidget extends StatefulWidget {
  const ImageShuffleWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.pictures})
      : super(key: key);

  final double width;
  final double height;
  final List<PetPictureStruct> pictures;

  @override
  _ImageShuffleWidgetState createState() => _ImageShuffleWidgetState();
}

class _ImageShuffleWidgetState extends State<ImageShuffleWidget> {
  late ImageShufflekModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageShufflekModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //,{"width": 335, "height": 250, "fit": BoxFit.cover}
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Stack(
        children: [
          ...widget.pictures.map((value) {
            return Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.85,
                height: MediaQuery.sizeOf(context).height * 0.85,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Transform.rotate(
                    angle: (int.parse(value.mediaOrder) % 2 == 0)
                        ? -0.1047
                        : (int.parse(value.mediaOrder) % 3 == 0)
                            ? 0.1047
                            : 0,
                    child: ClipRRect(
                        child: Image.memory(base64Decode(value.smallUrlBase64),
                            width: 335, height: 250, fit: BoxFit.cover))),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
