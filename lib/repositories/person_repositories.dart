import 'dart:convert';
import 'package:http/http.dart';

import '../models/people_model.dart';

class PersonRepository {
  String useUrl = 'https://swapi.dev/api/people/';

  Future<List<PersonModel>> getPeople() async {
    Response response = await get(Uri.parse(useUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      return result.map((e) => PersonModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
