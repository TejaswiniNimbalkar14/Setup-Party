import 'dart:io';
//import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class ProductUpload extends StatefulWidget {
  @override
  _ProductUploadState createState() => _ProductUploadState();
}

class _ProductUploadState extends State<ProductUpload> {
  String _productID = "";
  String _productName = "";
  String _pOriginalPrice = "";
  String _pSellingPrice = "";

  final GlobalKey<FormState> _productUploadKey = GlobalKey<FormState>();

  final _focusProName = FocusNode();
  final _focusProOriginal = FocusNode();
  final _focusProSelling = FocusNode();

  //File _image;
  Future getImageFromCamera() async {
    //var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      //_image = image;
    });
  }
  Future getImageFromGallery() async {
    //var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      //_image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Product Upload"), centerTitle: true, backgroundColor: Colors.pink[600],),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(60.0, 5.0, 60.0, 0.0),
          child: Column(
            children: <Widget>[
              Center(child: Text("Product Upload Form",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),)),
              Divider(thickness: 2.0,),
              Form(
                key: _productUploadKey,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text("Basic Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 3.0,),
                    TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          hintText: "Product ID",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if(value.toString().isEmpty) {
                            return 'Product ID is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(_focusProName),
                        onSaved: (value) => _productID = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          hintText: "Product Name",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if(value.toString().isEmpty) {
                            return 'Product Name is required';
                          }
                          return null;
                        },
                        focusNode: _focusProName,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(_focusProOriginal),
                        onSaved: (value) => _productName = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          hintText: "Product Original Price",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if(value.toString().isEmpty)
                            return 'Product Original Price is required';
                          return null;
                        },
                        focusNode: _focusProOriginal,
                        onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(_focusProSelling),
                        onSaved: (value) => _pOriginalPrice = value.toString()
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                          hintText: "Product Selling Price",
                          hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if(value.toString().isEmpty)
                            return 'Product Selling Price is required';
                          return null;
                        },
                        focusNode: _focusProSelling,
                        onSaved: (value) => _pSellingPrice = value.toString()
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2.0,),
                    Center(
                      child: Text("Upload Product Photos",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 3.0,),
                    // Container(child: _image == null ? Text("Pick Image") : Image.file(_image),
                    //   height: 150.0,
                    //   width: 150.0,
                    //   alignment: Alignment(0,0),
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
                          backgroundColor: Colors.pink[300],
                          onPressed: () => getImageFromCamera(),
                          tooltip: "Pick Image",
                          child: Icon(Icons.photo_camera),
                          heroTag: "btn1",
                        ),
                        SizedBox(width: 5,),
                        FloatingActionButton(
                          backgroundColor: Colors.pink[300],
                          onPressed: () => getImageFromGallery(),
                          tooltip: "Pick Image",
                          child: Icon(Icons.photo_library),
                          heroTag: "btn2",
                        ),
                      ],
                    ),
                    Divider(thickness: 2.0,),
                    Center(
                      child: Text("More Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 3.0,),
                    Center(
                        child: Text("Set properties of your product(Not all Mandatory)", style: TextStyle(fontSize: 16, color: Colors.pink[200]),)
                    ),
                    SizedBox(height: 3.0,),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                        hintText: "Height",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                        hintText: "Width",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                        hintText: "Length",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                        hintText: "Shape",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                        hintText: "Weight",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                        hintText: "Height",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2.0,),
                    SizedBox(height: 10,),
                    Center(
                      child: Tooltip(
                        message: 'Click to upload product!',
                        child: RaisedButton(
                          elevation: 10.0,
                          color: Colors.pink,
                          child: Text("Upload", style: TextStyle(color: Colors.white, fontSize: 16),),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            // if(_productUploadKey.currentState.validate())
                            //   _productUploadKey.currentState.save();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}