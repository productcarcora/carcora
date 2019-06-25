import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'secondscreen.dart';

void main() => runApp(MyApp());

/* final dummySnapshot = [
  {"name": "Filip", "votes": 15},
  {"name": "Abraham", "votes": 14},
  {"name": "Richard", "votes": 11},
  {"name": "Ike", "votes": 10},
  {"name": "Justin", "votes": 1},
]; */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View',
      //initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carco')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('baby').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  final FirebaseAuth fbAuth = FirebaseAuth.instance;
  final Firestore db = Firestore.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  void _signInWithGoogle() async {
    try {
      //FirebaseUser User;
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.getCredential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      FirebaseUser user = await fbAuth.signInWithCredential(authCredential);
      print(user);
    } catch (e) {
      print(e);
    } finally {
      print("Done");
    }
  }

  /*  void _signInWithFaceBook() async {
    try {
      //FirebaseUser User;
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.getCredential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      FirebaseUser user = await fbAuth.signInWithCredential(authCredential);
      print(user);
    } catch (e) {
      print(e);
    } finally {
      print("Done Facebook Login");
    }
  }
 */
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
        ),
        Padding(
          key: ValueKey(record.name),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Stack(
              children: <Widget>[
                ListTile(
                    title: Text(record.name),
                    subtitle: Text("Testing"),
                    trailing: Text(record.votes.toString()),
                    onTap: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/second');
                      //print(record);
                    }),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: RaisedButton(
                        child: Text('Login with Google'),
                        onPressed: () {
                          _signInWithGoogle();
                          // Navigate to the second screen using a named route.
                          //Navigator.pushNamed(context, '/');
                        },
                      ),
                    ),
                  ],
                ),
                /* ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: RaisedButton(
                        child: Text('Login with Facebook'),
                        onPressed: () {
                          _signInWithFaceBook();
                          // Navigate to the second screen using a named route.
                          //Navigator.pushNamed(context, '/');
                        },
                      ),
                    ),
                  ],
                ) */
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
