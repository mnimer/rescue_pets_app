import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';

List<String>? speciesSearchGenerator(
  bool sDogs,
  bool sCats,
) {
  if (sDogs && !sCats)
    return ["Dogs"];
  else if (!sDogs && sCats)
    return ["Cats"];
  else if (sDogs && sCats) return ["Dogs", "Cats"];
  return null;
}

PetsStruct? createPetFromJson(dynamic pet) {
  // convert json into a Pet DataType
  try {
    /**
    final Map<String, dynamic> data = json.decode(pet);
    console.log("convert data | " + data);
    final String animalID = data['animalID'];
    final String orgID = data['orgID'];
    final String name = data['name'];
    final String breed = data['breed'];
    final String description = data['description'];
    final String descriptionPlain = data['descriptionPlain'];
    final List<PetPictureStruct> pictures =
        List<PetPictureStruct>.from(data['pictures']);
    */

    /** 
    final FFPlace location = FFPlace(
      latLng:
          LatLng(data['location']['latitude'], data['location']['longitude']),
      name: data['location']['name'],
      address: data['location']['address'],
      city: data['location']['city'],
      state: data['location']['state'],
      country: data['location']['country'],
      zipCode: data['location']['zipCode'],
    );
    final DateTimeRange available = DateTimeRange(
      start: DateTime.parse(data['available']['start']),
      end: DateTime.parse(data['available']['end']),
    );
    final List<String> tags = List<String>.from(data['tags']);
    

    return PetsStruct(
        animalID: animalID,
        orgID: orgID,
        name: name,
        breed: breed,
        description: description,
        descriptionPlain: descriptionPlain,
        pictures: pictures);
      */

    return PetsStruct(
        animalID: '123',
        orgID: '321',
        name: 'name',
        breed: 'breed',
        description: 'description',
        descriptionPlain: 'descriptionPlain',
        pictures: []);
  } catch (e) {
    print('Error parsing pet data: $e');
    return null;
  }
}

List<double> splitLatLng(LatLng? location) {
  print(location);
  print(jsonEncode(location));
  print(location?.latitude);
  print(location?.longitude);

  return [location?.latitude ?? 0.0, location?.longitude ?? 0.0];
}
