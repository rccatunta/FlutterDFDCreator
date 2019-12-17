import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Puente(),
    );
  }
}

class Puente extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return DemoCB();
  }
}


class DemoCB extends State<Puente>{
  int option=-1;
  double xini=200,yini=20;
  List<int>inst=List<int>();
  var gr=Random();
  Future timer(int t)async{
    Completer c = Completer();
    Timer(Duration(milliseconds: t), (){
      c.complete(_loop(t));
    });
  }
  _loop(int t){
    timer(t);
  }
  Widget opcion(String x,int y){
    return Container(
        color: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child:GestureDetector(
          child: Text(x,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20),),
          onTap: (){
            setState(() {
              option=y;
              inst.add(y);
            });
            Navigator.pop(context);
          },
        )

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Examen Final Dispo'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_left),
              onPressed: (){
                setState(() {
                  xini-=10;
                });
              }),
          IconButton(icon: Icon(Icons.arrow_right),
            onPressed:(){
              setState(() {
                xini+=10;
              });

            }
          ),
          IconButton(icon: Icon(Icons.keyboard_arrow_down),
              onPressed:(){
                setState(() {
                  yini+=10;
                });
              }
          ),
          IconButton(icon: Icon(Icons.keyboard_arrow_up),
              onPressed:(){
                setState(() {
                  yini-=10;
                });
              }
          ),
          IconButton(icon: Icon(Icons.delete),
            onPressed: (){
              setState(() {
                inst.clear();
              });
            },)
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            opcion("Inicio",1),
            opcion("Fin",2),
            opcion("Input",3),
            opcion("Output",4),
            opcion("If",5),
            opcion("While",6),
            opcion("Asignacion",7),
          ],
        ),
      ),
      body: GestureDetector(
        child: Stack(
          children: <Widget>[
            CustomPaint(painter: DFD(inst,xini,yini),child: Container(),),
          ],
        ),
      ),

    );
  }
}
class DFD extends CustomPainter {
  List<int>inst;
  double x, y;

  DFD(this.inst, this.x, this.y);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double xx=x,yy=y;
    Path path=Path();
    Path path2=Path();
    Paint paint=Paint()
      ..color=Colors.red
      ..style=PaintingStyle.stroke
      ..strokeWidth=2;
   /* path.lineTo(0, size.height *0.5);
    path.lineTo(100,500);
    path2.moveTo(size.width, size.height *0.3);
    path2.lineTo(size.width, size.height *0.3);
    path2.lineTo(200,500);
    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);*/
    for(int i=0;i<inst.length;i++){
      //INICIO
      if(inst[i]==1){
        canvas.drawOval(Rect.fromLTRB(xx-40,yy, xx+40,yy+30), paint);
        Path p=Path();
        p.moveTo(xx,yy+30);
        p.lineTo(xx,yy+40);
        yy+=40;
        canvas.drawPath(p, paint);
      }
      //FIN
      if(inst[i]==2){
        Path p=Path();
        p.moveTo(xx, yy);
        p.lineTo(xx, yy+10);
        canvas.drawPath(p, paint);
        canvas.drawOval(Rect.fromLTRB(xx-40,yy+10, xx+40,yy+40), paint);
        yy+=40;
      }
      //INPUT
      if(inst[i]==3){
        Path p=Path();
        p.moveTo(xx, yy);
        p.lineTo(xx, yy+13);
        yy+=10;
        canvas.drawPath(p, paint);
        Path p2=Path();
        p2.moveTo(xx-40, yy+20);
        p2.lineTo(xx-40, yy+20);
        p2.lineTo(xx+40, yy-12);
        p2.lineTo(xx+40, yy+45);
        p2.lineTo(xx-40, yy+45);
        p2.lineTo(xx-40, yy+20);
        canvas.drawPath(p2, paint);
        Path p3=Path();
        yy+=45;
        p3.moveTo(xx, yy);
        p3.lineTo(xx, yy);
        p3.lineTo(xx, yy+15);
        canvas.drawPath(p3, paint);
        yy+=15;
      }
      //OUTPUT
      if(inst[i]==4){
        Path p=Path();
        p.moveTo(xx, yy);
        p.lineTo(xx, yy+13);
        canvas.drawPath(p, paint);
        Path p2=Path();
        p2.moveTo(xx-40, yy+25);
        p2.lineTo(xx+40, yy-5);
        p2.lineTo(xx+40, yy+35);
        p2.lineTo(xx-40, yy+25);
        yy+=35;
        canvas.drawPath(p2, paint);
        Path p3=Path();
        p3.moveTo(xx, yy-7);
        p3.lineTo(xx, yy+8);
        canvas.drawPath(p3, paint);
        yy+=8;
      }
      //IF
      if(inst[i]==5){
        Path p=Path();
        p.moveTo(xx, yy);
        p.lineTo(xx, yy+15);
        canvas.drawPath(p, paint);
        yy+=15;
        Path p2=Path();
        p2.moveTo(xx, yy);
        p2.lineTo(xx-40, yy+20);
        p2.lineTo(xx,yy+40);
        p2.lineTo(xx+40,yy+20);
        p2.lineTo(xx,yy);
        canvas.drawPath(p2, paint);
        Path p3=Path();
        p3.moveTo(xx-40, yy+20);
        p3.lineTo(xx-80, yy+20);
        p3.lineTo(xx-80,yy+70);
        p3.lineTo(xx+80, yy+70);
        p3.lineTo(xx+80,yy+20);
        p3.lineTo(xx+40,yy+20);
        canvas.drawPath(p3, paint);
        yy+=70;
        Path p4=Path();
        p4.moveTo(xx, yy+2);
        p4.lineTo(xx, yy+10);
        canvas.drawPath(p4, paint);
        yy+=10;
      }
      //WHILE
      if(inst[i]==6){
        Path p=Path();
        p.moveTo(xx, yy);
        p.lineTo(xx, yy+15);
        canvas.drawPath(p, paint);
        yy+=15;
        Path p2=Path();
        p2.moveTo(xx-60, yy);
        p2.lineTo(xx+60, yy);
        p2.lineTo(xx+70,yy+20);
        p2.lineTo(xx+60,yy+40);
        p2.lineTo(xx-60,yy+40);
        p2.lineTo(xx-70,yy+20);
        p2.lineTo(xx-60,yy);
        canvas.drawPath(p2, paint);
        Path p3=Path();
        yy+=40;
        p3.moveTo(xx,yy);
        p3.lineTo(xx, yy+25);
        canvas.drawPath(p3, paint);
        canvas.drawCircle(Offset(xx,yy+40), 15, paint);
        yy+=40;
        Path p4=Path();
        p4.moveTo(xx,yy+15);
        p4.lineTo(xx, 30+yy);
        yy+=30;
        canvas.drawPath(p4, paint);
      }
      //ASIGNACION
      if(inst[i]==7){
        Path p=Path();
        p.moveTo(xx, yy);
        p.lineTo(xx, yy+15);
        canvas.drawPath(p, paint);
        yy+=15;
        Path p2=Path();
        p2.moveTo(xx-40,yy);
        p2.lineTo(xx+40,yy);
        p2.lineTo(xx+40,yy+30);
        p2.lineTo(xx-40,yy+30);
        p2.lineTo(xx-40,yy);
        yy+=30;
        canvas.drawPath(p2, paint);
        Path p4=Path();
        p4.moveTo(xx,yy);
        p4.lineTo(xx, 15+yy);
        yy+=15;
        canvas.drawPath(p4, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}




