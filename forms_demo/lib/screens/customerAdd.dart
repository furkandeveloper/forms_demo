import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forms_demo/mixins/validation_mixin.dart';
import 'package:forms_demo/models/customer.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

// with anahtar kelimesi ile bu class'ın içerisinde ValidationMixin class'ına ait fonksiyonları kullan demektir
class CustomerAddState extends State with ValidationMixin {
  // customer modeline verilerimizi set edecez
  final Customer customer = new Customer();

  String data = "";
  // formun anahtarını oluşturduk. yoksa hangi form olduğunu bilemeyiz
  final formKey = GlobalKey<FormState>();
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
                submitButton(),
                Text(
                  data,
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstNameField() {
    return TextFormField(
      // validationMixin classındaki metoda gönderir parametre göndermeye gerek yok
      validator: validateFirstName,
      onSaved: (String value) {
        customer.firstName = value;
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
      onSaved: (String value) {
        customer.lastName = value;
      },
      validator: validateLastName,
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
      onSaved: (String value) {
        customer.eMail = value;
      },
      validator: validateEmail,
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
      onSaved: (String value) {
        customer.passWord = value;
      },
      validator: validatePassword,
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
        bool result = formKey.currentState.validate();
        if (result) {
          // on saved metodlarını çalıştır
          formKey.currentState.save();
          saveCustomer(customer);
        }
      },
    );
  }

  void saveCustomer(Customer customer) {
    if (customer != null) {
      setState(() {
        data = "Validation Success and Saved Customer" + "\n" "First Name : " +
            customer.firstName + "\n"+
            "Last Name :" +
            customer.lastName + "\n"+
            "Email:" +
            customer.eMail + "\n"+
            "Pass: " +
            customer.passWord;
      });
    }
  }
}
