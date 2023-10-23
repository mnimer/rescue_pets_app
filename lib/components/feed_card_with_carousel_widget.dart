import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feed_card_with_carousel_model.dart';
export 'feed_card_with_carousel_model.dart';

class FeedCardWithCarouselWidget extends StatefulWidget {
  const FeedCardWithCarouselWidget({
    Key? key,
    required this.pet,
  }) : super(key: key);

  final PetsRecord? pet;

  @override
  _FeedCardWithCarouselWidgetState createState() =>
      _FeedCardWithCarouselWidgetState();
}

class _FeedCardWithCarouselWidgetState
    extends State<FeedCardWithCarouselWidget> {
  late FeedCardWithCarouselModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedCardWithCarouselModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1601979031925-424e53b6caaa?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxwdXBweXxlbnwwfHx8fDE2OTY4MjIwNzN8MA&ixlib=rb-4.0.3&q=80&w=400',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.pet?.name,
                        'unknown',
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.pet?.breed,
                        '\'\'',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'AdoptionPage',
                        queryParameters: {
                          'orgId': serializeParam(
                            widget.pet?.orgID,
                            ParamType.String,
                          ),
                          'pet': serializeParam(
                            widget.pet?.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    },
                    child: Text(
                      'Adopt',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'AdoptionPage',
                        queryParameters: {
                          'orgId': serializeParam(
                            widget.pet?.orgID,
                            ParamType.String,
                          ),
                          'pet': serializeParam(
                            widget.pet?.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    },
                    child: Icon(
                      Icons.double_arrow,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: SelectionArea(
                child: Text(
              valueOrDefault<String>(
                widget.pet?.descriptionPlain,
                '\'\'',
              ),
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium,
            )),
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 250.0,
                      child: CarouselSlider(
                        items: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.pet!.pictures.first.originalUrlCdnLink,
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://picsum.photos/seed/157/600',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://picsum.photos/seed/26/600',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://picsum.photos/seed/62/600',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                        carouselController: _model.carouselController ??=
                            CarouselController(),
                        options: CarouselOptions(
                          initialPage: 1,
                          viewportFraction: 0.5,
                          disableCenter: false,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.25,
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: false,
                          onPageChanged: (index, _) =>
                              _model.carouselCurrentIndex = index,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '12 likes',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '5 shares',
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0,
                    ),
                    Text(
                      'Favorite',
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.card_giftcard,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0,
                    ),
                    Text(
                      'Spoil',
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.share_sharp,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0,
                    ),
                    Text(
                      'Share',
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'AdoptionPage',
                          queryParameters: {
                            'orgId': serializeParam(
                              widget.pet?.orgID,
                              ParamType.String,
                            ),
                            'pet': serializeParam(
                              widget.pet?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.double_arrow_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 18.0,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'AdoptionPage',
                          queryParameters: {
                            'orgId': serializeParam(
                              widget.pet?.orgID,
                              ParamType.String,
                            ),
                            'pet': serializeParam(
                              widget.pet?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                            ),
                          },
                        );
                      },
                      child: Text(
                        'Adopt',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
