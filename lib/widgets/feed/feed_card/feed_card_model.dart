import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/feed/login_and_signup_sheet/login_and_signup_sheet_widget.dart';
import '/widgets/feed/web_share_sheet/web_share_sheet_widget.dart';
import 'feed_card_widget.dart' show FeedCardWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

<<<<<<< HEAD:lib/components/feed_card_with_carousel_model.dart
class FeedCardWithCarouselModel extends FlutterFlowModel<FeedCardWithCarouselWidget> {
=======
class FeedCardModel extends FlutterFlowModel<FeedCardWidget> {
>>>>>>> flutterflow:lib/widgets/feed/feed_card/feed_card_model.dart
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
