import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State {
  // formun anahtarını oluşturduk. yoksa hangi form olduğunu bilemeyiz
  final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: firstNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: lastNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: emailNameField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: passwordNameField(),
                ),
                submitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstNameField() {
    return TextFormField(
       validator: (String value){
        if (value.length<2) {
          return "First Name at least 2 character sets. ";
        }
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Jhon",
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }

  Widget lastNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Doe",
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }

  Widget emailNameField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "mail@gmail.com",
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }

  Widget passwordNameField() {
    return TextFormField(
      // şifre 1 sn sonra yıldız olacak
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "****",
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }

  Widget submitButton() {
    return FlatButton(
      child: Text("Ekle"),
      onPressed: () {
        // formun validasyonu başlayacak
        formKey.currentState.validate();
      },
    );
  }
}
