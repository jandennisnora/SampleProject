import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class PersonModel {
  String? name;
  String? height;
  String? mass;
  String? hairColor;
  String? eyeColor;
  String? birthYear;
  String? gender;
  String? homeworld;
  String? error;

  PersonModel(
      {required this.name,
      required this.height,
      required this.mass,
      required this.hairColor,
      required this.eyeColor,
      required this.birthYear,
      required this.gender,
      required this.homeworld});

  PersonModel.withError(String errorMessage) {
    error = errorMessage;
  }

  PersonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeworld = json['homeworld'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = name;
  //   data['height'] = height;
  //   data['mass'] = mass;
  //   data['hair_color'] = hairColor;
  //   data['eye_color'] = eyeColor;
  //   data['birth_year'] = birthYear;
  //   data['gender'] = gender;
  //   data['homeworld'] = homeworld;
  //   return data;
  // }

  // @override
}
