import 'package:valorant_app/model/abilityModel.dart';

class AgentValo {
  final String name;
  final String description;
  final String urlFullImage;
  final String roleName;
  final String descRole;
  final String color;
  final Abilities ability;

  AgentValo(
      {required this.name,
      required this.description,
      required this.urlFullImage,
      required this.roleName,
      required this.descRole,
      required this.ability,
      required this.color});
}
