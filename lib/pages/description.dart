import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorant_app/shared/color.dart';

class Description extends StatelessWidget {
  final Map agents;
  const Description({super.key, required this.agents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          agents["displayName"],
          style: TextStyle(
            fontFamily: "Valorant",
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // overall Desc
            AgentDescriotion(agents: agents),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: agents['abilities'].length,
              itemBuilder: (context, index) => AbilityTile(
                name: agents['abilities'][index]["displayName"],
                desc: agents['abilities'][index]["description"],
                icon: agents['abilities'][index]["displayIcon"],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgentDescriotion extends StatelessWidget {
  const AgentDescriotion({
    super.key,
    required this.agents,
  });

  final Map agents;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // AgentPict
          Container(
            width: 150,
            height: 180 * 2,
            child: Image.network(
              agents['fullPortrait'],
              scale: 6,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          // Desc
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                SizedBox(height: 40),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        agents['role']["displayName"],
                        style: TextStyle(
                          fontFamily: "Enamela",
                          fontSize: 30,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(width: 19),
                      Image.network(
                        agents['role']["displayIcon"],
                        scale: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text(
                    agents['role']["description"],
                    softWrap: true,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "INFO",
                  style: TextStyle(
                    fontFamily: "Enamela",
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text(
                    agents['description'],
                    softWrap: true,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AbilityTile extends StatelessWidget {
  final String name;
  final String desc;
  final String icon;
  const AbilityTile({
    super.key,
    required this.name,
    required this.desc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Maincolor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // icon ability
            Container(
              height: 120,
              width: 120,
              padding: EdgeInsets.all(15),
              child: Image.network(
                icon,
              ),
            ),
            SizedBox(width: 20),
            // Desc ability
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: "Enamela",
                    fontSize: 30,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 9),
                Container(
                  width: 220,
                  child: Text(
                    desc,
                    softWrap: true,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 9),
              ],
            )
          ],
        ),
      ),
    );
  }
}
