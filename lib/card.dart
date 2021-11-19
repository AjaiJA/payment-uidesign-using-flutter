import 'package:flutter/material.dart';

class DisplayDetails extends StatefulWidget {
  String? cardnumber;
  String? cardtype;
  String? securitycode;
  String? zipcode;
  String? address;
  String? country;
  String? city;
  String? state;
  String? expirydate;
  DisplayDetails(
    {
    this.cardnumber,
    this.securitycode,
    this.zipcode,
    this.address,
    this.cardtype,
    this.country,
    this.city,
    this.state,
    this.expirydate,
  }
  );

  @override
  _DisplayDetailsState createState() => _DisplayDetailsState();
}

class _DisplayDetailsState extends State<DisplayDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Check it",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Container(
          margin: new EdgeInsets.fromLTRB(0, 50, 0, 0),
          width: double.infinity,
          // height: ,
          padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            // color: Colors.red,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.card_giftcard, size: 25),
                  title: Text('Card Type - ${widget.cardtype}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  leading: Icon(Icons.card_membership, size: 25),
                  title: Text('Card Number - ${widget.cardnumber}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text('', style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  leading: Icon(Icons.security, size: 25),
                  title: Text('Security Code - ${widget.securitycode}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  leading: Icon(Icons.not_started, size: 25),
                  title: Text('state - ${widget.state}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text('', style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  leading: Icon(Icons.location_city, size: 25),
                  title: Text('city - ${widget.city}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text('', style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  leading: Icon(Icons.countertops_sharp, size: 25),
                  title: Text('country - ${widget.country}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  leading: Icon(Icons.picture_in_picture_alt_outlined, size: 25),
                  title: Text('Address - ${widget.address}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  leading: Icon(Icons.data_saver_on, size: 25),
                  title: Text('Expiry Date - ${widget.expirydate}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          ),
        ));
  }
}
