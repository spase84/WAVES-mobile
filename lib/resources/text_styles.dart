import 'package:flutter/material.dart';

class TextStyles {
  button(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  button2(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
  }

  ///
  /// HEADLINE
  ///

  h1(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 34,
    );
  }

  h1per2(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  h2(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    );
  }

  h2and5(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  h3(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );
  }

  ///
  /// REGULAR
  ///

  title1(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
  }

  title2(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  tittle3(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  title3per(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      decoration: TextDecoration.lineThrough,
    );
  }

  caption1(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
  }

  ///
  /// MEDIUM
  ///

  title1medium(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  title2medium(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  title3meduim(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
  }

  title1per2(color) {
    return TextStyle(
      decoration: TextDecoration.lineThrough,
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
  }

  title2per2(color) {
    return TextStyle(
      decoration: TextDecoration.lineThrough,
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  title1semibold(color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
  }
}
