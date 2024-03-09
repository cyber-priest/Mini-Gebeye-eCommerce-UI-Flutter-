import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Profile Page', style: TextStyle(color: Colors.black)),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0),
                        spreadRadius: 3,
                        blurRadius: 15)
                  ]),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green.shade300,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mikael" + " " + "Alehegn",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 26, 36, 95),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "mikael.dev.official@gmail.com",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 26, 36, 95),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          // size: 1,
                        ),
                        label: Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0),
                        spreadRadius: 3,
                        blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.settings,
                        color: Colors.indigoAccent,
                      ),
                      title: Text("Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          )),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.question_mark,
                        color: Colors.redAccent,
                      ),
                      title: Text("FAQ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          )),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      onTap: () async {},
                      leading: Icon(
                        Icons.policy,
                        color: Colors.purple,
                      ),
                      title: Text("Terms & Policies",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          )),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                      ),
                      title: Text("About",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          )),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ))
          ],
        ));
  }
}
