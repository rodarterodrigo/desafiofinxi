import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hint,
        this.maxLength,
        this.maxLines,
        this.errorText,
        this.isEnabled = true,
        this.prefixIcon,
        this.keyboardType = TextInputType.text,
        this.controller,
        this.helperText,
        this.isPassword = false,
        this.isAutoFocus = false});

  final String hint;
  final int maxLines;
  final int maxLength;
  final bool isEnabled;
  final String errorText;
  final Icon prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String helperText;
  final bool isPassword;
  final bool isAutoFocus;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(alignment: Alignment.centerRight, children: <Widget>[
          TextField(
              autofocus: isAutoFocus,
              obscureText: isPassword,
              controller: controller,
              autocorrect: true,
              maxLength: maxLength,
              textAlign: TextAlign.left,
              keyboardType: keyboardType,
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                  helperText: helperText,
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  contentPadding:
                  EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Theme.of(context).errorColor),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  errorText: errorText,
                  enabled: isEnabled,
                  prefixIcon: prefixIcon == null ? null : prefixIcon)),
          ]
        )
      );
  }
}
