import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

Widget defaultTextButton({
  required Function() function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.blue),
      ),
    );

Widget defaultTextFormField({
  required TextInputType type,
  required TextEditingController controller,
  var onSumbit,
  var onChanged,
  required String label,
  required String? Function(String?) validate,
  required var prefix,
  var suffix,
  var obsecuretext = false,
  var suffixpressed,
  var onTap,
  Color? focusedBorderColor, 
  Color? enabledBorderColor,
  TextStyle? labelStyle 
}) =>
    TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: obsecuretext,
      onFieldSubmitted: onSumbit,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        prefixIcon: Icon(prefix,color: Colors.blue,),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
            : null,
        border:  OutlineInputBorder(
          borderSide: BorderSide(
            color: enabledBorderColor??Colors.black
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue
          )
        )
      ),
    );

 defaultAppBar(
{
  required BuildContext context ,
  String? title ,
  List<Widget>? actions 
}) =>  AppBar(
  leading: IconButton(onPressed: (){
    Navigator.pop(context);
  },icon: Icon(Icons.arrow_back_ios_new_sharp),),
  title: Text(title!),
  titleSpacing: 0.0,
  actions: actions,

);

Widget defaultButton({
  double width = double.infinity,
  required String text,
  required  Function() function,
  BuildContext? context,
}) =>
    SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor:
              Theme.of(context!).primaryColor, // Set text color to white
        ),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
    case ToastStates.ERROR:
      color = Colors.red;
    case ToastStates.WARNING:
      color = Colors.amber;
  }
  return color;
}
