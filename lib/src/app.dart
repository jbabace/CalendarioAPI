import 'package:flutter/material.dart';

import 'package:calendario/src/model/Cuadro.dart';
import 'package:calendario/src/model/CuadroDia.dart';
import 'package:calendario/src/model/CuadroHora.dart';
import 'package:calendario/src/model/CuadroRecreo.dart';

import 'package:calendario/src/widget/CuadrosCalendario.dart';
import 'package:calendario/src/widget/CuadrosDias.dart';
import 'package:calendario/src/widget/CuadrosHoras.dart';
import 'package:calendario/src/widget/CuadrosRecreo.dart';

import 'package:calendario/src/api/ConexionApi.dart';

class CalendarList extends StatefulWidget {
  CalendarList({Key key}) : super(key: key);

  @override
  CalendarListStage createState() => CalendarListStage();
}

class CalendarListStage extends State<CalendarList> {

  final horas = ["8:00", "8:55", "9:50", "10:45", "11:40", "12:05", "13:00", "13:55", "14:50"];
  final dias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes"];
  var listadias = ["", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes"];
  var listadatos;
  var arrayDatos = [];
  var listaDatosExcel;
  var listaDatos;
  int contador = 0;

  @override
  void initState() {
    super.initState();
    changeList();
  }

  void changeList() async {
    List respuesta = await ApiConection().loadCsvData();
    listaDatosExcel = respuesta;
    for(var datos in listaDatosExcel){
      arrayDatos.add(datos['Lunes']);
      arrayDatos.add(datos['Martes']);
      arrayDatos.add(datos['Miercoles']);
      arrayDatos.add(datos['Jueves']);
      arrayDatos.add(datos['Viernes']);
    }
    listaDatos = respuesta;
    /*for (var item in respuesta){
      
      print(item);
      print(item[""]);
    }*/
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(5),
        },
        //border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              Column(children: [
                Container() // este hueco estara vacio siempre
              ]),
              Column(
                children: [
                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(5, (index) {
                        return WidgetCuadroDia(item: new CuadroDia(dias[index]));
                      }),
                    ),
                  )
                ],
              )
            ]
          ),
          TableRow(
            children: [
              Column(
                children: [
                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(8, (index) {
                        var i = index + 1;
                        return WidgetCuadroHora(item: new CuadroHora(horas[index], horas[i]));
                      }),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  if (listaDatosExcel == null)...{
                    CircularProgressIndicator()
                  }else ...{
                    Container(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 5,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(40, (index) {
                          if (index >= 20 && index <=24) {
                            return WidgetCuadroRecreo(item: new CuadroRecreo());
                          } else{
                            if(arrayDatos[index] == ""){
                              return WidgetCuadro(
                                item: new Cuadro("", "", "", Colors.white), 
                                indice: index, 
                                arrayDatos: arrayDatos,
                                listaDatos: listaDatos);
                            }else {
                              var datosCuadro = arrayDatos[index].split("|");
                              String colorString = datosCuadro[3].split('(0x')[1].split(')')[0];
                              var color = int.parse(colorString, radix: 16);
                              return WidgetCuadro(
                                item: new Cuadro(datosCuadro[0], datosCuadro[1], datosCuadro[2], Color(color)), 
                                indice: index, 
                                arrayDatos: arrayDatos,
                                listaDatos: listaDatos);
                            }
                          }
                        }),
                      ),
                    )
                  }
                  
                ]
              )
            ]
          )
        ],
      ),
    );
  }
}