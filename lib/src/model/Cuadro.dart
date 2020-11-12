import 'package:flutter/material.dart';

class Cuadro {
  String t1;
  String t2;
  String t3;
  Color color;

  Cuadro(String texto1, String texto2, String texto3, Color color){
    this.t1 = texto1;
    this.t2 = texto2;
    this.t3 = texto3;
    this.color = color;
  }
  
  
  set setTexto1(String texto){
    this.t1 = texto;
  }

  set setTexto2(String texto){
    this.t2 = texto;
  }

  set setTexto3(String texto){
    this.t3 = texto;
  }

  set setColor(Color color){
    this.color = color;
  }
}
