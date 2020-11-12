import 'package:flutter/material.dart';
import 'package:calendario/src/model/CuadroRecreo.dart';
 
class WidgetCuadroRecreo extends StatefulWidget {
  WidgetCuadroRecreo({Key key, this.item}) : super(key: key);
  final CuadroRecreo item;

  @override
  _CuadroRecreoWidgetState createState() => _CuadroRecreoWidgetState();
}

class _CuadroRecreoWidgetState extends State<WidgetCuadroRecreo> {


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