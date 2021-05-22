//import 'dart:ffi';
import 'dart:io';
//import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';
class ShopRegister extends StatefulWidget {
  @override
  _ShopRegisterState createState() => _ShopRegisterState();
}

class _ShopRegisterState extends State<ShopRegister> {
  final GlobalKey<FormState> _shopRegisterKey = GlobalKey<FormState>();
  final _focusLocation = FocusNode();
  final _focusTime = FocusNode();

  String _shopName = "";
  String _shopLocation = "";
  String _shopTime = "";

  bool paytm=false;
  bool phonepe=false;
  bool gpay=false;
  bool cash=false;

  bool agree = false;

  //File _passportImage;
  Future getPassportFromCamera() async {
    //var passportImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      //_passportImage = passportImage;
    });
  }
  Future getPassportFromGallery() async {
    //var passportImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      //_passportImage = passportImage;
    });
  }

  //File _bannerImage;
  Future getBannerFromCamera() async {
    //var bannerImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      //_bannerImage = bannerImage;
    });
  }
  Future getBannerFromGallery() async {
    //var bannerImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      //_bannerImage = bannerImage;
    });
  }

  //List<Asset> images = List<Asset>();
  String _error = 'No error detected';

  @override
  void initState() {
    super.initState();
  }

  // Widget _buildGridView() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     children: List.generate(images.length, (index){
  //       Asset asset = images[index];
  //       return AssetThumb(
  //         asset: asset,
  //         width: 200,
  //         height: 200,
  //       );
  //     }),
  //   );
  // }

  Future<void> loadAssets() async {
    //List<Asset> resultList = List<Asset>();
    // String error = 'No error detected';
    // try {
    //   resultList = await MultiImagePicker.pickImages(
    //       maxImages: 10,
    //       enableCamera: true,
    //     selectedAssets: images,
    //     cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
    //     materialOptions: MaterialOptions(
    //       actionBarColor: "#abcdef",
    //       actionBarTitle: "Example App",
    //       allViewTitle: "All Photos",
    //       useDetailsView: false,
    //       selectCircleStrokeColor: "#000000",
    //     ),
    //   );
    // } on Exception catch (e) {
    //   error = e.toString();
    // }
    // if(!mounted) return;
    // setState(() {
    //   _error = error;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Shop Setup"), centerTitle: true, backgroundColor: Colors.pink[600],),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
          child: Column(
            children: <Widget>[
              Text("HURRY UP!!! Its time to setup shop!",style: TextStyle(fontSize: 20, color: Colors.brown),),
              SizedBox(height: 5,),
              Divider(),
              Center(child: Text("Setup Form",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),)),
              Form(
                //autovalidate: true,
                key: _shopRegisterKey,
                child: Column(
                  children: <Widget>[
                    Divider(),
                    TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          icon: Icon(Icons.store, color: Colors.pink),
                          hintText: "Shop Name",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if(value.toString().isEmpty) {
                            return 'Shop Name is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(_focusLocation),
                        onSaved: (value) => _shopName = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          icon: Icon(Icons.add_location, color: Colors.pink),
                          hintText: "Shop Location",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if(value.toString().isEmpty) {
                            return 'Shop Location is required';
                          }
                          return null;
                        },
                        focusNode: _focusLocation,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(_focusTime),
                        onSaved: (value) => _shopLocation = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          icon: Icon(Icons.access_time, color: Colors.pink),
                          hintText: "Scope & Time",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if(value.toString().isEmpty)
                            return 'Scope & Time is required';
                          return null;
                        },
                        focusNode: _focusTime,
                        onSaved: (value) => _shopLocation = value.toString()
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    Text("Select Payment Modes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(value: paytm,
                                activeColor: Colors.pinkAccent,
                                onChanged: (value){
                                  setState(() {
                                    //paytm=value;
                                  });
                                },
                              ),
                              Text("PayTM", style: TextStyle(fontSize: 17),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(value: phonepe,
                                activeColor: Colors.pinkAccent,
                                onChanged: (value){
                                  setState(() {
                                    //phonepe=value;
                                  });
                                },
                              ),
                              Text("PhonePe", style: TextStyle(fontSize: 17),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(value: gpay,
                                activeColor: Colors.pinkAccent,
                                onChanged: (value){
                                  setState(() {
                                    //gpay=value;
                                  });
                                },
                              ),
                              Text("Google Pay", style: TextStyle(fontSize: 17),),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(value: cash,
                                activeColor: Colors.pinkAccent,
                                onChanged: (value){
                                  setState(() {
                                    //cash=value;
                                  });
                                },
                              ),
                              Text("Cash On Delivery", style: TextStyle(fontSize: 17),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Text("Upload Photos", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 5,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Passport Photo", style: TextStyle(color: Colors.pinkAccent, fontSize: 16.0),),
                          SizedBox(height: 2.0,),
                          // Container(child: _passportImage == null ? Text("Pick Image") : Image.file(_passportImage),
                          //   alignment: Alignment(0,0),
                          //   height: 150.0,
                          //   width: 150.0,
                          //   decoration: BoxDecoration(
                          //       border: Border(
                          //           bottom: BorderSide(color: Colors.black),
                          //           left: BorderSide(color: Colors.black),
                          //           right: BorderSide(color: Colors.black),
                          //           top: BorderSide(color: Colors.black)
                          //       )
                          //   ),
                          // ),
                          SizedBox(height: 2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () => getPassportFromCamera(),
                                tooltip: "Pick Image",
                                child: Icon(Icons.photo_camera),
                                heroTag: "btn1",
                                backgroundColor: Colors.pink[300],
                              ),
                              SizedBox(width: 5,),
                              FloatingActionButton(
                                onPressed: () => getPassportFromGallery(),
                                tooltip: "Pick Image",
                                child: Icon(Icons.photo_library),
                                heroTag: "btn2",
                                backgroundColor: Colors.pink[300],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Shop's Banner/Logo", style: TextStyle(color: Colors.pinkAccent, fontSize: 16.0),),
                          SizedBox(height: 2.0,),
                          // Container(child: _bannerImage == null ? Text("Pick Image") : Image.file(_bannerImage),
                          //   alignment: Alignment(0,0),
                          //   height: 150.0,
                          //   width: 150.0,
                          //   decoration: BoxDecoration(
                          //       border: Border(
                          //           bottom: BorderSide(color: Colors.black),
                          //           left: BorderSide(color: Colors.black),
                          //           right: BorderSide(color: Colors.black),
                          //           top: BorderSide(color: Colors.black)
                          //       )
                          //   ),
                          // ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () => getBannerFromCamera(),
                                tooltip: "Pick Image",
                                child: Icon(Icons.photo_camera),
                                heroTag: "btn3",
                                backgroundColor: Colors.pink[300],
                              ),
                              SizedBox(width: 5,),
                              FloatingActionButton(
                                onPressed: () => getBannerFromGallery(),
                                tooltip: "Pick Image",
                                child: Icon(Icons.photo_library),
                                heroTag: "btn4",
                                backgroundColor: Colors.pink[300],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Photos of shop & premises", style: TextStyle(color: Colors.pinkAccent, fontSize: 16.0),),
                          Center(child: Text('Error: $_error'),),
                          FloatingActionButton(
                            tooltip: 'Pick Images',
                            heroTag: 'btn5',
                            backgroundColor: Colors.pink[300],
                            child: Icon(Icons.photo_library),
                            onPressed: loadAssets,
                          ),
                          // Expanded(
                          //   child: _buildGridView(),
                          // )
                        ],
                      ),
                    ),
                    Divider(),
                    Text("Agreement", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        Checkbox(value: agree,
                          activeColor: Colors.pinkAccent,
                          onChanged: (value){
                            setState(() {
                              //agree=value;
                            });
                          },
                        ),
                        Text("I hereby declare that all the information .")
                      ],
                    ),
                    Text("provided is true to my knowledge."),
                    SizedBox(height: 20,),
                    Center(
                      child: Tooltip(
                        message: 'Click to register!',
                        child: RaisedButton(
                          elevation: 10.0,
                          color: Colors.pink,
                          child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 16),),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            // if(_shopRegisterKey.currentState.validate()) {
                            //   _shopRegisterKey.currentState.save();
                            // }
                            // else if(!(paytm||phonepe||gpay||cash))
                            //   selectPaymentMode(context);
                            // else if(_passportImage==null)
                            //   passportDialog(context);
                            // else if(_bannerImage==null)
                            //   bannerDialog(context);
                            // else if(!agree)
                            //   agreeDialog(context);
                            // else
                            //   setupDialog(context);
                          },
                        ),
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
  }
  void selectPaymentMode(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Please select payment modes!"),
      actions: [
        FlatButton(child: Text("Ok", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
          onPressed: () => Navigator.of(context).pop(),   //disable dialog
        ),
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
  void passportDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Please upload passport photo!"),
      actions: [
        FlatButton(child: Text("Ok", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
          onPressed: () => Navigator.of(context).pop(),   //disable dialog
        ),
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
  void bannerDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Please upload shop's banner!"),
      actions: [
        FlatButton(child: Text("Ok", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
          onPressed: () => Navigator.of(context).pop(),   //disable dialog
        ),
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
  void agreeDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Agreement is mandatory!"),
      actions: [
        FlatButton(child: Text("Ok", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
          onPressed: () => Navigator.of(context).pop(),   //disable dialog
        ),
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
  void setupDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Setup Successful!"),
    );
    showDialog(context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
}