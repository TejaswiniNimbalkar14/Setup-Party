import 'package:flutter/material.dart';
import 'package:untitled/product_upload.dart';
import 'package:untitled/select_shop_category.dart';
import 'package:untitled/user_login.dart';
import 'package:untitled/user_register.dart';

//testing commit
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome!"),
          centerTitle: true,
          backgroundColor: Colors.pink[600],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                height: 80,
                child: DrawerHeader(
                  child: Text(
                    "Have fun with us!",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.pink.shade700,
                            Colors.pink.shade600,
                            Colors.pink.shade500
                          ]),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              new ListTile(
                title: Text(
                  "About",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              new Divider(),
              new ListTile(
                title: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(Icons.add),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterRadio()));
                },
              ),
              new Divider(),
              new ListTile(
                title: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserLogin())),
                trailing: Icon(Icons.ac_unit),
              ),
              new Divider(),
              new ListTile(
                title: Text(
                  "Product Upload",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductUpload())),
                trailing: Icon(Icons.file_upload),
              ),
              new Divider(),
            ],
          ),
        ),
        body: Center(
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://www.architectureartdesigns.com/wp-content/uploads/2014/12/20-Fabulous-Balloon-Decorations-You-Can-Get-Ideas-From-For-Your-Next-Celebration-19-630x707.jpg"),
          ),
        ));
  }
}

//To select whether to register as user or vendor using radio button
class RegisterRadio extends StatefulWidget {
  @override
  _RegisterRadioState createState() => _RegisterRadioState();
}

class _RegisterRadioState extends State<RegisterRadio> {
  String _registerRadio = ''; //for groupValue of radio buttons
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register as :"),
        centerTitle: true,
        backgroundColor: Colors.pink[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(60.0, 180.0, 60.0, 0.0),
          child: Column(
            children: <Widget>[
              RadioListTile(
                //User radio button
                groupValue: _registerRadio,
                activeColor: Colors.pinkAccent,
                title: Text("User"),
                value: "user",
                onChanged: (value) {
                  setState(() {
                    _registerRadio = value.toString();
                  });
                },
              ),
              Divider(),
              RadioListTile(
                //Vendor radio button
                groupValue: _registerRadio,
                activeColor: Colors.pinkAccent,
                title: Text("Vendor"),
                value: "vendor",
                onChanged: (value) {
                  setState(() {
                    _registerRadio = value.toString();
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Tooltip(
                message: 'Click Next to proceed!',
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    primary: Colors.pink,
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_registerRadio == 'user') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserRegister()));
                    } else if (_registerRadio == 'vendor') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectShopCategory()));
                    } else
                      registerRadioAlert(context); //alert dialog
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Alert Dialog if no radio button selected before submit
  void registerRadioAlert(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Choose one of two!"),
      actions: [
        TextButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(), //disable dialog
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
