import 'package:flutter/material.dart';
import 'package:untitled/select_services.dart';

class SelectShopCategory extends StatefulWidget {
  @override
  _SelectShopCategoryState createState() => _SelectShopCategoryState();
}

class _SelectShopCategoryState extends State<SelectShopCategory> {
  String shopCategories = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Category"),
        centerTitle: true,
        backgroundColor: Colors.pink[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(60.0, 80.0, 60.0, 0.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Choose Shop Category!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Divider(),
                RadioListTile(
                  groupValue: shopCategories,
                  activeColor: Colors.pinkAccent,
                  title: Text("Cafe"),
                  value: "cafe",
                  onChanged: (value) {
                    setState(() {
                      shopCategories = value.toString();
                    });
                  },
                ),
                Divider(),
                RadioListTile(
                  groupValue: shopCategories,
                  activeColor: Colors.pinkAccent,
                  title: Text("Cake Shop"),
                  value: "cakeShop",
                  onChanged: (value) {
                    setState(() {
                      shopCategories = value.toString();
                    });
                  },
                ),
                Divider(),
                RadioListTile(
                  groupValue: shopCategories,
                  activeColor: Colors.pinkAccent,
                  title: Text("Gift Shop"),
                  value: "giftShop",
                  onChanged: (value) {
                    setState(() {
                      shopCategories = value.toString();
                    });
                  },
                ),
                Divider(),
                RadioListTile(
                  groupValue: shopCategories,
                  activeColor: Colors.pinkAccent,
                  title: Text("Meeting Point"),
                  value: "meetingPoint",
                  onChanged: (value) {
                    setState(() {
                      shopCategories = value.toString();
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Tooltip(
                    message: "Click Next to proceed!",
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
                        if (shopCategories == 'cafe')
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CafeServices()));
                        else if (shopCategories == 'cakeShop')
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CakeShopServices()));
                        else if (shopCategories == 'giftShop')
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GiftShopServices()));
                        else if (shopCategories == 'meetingPoint')
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MeetingPointServices()));
                        else
                          selectShopAlert(context);
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

  void selectShopAlert(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Please select shop category!"),
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
