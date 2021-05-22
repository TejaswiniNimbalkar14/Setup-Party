import 'package:flutter/material.dart';
import 'package:untitled/user_login.dart';
class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}
class _UserRegisterState extends State<UserRegister> {
  String _userName = "";
  String _userPhone = "";
  String _userBirth = "";
  String _userEmail = "";
  String _userPassword = "";
  final GlobalKey<FormState> _userRegisterKey = GlobalKey<FormState>();
  final focusBirth = FocusNode();
  final focusPhone = FocusNode();
  final focusEmail = FocusNode();
  final focusPass1 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Register"), centerTitle: true, backgroundColor: Colors.pink[600],),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: Column(
            children: <Widget> [
              Form(
                //autovalidate: true,
                key: _userRegisterKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          icon: Icon(Icons.person, color: Colors.pink),
                          hintText: "Enter Name",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if(value.toString().isEmpty) {
                            return 'Name is required';
                          }
                          if(!RegExp(r'^[a-zA-Z]+$').hasMatch(value.toString())){
                            return "Enter a valid name";
                          }
                          return null;
                        },
                        onFieldSubmitted: (v){
                          FocusScope.of(context).requestFocus(focusBirth);
                        },
                        onSaved: (value) => _userName = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        focusNode: focusBirth,
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          icon: Icon(Icons.cake, color: Colors.pink),
                          hintText: "Enter Birth Date",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if(value.toString().isEmpty) {
                            return 'Birth date is required';
                          }
                          if(!RegExp("^(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})\$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))\$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})\$").hasMatch(value.toString())){
                            return "Enter a valid birth date";
                          }
                          return null;
                        },
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focusPhone);
                        },
                        onSaved: (value) => _userBirth = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                      focusNode: focusPhone,
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          icon: Icon(Icons.contact_phone, color: Colors.pink),
                          hintText: "Enter Phone no.",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if(value.toString().isEmpty) {
                            return 'Phone no. is required';
                          }
                          else if(value.toString().length!=10){
                            return "Enter a 10 digit phone no.";
                          }
                          else if(!RegExp(r'(^[0-9]*$)').hasMatch(value.toString())) {
                            return 'Phone no. must be digit';
                          }
                          return null;
                        },
                        onFieldSubmitted: (v){
                          FocusScope.of(context).requestFocus(focusEmail);
                        },
                        onSaved: (value) => _userPhone = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        focusNode: focusEmail,
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          icon: Icon(Icons.email, color: Colors.pink),
                          hintText: "Enter Email",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value.toString().isEmpty) {
                            return 'Email is required';
                          }
                          if(!RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*").hasMatch(value.toString())){
                            return "Enter a valid email adress";
                          }
                          return null;
                        },
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focusPass1);
                        },
                        onSaved: (value) => _userName = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      focusNode: focusPass1,
                      obscureText: true,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                        icon: Icon(Icons.lock, color: Colors.pink),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Password is required';
                        }
                        else if(!RegExp("#.*^(?=.{8,20})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*\$#").hasMatch(value.toString())) {
                          return "Strong password";
                        }
                        return null;
                      },
                      onSaved: (value) => _userPassword = value.toString(),
                    ),
                    SizedBox(height: 30,),
                    Tooltip(
                      message: 'Click to register!',
                      child: RaisedButton(
                          elevation: 10.0,
                          color: Colors.pink,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Text("Register",
                            style: TextStyle(color: Colors.white, fontSize: 16.0),),
                          onPressed: () {
                            // if(_userRegisterKey.currentState.validate()) {
                            //   _userRegisterKey.currentState.save();
                            // }
                          },
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Text("Continue with social media!"),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.red[600]
                      ),
                      child: Center(
                        child: Tooltip(
                          message: "Register with Google!",
                          child: FlatButton(
                            child: Text("Google", style: TextStyle(color: Colors.white),),
                            onPressed: (){

                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[900]
                      ),
                      child: Center(
                        child: Tooltip(
                          message: "Register with Facebook!",
                          child: FlatButton(
                            child: Text("Facebook", style: TextStyle(color: Colors.white),),
                            onPressed: (){

                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin())),
                    child: Text("Already have an account?Log in",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),),
                  ),
                ),
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}