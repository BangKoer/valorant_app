import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_app/shared/color.dart';

class WeaponPage extends StatelessWidget {
  const WeaponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // List weapon
          WeaponItem(
              icon:
                  "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png",
              name: "Initiator",
              type: "Offensive Role"),
          WeaponItem(
              icon:
                  "https://media.valorant-api.com/agents/roles/5fc02f99-4091-4486-a531-98459a3e95e9/displayicon.png",
              name: "Sentinel",
              type: "Defensive Role"),
          WeaponItem(
              icon:
                  "https://media.valorant-api.com/agents/roles/dbe8757e-9e92-4ed4-b39f-9dfc589691d4/displayicon.png",
              name: "Duelist",
              type: "Offensive Role"),
          WeaponItem(
              icon:
                  "https://media.valorant-api.com/agents/roles/4ee40330-ecdd-4f2f-98a8-eb1243428373/displayicon.png",
              name: "Controller",
              type: "Defensive Role"),
        ],
      ),
    );
  }
}

class WeaponItem extends StatelessWidget {
  final String icon;
  final String name;
  final String type;
  const WeaponItem({
    super.key,
    required this.icon,
    required this.name,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Maincolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            // Weapon Image
            SizedBox(
              width: 15,
            ),
            Image.network(
              icon,
              scale: 2.8,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Weapon Name
                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    fontFamily: "Enamela",
                    fontSize: 28,
                    color: SecondColor,
                  ),
                ),
                Text(
                  type,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
