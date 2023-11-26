import 'dart:convert';

import 'package:http/http.dart';

class Valorant_Data {
  Future<List> getData() async {
    Response response = await get(Uri.parse(
        "https://valorant-api.com/v1/agents/?isPlayableCharacter=true"));
    Map dataFetch = jsonDecode(response.body);
    return dataFetch["data"];
  }
}
