import 'package:flutter/material.dart';
import 'package:untitled/user_register.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  String _loginEmail = "";
  String _loginPassword = "";
  final _userLoginKey = GlobalKey<FormState>();
  final focusPass = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.pink[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
          child: Column(
            children: <Widget>[
              Form(
                //autovalidate: true,
                key: _userLoginKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Welcome back!",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.pinkAccent, width: 2.0)),
                          icon: Icon(Icons.email, color: Colors.pink),
                          hintText: "Enter Email",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(
                                  "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                              .hasMatch(value)) {
                            return "Enter a valid email address";
                          }
                          return null;
                        },
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focusPass);
                        },
                        onSaved: (value) => _loginEmail = value.toString()),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      focusNode: focusPass,
                      obscureText: true,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pinkAccent, width: 2.0)),
                        icon: Icon(Icons.lock, color: Colors.pink),
                        hintText: "Enter Password",
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                      onSaved: (value) => _loginPassword = value.toString(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Forgot Password?"),
                    SizedBox(
                      height: 30,
                    ),
                    Tooltip(
                      message: 'Click to login!',
                      child: ElevatedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          if (_userLoginKey.currentState!.validate()) {
                            _userLoginKey.currentState!.save();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text("Continue with social media!"),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red[600]),
                      child: Center(
                        child: Tooltip(
                          message: "Log in with Google!",
                          child: TextButton(
                            child: Text(
                              "Google",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[900]),
                      child: Center(
                        child: Tooltip(
                          message: "Log in with Facebook!",
                          child: TextButton(
                            child: Text(
                              "Facebook",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserRegister()));
                    },
                    child: Text(
                      "First time here? Sign up",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
