import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/business/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/models/user.dart';
import './tab_screens.dart';
import './carcora_service.dart';

class MainScreen extends StatefulWidget {
  final FirebaseUser firebaseUser;
  final String title = "Carcora";
  MainScreen({this.firebaseUser});

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  final List<Widget> _children = [];
  List<Widget> tabs = [
    TabScreen(Colors.orange),
    TabScreen(Colors.blue),
    TabScreen(Colors.green),
    TabScreen(Colors.red),
    CarcoraService(Colors.black)
  ];
  @override
  void initState() {
    super.initState();
    print(widget.firebaseUser);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: new BoxDecoration(color: Colors.blue),
              child: StreamBuilder(
                stream: Auth.getUser(widget.firebaseUser.uid),
                builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(212, 20, 15, 1.0),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  (snapshot.data.profilePictureURL != '')
                                      ? NetworkImage(
                                          snapshot.data.profilePictureURL)
                                      : AssetImage("assets/images/default.png"),
                            ),
                          ),
                          Text("Name: ${snapshot.data.firstName}"),
                          Text("Email: ${snapshot.data.email}"),
                          // Text("UID: ${snapshot.data.userID}"),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                _logOut();
                _scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ],
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            title: Text("Travel"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text("Mail"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            title: Text("Service"),
          ),
        ],
      ),
    );
  }

  void _logOut() async {
    Auth.signOut();
  }
}
