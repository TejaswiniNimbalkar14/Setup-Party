import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shop_register.dart';
import 'package:flutter/rendering.dart';

//Class for Cafe Services
class CafeServices extends StatefulWidget {
  @override
  _CafeServicesState createState() => _CafeServicesState();
}

class _CafeServicesState extends State<CafeServices> {
  //For checkboxes(initially unchecked)
  bool decoration=false;
  bool place=false;
  bool music=false;
  bool food=false;
  bool cake=false;
  //Widget for cafe services checkboxes
  Widget _buildCafeServices(){
    return Column(
      children: <Widget>[
        new ListTile(
          title: Text("Cafe Services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        new Divider(),
        //Decoration
        Row(
          children: <Widget>[
            Checkbox(value: decoration,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  decoration=value!;
                });
              },
            ),
            Text("Decoration"),
          ],
        ),
        //Place
        Row(
          children: <Widget>[
            Checkbox(value: place,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  place=value!;
                });
              },
            ),
            Text("Place"),
          ],
        ),
        //Music
        Row(
          children: <Widget>[
            Checkbox(value: music,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  music=value!;
                });
              },
            ),
            Text("Music"),
          ],
        ),
        //Food
        Row(
          children: <Widget>[
            Checkbox(value: food,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  food=value!;
                });
              },
            ),
            Text("Food/Snacks/Lunch"),
          ],
        ),
        //Cake
        Row(
          children: <Widget>[
            Checkbox(value: cake,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  cake=value!;
                });
              },
            ),
            Text("Cake"),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Servies"),centerTitle: true,backgroundColor: Colors.pink[600],),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(60.0, 40.0, 60.0, 0.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20,),
                _buildCafeServices(),   //Cafe services checkbox
                SizedBox(height: 20,),
                Center(
                  child: Tooltip(
                    message: "Click Next to proceed!",
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        elevation: 10.0
                      ),
                      child: Text("Next", style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        if(!(decoration||place||music||food||cake))
                          selectCheckbox(context);    //alert dialog when no checkbox is checked
                        else
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ShopRegister()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void selectCheckbox(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Please select services!"),
      actions: [
        TextButton(child: Text("Ok", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
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
}

//Class for cake shop services
class CakeShopServices extends StatefulWidget {
  @override
  _CakeShopServicesState createState() => _CakeShopServicesState();
}

class _CakeShopServicesState extends State<CakeShopServices> {
  //for cake shop services(initially unchecked)
  bool selling=false;
  bool delivery=false;
  bool customize=false;
  bool accessories=false;
  //Widget for cake shop services
  Widget _buildCakeShopServices(){
    return Column(
      children: <Widget>[
        new ListTile(
          title: Text("Cake Shop Services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        new Divider(),
        //Cake selling
        Row(
          children: <Widget>[
            Checkbox(value: selling,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  selling=value!;
                });
              },
            ),
            Text("Cake Selling"),
          ],
        ),
        //Cake Delivery
        Row(
          children: <Widget>[
            Checkbox(value: delivery,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  delivery=value!;
                });
              },
            ),
            Text("Cake Delivery"),
          ],
        ),
        //Customization
        Row(
          children: <Widget>[
            Checkbox(value: customize,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  customize=value!;
                });
              },
            ),
            Text("Customization"),
          ],
        ),
        //Accessories
        Row(
          children: <Widget>[
            Checkbox(value: accessories,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  accessories=value!;
                });
              },
            ),
            Text("Accessories"),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Servies"),centerTitle: true,backgroundColor: Colors.pink[600]),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(60.0, 40.0, 60.0, 0.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                _buildCakeShopServices(),   //widget for cake shop services
                SizedBox(height: 20,),
                Center(
                  child: Tooltip(
                    message: "Click Next to proceed!",
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        elevation: 10.0
                      ),
                      child: Text("Next", style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        if(!(selling||delivery||customize||accessories))
                          selectCheckbox(context);    //alert dialog when no checkbox is checked
                        else
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ShopRegister()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void selectCheckbox(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Please select services!"),
      actions: [
        TextButton(child: Text("Ok", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
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
}

class GiftShopServices extends StatefulWidget {
  @override
  _GiftShopServicesState createState() => _GiftShopServicesState();
}

class _GiftShopServicesState extends State<GiftShopServices> {
  bool gselling=false;
  bool gdelivery=false;
  bool type=false;
  bool wrapping=false;

  Widget _buildGiftShopServices(){
    return Column(
      children: <Widget>[
        new ListTile(
          title: Text("Gift Shop Services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        new Divider(),
        //Gift selling
        Row(
          children: <Widget>[
            Checkbox(value: gselling,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  gselling=value!;
                });
              },
            ),
            Text("Gift Selling"),
          ],
        ),
        //Gift Delivery
        Row(
          children: <Widget>[
            Checkbox(value: gdelivery,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  gdelivery=value!;
                });
              },
            ),
            Text("Gift Delivery"),
          ],
        ),
        //Gift types according to occassions
        Row(
          children: <Widget>[
            Checkbox(value: type,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  type=value!;
                });
              },
            ),
            Text("Gift types according to occassions"),
          ],
        ),
        //Gift Wrapping
        Row(
          children: <Widget>[
            Checkbox(value: wrapping,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  wrapping=value!;
                });
              },
            ),
            Text("Gift Wrapping"),
          ],
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Servies"),centerTitle: true,backgroundColor: Colors.pink[600],),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(60.0, 40.0, 30.0, 0.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                _buildGiftShopServices(),
                SizedBox(height: 20,),
                Center(
                  child: Tooltip(
                    message: "Click Next to proceed!",
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        elevation: 10.0
                      ),
                      child: Text("Next", style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        if(!(gselling||gdelivery||type||wrapping))
                          selectCheckbox(context);    //alert dialog when no checkbox is checked
                        else
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ShopRegister()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void selectCheckbox(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Please select services!"),
      actions: [
        TextButton(child: Text("Ok", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
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
}

class MeetingPointServices extends StatefulWidget {
  @override
  _MeetingPointServicesState createState() => _MeetingPointServicesState();
}

class _MeetingPointServicesState extends State<MeetingPointServices> {
  bool achall=false;
  bool nonachall=false;
  bool electricity=false;
  bool presentation=false;
  bool generator=false;
  bool mfood=false;

  Widget _buildMeetingPointServices(){
    return Column(
      children: <Widget>[
        new ListTile(
          title: Text("Meeting Point Services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        new Divider(),
        //AC Hall
        Row(
          children: <Widget>[
            Checkbox(value: achall,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  achall=value!;
                });
              },
            ),
            Text("AC Hall"),
          ],
        ),
        //Non-AC Hall
        Row(
          children: <Widget>[
            Checkbox(value: nonachall,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  nonachall=value!;
                });
              },
            ),
            Text("Non-AC Hall"),
          ],
        ),
        //Electronic Facility
        Row(
          children: <Widget>[
            Checkbox(value: electricity,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  electricity=value!;
                });
              },
            ),
            Text("Electronic Facility"),
          ],
        ),
        //Presentation Facility
        Row(
          children: <Widget>[
            Checkbox(value: presentation,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  presentation=value!;
                });
              },
            ),
            Text("Presentation Facility"),
          ],
        ),
        //Generator Facility
        Row(
          children: <Widget>[
            Checkbox(value: generator,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  generator=value!;
                });
              },
            ),
            Text("Generator Facility"),
          ],
        ),
        //Food Facility
        Row(
          children: <Widget>[
            Checkbox(value: mfood,
              activeColor: Colors.pinkAccent,
              onChanged: (bool? value){
                setState(() {
                  mfood=value!;
                });
              },
            ),
            Text("Food/Refreshment"),
          ],
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Servies"),centerTitle: true,backgroundColor: Colors.pink[600],),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(60.0, 40.0, 60.0, 0.0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                _buildMeetingPointServices(),
                Center(
                  child: Tooltip(
                    message: "Click Next to proceed!",
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        elevation: 10.0
                      ),
                      child: Text("Next", style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        if(!(achall||nonachall||electricity||generator||presentation||mfood))
                          selectCheckbox(context);    //alert dialog when no checkbox is checked
                        else
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ShopRegister()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void selectCheckbox(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Please select services!"),
      actions: [
        TextButton(child: Text("Ok", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
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
}

