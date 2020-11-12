import 'package:flutter/material.dart';
import 'package:calendario/src/model/CuadroHora.dart';
 
class WidgetCuadroHora extends StatefulWidget {
  WidgetCuadroHora({Key key, this.item}) : super(key: key);
  final CuadroHora item;

  @override
  _CuadroHoraWidgetState createState() => _CuadroHoraWidgetState();
}

class _CuadroHoraWidgetState extends State<WidgetCuadroHora> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 70,
          height: 68,
          decoration: BoxDecoration(
            color: widget.item.color,
            //borderRadius: BorderRadius.circular(10)
            border: new Border.all(
              color: Colors.black  
            )
          ),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    width: 0,
                    height: 0,
                  )
                ),
              Text('${widget.item.t1}'),
              Text('-'),
              Text('${widget.item.t2}'),
              Expanded(
                  child: Container(
                    width: 0,
                    height: 0,
                  )
                ),
            ],
          ),
        )
      ],
    );
  }

}