import 'package:flutter/material.dart';
import 'package:valorant_app/pages/description.dart';
import 'package:valorant_app/pages/role.dart';
import 'package:valorant_app/services/firebase_authController.dart';
// import 'package:valorant_app/model/agentModel.dart';
// import 'package:valorant_app/pages/loading.dart';
import 'package:valorant_app/services/valo_fetchData.dart';
import 'package:valorant_app/shared/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndexPage = 0;
  List _pages = [
    AgentsPage(),
    RolePage(),
  ];

  final FirebaseAuthController _auth = FirebaseAuthController();

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
            SizedBox(width: 8),
            Column(
              children: [
                SizedBox(height: 3),
                Text(
                  "Valorant",
                  style: TextStyle(
                    fontFamily: "Valorant",
                    fontSize: 37,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // MainPage
          _pages[currentIndexPage],
          // Floating Navigation Bar
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 70,
                  child: BottomNavigationBar(
                    backgroundColor: Maincolor,
                    elevation: 10,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: SecondColor,
                    showUnselectedLabels: false,
                    currentIndex: currentIndexPage,
                    onTap: (value) {
                      setState(() {
                        currentIndexPage = value;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "Agent",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.gamepad),
                        label: "Role",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AgentsPage extends StatefulWidget {
  const AgentsPage({
    super.key,
  });
  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  Valorant_Data fetchapi = new Valorant_Data();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Container(
            height: 300,
            width: 500,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Maincolor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DEFY THE LIMITS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.3,
                    fontSize: 16,
                    wordSpacing: 1.3,
                  ),
                  "Padukan gaya dan pengalamanmu di panggung kompetitif global. Kamu memiliki 13 ronde untuk menyerang dan mempertahankan sisimu dengan keahlian tembak-menembak sengit serta kemampuan taktis. Dengan satu nyawa per ronde, kamu harus berpikir lebih cepat daripada lawan jika ingin tetap hidup. Habisi musuh baik di mode Competitive maupun Unranked serta Deathmatch dan Spike Rush.",
                ),
              ],
            ),
          ),
        ),
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
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: agentsValo.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 330,
                      mainAxisSpacing: 40,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Description(agents: agentsValo[index]),
                              ));
                        },
                        child: Agent(
                          nama: agentsValo[index]["displayName"],
                          photo: agentsValo[index]["fullPortrait"],
                          bgphoto: agentsValo[index]["background"],
                          color: int.parse(
                              "0xff${agentsValo[index]["backgroundGradientColors"][0]}"),
                        ),
                      );
                    },
                  );
                }
              }),
        ),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}

class Agent extends StatelessWidget {
  final String nama;
  final String photo;
  final String bgphoto;
  final int color;
  Agent({
    super.key,
    required this.nama,
    required this.photo,
    required this.color,
    required this.bgphoto,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 180,
          height: 270,
          padding: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(bgphoto),
            ),
            gradient: LinearGradient(
              colors: [
                // Color(0xFFC7F458),
                // Color(0xffbcc2ffff),
                Color(color),
                Colors.grey.shade900,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4, 1.0],
            ),
          ),
          child: OverflowBox(
            alignment: Alignment.bottomCenter,
            minWidth: 0.0,
            maxWidth: double.infinity,
            minHeight: 0.0,
            maxHeight: double.infinity,
            child: Column(
              children: [
                Image.network(
                  photo,
                  scale: 5.5,
                ),
              ],
            ),
          ),
        ),
        Text(
          nama,
          style: TextStyle(
            fontFamily: "Enamela",
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class AgentCategory extends StatefulWidget {
  final String category;
  const AgentCategory({
    super.key,
    required this.category,
  });

  @override
  State<AgentCategory> createState() => _AgentCategoryState();
}

class _AgentCategoryState extends State<AgentCategory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FilterChip(
        label: Text(
          widget.category,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black),
        ),
        backgroundColor: SecondColor,
        selectedColor: Maincolor,
        selected: isSelected,
        onSelected: (value) => setState(() {
          isSelected = value;
        }),
      ),
    );
  }
}
