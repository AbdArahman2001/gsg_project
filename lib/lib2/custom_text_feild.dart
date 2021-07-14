import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

 final bool isPassword ;
  CustomTextField(this.controller, this.label,[this.isPassword = false]);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  GlobalKey<FormState> textFieldGlobalKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
     child: Form(
       key: textFieldGlobalKey,
       child: TextFormField(
        controller: widget.controller,
         validator: (String value){
           if(value.length == 0) return 'Required field';
           else return null;
         },
         onSaved: (String value){
           if ( textFieldGlobalKey.currentState.validate()){
           }
         },
        decoration: InputDecoration(
          focusColor: Colors.teal,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
            labelText: widget.label,
            suffixIcon: Visibility(
              visible: widget.isPassword,
              child: IconButton(onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
                icon: isObscure ? Icon(Icons.visibility_off) : Icon(
                    Icons.remove_red_eye_rounded),),
            )
        ),
        obscureText: isObscure,
       ),
     ),
    );
  }
}
