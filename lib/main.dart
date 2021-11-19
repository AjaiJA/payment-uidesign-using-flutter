import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_ui/form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Payment Application'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Text("Payment Information", style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.5,
                )),
                SizedBox(height: 12),
                PaymentForm(),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
