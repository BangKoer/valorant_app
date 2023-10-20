import 'dart:convert';

import 'package:http/http.dart';

class Valorant_Data {
  List dataAgentValo = [];

  Future<void> getData() async {
    Response response = await get(Uri.parse(
        "https://valorant-api.com/v1/agents/?isPlayableCharacter=true"));
    Map dataFetch = jsonDecode(response.body);
    print(dataFetch["data"].length);
    print(dataFetch["data"][0]["displayName"]);
    print(dataFetch["data"][3]["description"]);
    print(dataFetch["data"][3]["fullPortrait"]);
    dataAgentValo = dataFetch["data"];
    print(dataAgentValo.isEmpty);
  }
}
