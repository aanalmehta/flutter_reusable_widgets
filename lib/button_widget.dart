import 'package:flutter/material.dart';

import 'color_utils.dart';


/// * This is a sample button I have created for my view. You can modify your button and make a consistent UI.
/// onClick - Button click
/// text - Button text
/// textColor - Button textColor
/// color - Button Background color
/// splashColor - Color displayed when the button is touched
/// borderRadius - Button border radius
/// minWidth - Minimum width of a button
/// height - Button height
/// borderSideColor - Border Color
/// style - Button textstyle
/// leadingIcon - If you want to display an icon before button text
/// tailingIcon - If you want to display an icon after button text
ButtonTheme raisedButton(
    {VoidCallback onClick,
      String text,
      Color textColor,
      Color color,
      Color splashColor,
      double borderRadius,
      double minWidth,
      double height,
      Color borderSideColor,
      TextStyle style,
      Widget leadingIcon,
      Widget tailingIcon}) {
  return ButtonTheme(
    minWidth: minWidth,
    height: height,
    child: RaisedButton(
        splashColor: Colors.grey.withOpacity(0.5) ?? colorBlack,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25),
            side: BorderSide(color: borderSideColor ?? color)),
        textColor: Colors.white,
        color: primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // This is must when you are using Row widget inside Raised Button
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildLeadingIcon(leadingIcon),
            Text(
              text ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                letterSpacing: 1.2,
              ),
            ),
            _buildTailingIcon(tailingIcon),
          ],
        ),
        onPressed: () {
          return onClick();
        }),
  );
}

Widget _buildLeadingIcon(Widget leadingIcon) {
  if (leadingIcon != null) {
    return Row(
      children: <Widget>[leadingIcon, SizedBox(width: 10)],
    );
  }
  return Container();
}

Widget _buildTailingIcon(Widget tailingIcon) {
  if (tailingIcon != null) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10),
        tailingIcon,
      ],
    );
  }
  return Container();
}
