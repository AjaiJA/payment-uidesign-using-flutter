import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_ui/card.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  String? cardNumber;
  String? cardType;
  String? securitycode;
  String? zipcode;
  String? address;
  final List<String?> errors = [];
  final TextEditingController _cardTypecontroller = new TextEditingController();
  final TextEditingController _countrycontroller = new TextEditingController();
  final TextEditingController _citycontroller = new TextEditingController();
  final TextEditingController _statecontroller = new TextEditingController();
  var cardlist = [
    'Mastercard',
    'Visa',
    'Paytm',
  ];
  var citylist = [
    'Chennai',
    'Nagercoil',
    'Coimbatore',
  ];
  var statelist = [
    'Tamil Nadu',
    'Bangalore',
    'Maharashtra',
  ];
  var countrylist = [
    'India',
    'USA',
    'Russia',
  ];
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  DateTime expirydate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: expirydate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2101));
    if (picked != null && picked != expirydate)
      setState(() {
        expirydate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextField(
            controller: _cardTypecontroller,
            decoration: InputDecoration(
              labelText: "Card Type",
              // hintText: "Enter your Card Type",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (String value) {
                  _cardTypecontroller.text= value;
                },
                itemBuilder: (BuildContext context) {
                  return cardlist.map<PopupMenuItem<String>>((String value) {
                    return new PopupMenuItem(
                        child: new Text(value), value: value);
                  }).toList();
                },
              ),
            ),
          ),
          SizedBox(height:20),
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: (newValue) => cardNumber = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Field is Empty");
              } else if (value.length == 16) {
                removeError(error: "Enter a 16-digit number");
              }
              cardNumber = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Field is Empty");
                return "";
              } else if (value.length < 16) {
                addError(error: "Enter a 16-digit number");
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Card Number",
              // hintText: "Enter your Card Number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  20,
                  20,
                  20,
                ),
                child: SvgPicture.asset(
                  "assets/icons/Cash.svg",
                  height: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    labelText: "Expiry Date",
                    hintText: "${expirydate.toLocal()}".split(' ')[0],
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
    
                  onSaved: (newValue) => securitycode = newValue,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: "Field is Empty");
                    } else if (value.length == 3) {
                      removeError(error: "Enter a 3-digit number");
                    }
                    securitycode = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: "Field is Empty");
                      return "";
                    } else if (value.length != 3) {
                      addError(error: "Enter a 3-digit number");
                      return "";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Security Code",
                    // hintText: "Enter the Security Code",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Billing Address",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,)),
            ],
          ),
          SizedBox(height:20,),
          TextFormField(
            keyboardType: TextInputType.multiline,
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Field is Empty");
              }
              address = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Field is Empty");
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              // labelText: "Expiry date",
              hintText: "Address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height:20,),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _citycontroller,
                  decoration: InputDecoration(
                    // labelText: "Card Type",
                    hintText: "City",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        _citycontroller.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return citylist.map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _statecontroller,
                  decoration: InputDecoration(
                    // labelText: "State",
                    hintText: "State",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        _statecontroller.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return statelist.map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:20),
           Row(
            children: [
              Expanded(
                child: TextFormField(
                  onSaved: (newValue) => zipcode = newValue,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: "Field is Empty");
                    } 
                    // else if (value.length == 6) {
                    //   removeError(error: "Enter a 3-digit number");
                    // }
                    zipcode = value;
                  },
                  decoration: InputDecoration(
                    // labelText: "Card Type",
                    hintText: "Zipcode",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _countrycontroller,
                  decoration: InputDecoration(
                    // labelText: "State",
                    hintText: "Country",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        _countrycontroller.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return countrylist
                            .map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          FormError(errors: errors),
          SizedBox(
            height:20,
          ),
          CheckoutButton(
            text:'Checkout',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayDetails(
                      cardnumber:cardNumber,
                      securitycode:securitycode,
                      zipcode:zipcode,
                      address:address,
                      expirydate:"${expirydate.toLocal()}".split(' ')[0],
                      cardtype:_cardTypecontroller.text,
                      country:_countrycontroller.text,
                    city:_citycontroller.text,
                    state:_statecontroller.text,
                    ),
                  ),
                );
              }
            },
          ),  
          
        ],
      ),
    );
  }
}

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: 14,
          width: 14,
        ),
        SizedBox(
          width: 14,
        ),
        Text(error),
      ],
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
