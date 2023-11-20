import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PetSearchCall {
  static Future<ApiCallResponse> call({
    String? searchBreed = '\'\'',
    bool? searchDogs,
    bool? searchCats,
    List<double>? userLocationList,
    int? next,
    String? last = '',
    int? loadedItems,
    int? limit = 100,
    int? page = 1,
  }) async {
    final userLocation = _serializeList(userLocationList);

    final ffApiRequestBody = '''
{
  "searchBreed": "$searchBreed",
  "searchDogs": $searchDogs,
  "searchCats": $searchCats,
  "userLocation": $userLocation,
  "_next": $next,
  "_last": "$last",
  "_loadedItems": $loadedItems,
  "_limit": $limit
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'petSearch',
      apiUrl:
          'https://petsearch-3pg22sntiq-uc.a.run.app/?next=$next&last=$last&loadedItems=$loadedItems&page=$page',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic pets(dynamic response) => getJsonField(
        response,
        r'''$.pets''',
        true,
      );
  static dynamic last(dynamic response) => getJsonField(
        response,
        r'''$.last''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
