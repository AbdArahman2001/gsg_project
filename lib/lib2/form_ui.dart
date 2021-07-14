import 'package:flutter/material.dart';
import 'package:gsg_first_project/lib2/distanation.dart';
import 'custom_text_feild.dart';
import 'user_info.dart';

class FormUI extends StatefulWidget {
  @override
  _FormUIState createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController shopNameController = TextEditingController();

  TextEditingController companyAddressController = TextEditingController();

  TextEditingController pioController = TextEditingController();
  bool isAccept = false;
  bool isObscure = false;
  String groupValue = 'c';
  String customerButtonValue = 'c';
  String merchantButtonValue = 'm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: customerButtonValue,
                    title: Text('Customer'),
                    groupValue: this.groupValue,
                    onChanged: (String val) {
                      groupValue = val;
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    selectedTileColor: Colors.red,
                    value: merchantButtonValue,
                    title: Text('Merchant'),
                    groupValue: this.groupValue,
                    onChanged: (String val) {
                      groupValue = val;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            CustomTextField(userNameController, 'User Name'),
            CustomTextField(emailController, 'Email'),
            CustomTextField(passwordController, 'Password', true),
            Visibility(
              visible: groupValue == 'm',
              child: CustomTextField(shopNameController, 'Shop Name'),
            ),
            Visibility(
              visible: groupValue == 'm',
              child:
                  CustomTextField(companyAddressController, 'Company Address'),
            ),
            Visibility(
              visible: groupValue == 'm',
              child: CustomTextField(pioController, 'Pio'),
            ),
            ElevatedButton(onPressed: onSaveButtonPressed, child: Text('save')),
          ],
        ),
      ),
    );
  }

  void onSaveButtonPressed() {
    if (groupValue == 'm' &&
        userNameController.text.length > 0 &&
        emailController.text.length > 0 &&
        passwordController.text.length > 0 &&
        companyAddressController.text.length > 0 &&
        shopNameController.text.length > 0 &&
        pioController.text.length > 0) {
      UserInfo userInfo = UserInfo.merchant(
          userName: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
          shopName: shopNameController.text,
          companyAddress: companyAddressController.text,
          pio: pioController.text);
      Navigator.of(context)
          .pushNamed('dest',arguments: userInfo);
    } else if (groupValue == 'c' &&
        userNameController.text.length > 0 &&
        emailController.text.length > 0 &&
        passwordController.text.length > 0) {
      UserInfo userInfo = UserInfo.customer(
        userName: userNameController.text,
        password: passwordController.text,
        email: emailController.text,
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Destination(userInfo)));
    }
  }
}
