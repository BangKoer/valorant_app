import 'package:flutter/material.dart';
import 'package:valorant_app/pages/description.dart';
import 'package:valorant_app/pages/home.dart';
import 'package:valorant_app/services/firebase_authController.dart';
import 'package:valorant_app/services/valo_fetchData.dart';

class RoleList extends StatefulWidget {
  final String roleString;
  const RoleList({super.key, required this.roleString});

  @override
  State<RoleList> createState() => _RoleListState();
}

class _RoleListState extends State<RoleList> {
  final FirebaseAuthController _auth = FirebaseAuthController();
  Valorant_Data fetchapi = new Valorant_Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        toolbarHeight: 90,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _auth.signOut();
                });
              },
              icon: Icon(Icons.logout))
        ],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 50,
            ),
            SizedBox(width: 15),
            Column(
              children: [
                SizedBox(height: 3),
                Text(
                  "${widget.roleString}\nAgents",
                  style: TextStyle(
                    fontFamily: "Valorant",
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          // agent
          Expanded(
            child: FutureBuilder(
              future: fetchapi.getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  List agentsValo = snapshot.data!;

                  // 1. Filter Data berdasarkan kategori (role)
                  List filteredAgents = agentsValo
                      .where((agent) =>
                          agent["role"]["displayName"] == widget.roleString)
                      .toList();

                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredAgents
                        .length, // 2. Gunakan itemCount yang sudah difilter
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 330,
                      mainAxisSpacing: 40,
                    ),
                    itemBuilder: (context, index) {
                      // 3. Gunakan data yang sudah difilter
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Description(agents: filteredAgents[index]),
                            ),
                          );
                        },
                        child: Agent(
                          nama: filteredAgents[index]["displayName"],
                          photo: filteredAgents[index]["fullPortrait"],
                          bgphoto: filteredAgents[index]["background"],
                          color: int.parse(
                              "0xff${filteredAgents[index]["backgroundGradientColors"][0]}"),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
