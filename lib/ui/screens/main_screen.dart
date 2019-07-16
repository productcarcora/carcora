import 'package:flutter/material.dart';
import 'package:login/business/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/models/user.dart';

class MainScreen extends StatefulWidget {
  final FirebaseUser firebaseUser;

  MainScreen({this.firebaseUser});

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print(widget.firebaseUser);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: new AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Carcora'),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
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
          body: TabBarView(
            children: [
              StreamBuilder(
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
                          Text("UID: ${snapshot.data.userID}"),
                        ],
                      ),
                    );
                  }
                },
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }

  void _logOut() async {
    Auth.signOut();
  }
}
