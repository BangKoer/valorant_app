import 'dart:convert';

import 'package:http/http.dart';
import 'package:valorant_app/model/abilityModel.dart';
import 'package:valorant_app/model/agentModel.dart';

class Valorant_Data {
  List dataAgentValo = [];

  Future<void> getData() async {
    Response response = await get(Uri.parse(
        "https://valorant-api.com/v1/agents/?isPlayableCharacter=true"));
    Map dataFetch = jsonDecode(response.body);
    print(dataFetch["data"].length);
    print(dataFetch["data"][3]["displayName"]);
    print(dataFetch["data"][3]["description"]);
    print(dataFetch["data"][3]["fullPortrait"]);
    dataAgentValo = dataFetch["data"];
    print(dataAgentValo.isEmpty);
    // print(dataAgentValo.isEmpty);

    // Fill the dataagentvalo with datafetch
    // for (var i = 0; i < dataFetch["data"].length; i++) {
    //   // dataAgentValo.add(
    //   //   AgentValo(
    //   //     name: dataFetch["data"][i]["displayName"],
    //   //     description: dataFetch["data"][i]["description"],
    //   //     urlFullImage: dataFetch["data"][i]["fullPortrait"],
    //   //     roleName: dataFetch["data"][i]["role"]["displayName"],
    //   //     descRole: dataFetch["data"][i]["role"]["description"],
    //   //     ability: Abilities(
    //   //       dataFetch["data"][i]["abilities"][0]["displayName"],
    //   //       dataFetch["data"][i]["abilities"][0]["description"],
    //   //       dataFetch["data"][i]["abilities"][1]["displayName"],
    //   //       dataFetch["data"][i]["abilities"][1]["description"],
    //   //       dataFetch["data"][i]["abilities"][2]["displayName"],
    //   //       dataFetch["data"][i]["abilities"][2]["description"],
    //   //       dataFetch["data"][i]["abilities"][0]["displayIcon"],
    //   //       dataFetch["data"][i]["abilities"][1]["displayIcon"],
    //   //       dataFetch["data"][i]["abilities"][2]["displayIcon"],
    //   //     ),
    //   //     color: dataFetch["data"][i]["backgroundGradientColors"][0],
    //   //   ),
    //   // );
    // }
  }
}
