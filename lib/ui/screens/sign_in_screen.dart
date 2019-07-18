import 'dart:ui' as prefix0;

import "package:flutter/material.dart";
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import "package:login/ui/widgets/custom_text_field.dart";
import 'package:login/business/auth.dart';
import 'package:login/business/validator.dart';
import 'package:flutter/services.dart';
import 'package:login/ui/widgets/custom_flat_button.dart';
import 'package:login/ui/widgets/custom_alert_dialog.dart';
import 'package:login/models/user.dart';

class SignInScreen extends StatefulWidget {
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  CustomTextField _emailField;
  CustomTextField _passwordField;
  bool _blackVisible = false;
  VoidCallback onBackPress;

  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };

    _emailField = CustomTextField(
      baseColor: Colors.black,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
      validator: Validator.validateEmail,
    );
    _passwordField = CustomTextField(
      baseColor: Colors.black,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _password,
      obscureText: true,
      hint: "Password",
      validator: Validator.validatePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          //color: Colors.white,
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/car1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 120.0, bottom: 100.0),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter:
                          prefix0.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        width: 200.0,
                        height: 100.0,
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.5)),
                        child: Center(
                          child: Text(
                            "Carcora",
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.25)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Icon(
                          Icons.lock_open,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: Colors.white.withOpacity(0.25),
                        margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.25)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        splashColor: Colors.red,
                        color: Colors.red,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Transform.translate(
                              offset: Offset(15.0, 0.0),
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(28.0)),
                                  splashColor: Colors.white30,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    _emailLogin();
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          _emailLogin();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        splashColor: Color(0xFF3B5998),
                        color: Colors.blue,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "LOGIN WITH GOOGLE",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Transform.translate(
                              offset: Offset(15.0, 0.0),
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(28.0)),
                                  splashColor: Colors.black,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    _signInWithGoogle();
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          _signInWithGoogle();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          alignment: Alignment.center,
                          child: Text(
                            "DON'T HAVE AN ACCOUNT?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /*  return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 70.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: Text(
                          "Sign In",
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(212, 20, 15, 1.0),
                            decoration: TextDecoration.none,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 15.0, right: 15.0),
                        child: _emailField,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 20.0, left: 15.0, right: 15.0),
                        child: _passwordField,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 40.0),
                        child: CustomFlatButton(
                          title: "Log In",
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.black,
                          onPressed: () {
                            _emailLogin(
                                email: _email.text,
                                password: _password.text,
                                context: context);
                          },
                          splashColor: Colors.black12,
                          borderColor: Color.fromRGBO(212, 20, 15, 1.0),
                          borderWidth: 0,
                          color: Color.fromRGBO(212, 20, 15, 1.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "OR",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 40.0),
                        child: CustomFlatButton(
                          title: "Google Login",
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.black,
                          onPressed: () {
                            _signInWithGoogle();
                          },
                          splashColor: Colors.black12,
                          borderColor: Color.fromRGBO(59, 89, 152, 1.0),
                          borderWidth: 0,
                          color: Color.fromRGBO(59, 89, 152, 1.0),
                        ),
                      ),
                    ],
                  ),
                  SafeArea(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: onBackPress,
                    ),
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: !_blackVisible,
              child: GestureDetector(
                onTap: () {},
                child: AnimatedOpacity(
                  opacity: _blackVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
   */
  }

  void _changeBlackVisible() {
    setState(() {
      _blackVisible = !_blackVisible;
    });
  }

  void _emailLogin(
      {String email, String password, BuildContext context}) async {
    if (Validator.validateEmail(email) &&
        Validator.validatePassword(password)) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _changeBlackVisible();
        await Auth.signIn(email, password)
            .then((uid) => Navigator.of(context).pop());
      } catch (e) {
        print("Error in email sign in: $e");
        String exception = Auth.getExceptionText(e);
        _showErrorAlert(
          title: "Login failed",
          content: exception,
          onPressed: _changeBlackVisible,
        );
      }
    }
  }

  void _signInWithGoogle() async {
    try {
      _changeBlackVisible();
      await Auth.signInWithGoogle().then((user) => {
            Auth.addUser(User(
              firstName: user.displayName,
              userID: user.uid,
              email: user.email ?? '',
              profilePictureURL: user.photoUrl ?? '',
            ))
          });
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    } finally {
      print("Done");
    }
  }

  /* void _facebookLogin({BuildContext context}) async {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      _changeBlackVisible();
      FacebookLogin facebookLogin =  FacebookLogin();
      FacebookLoginResult result = await facebookLogin
          .logInWithReadPermissions(['email', 'public_profile']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          Auth.signInWithFacebok(result.accessToken.token).then((uid) {
            Auth.getCurrentFirebaseUser().then((firebaseUser) {
              User user =  User(
                firstName: firebaseUser.displayName,
                userID: firebaseUser.uid,
                email: firebaseUser.email ?? '',
                profilePictureURL: firebaseUser.photoUrl ?? '',
              );
              Auth.addUser(user);
              Navigator.of(context).pop();
            });
          });
          break;
        case FacebookLoginStatus.cancelledByUser:
        case FacebookLoginStatus.error:
          _changeBlackVisible();
      }
    } catch (e) {
      print("Error in facebook sign in: $e");
      String exception = Auth.getExceptionText(e);
      _showErrorAlert(
        title: "Login failed",
        content: exception,
        onPressed: _changeBlackVisible,
      );
    }
  }
 */
  void _showErrorAlert({String title, String content, VoidCallback onPressed}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          content: content,
          title: title,
          onPressed: onPressed,
        );
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
