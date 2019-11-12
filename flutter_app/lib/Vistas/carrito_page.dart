
import 'package:flutter/material.dart';
import 'package:flutter_app/Vistas/servicioemp.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class CarridoPage extends StatefulWidget {
  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarridoPage>
{
  _categoryPageState(){
  //  _initdata();
    //litems.add("holis2");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Categorias servicio",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _ProductsListPageBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              color: Colors.grey,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.list,
                        color: Colors.white
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Atras",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.deepPurpleAccent,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.card_travel,
                        color: Colors.white
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Ver carro",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  _ProductsListPageBody(){
    return ListView.builder(
      itemCount: MyApp.carrito.length,
      itemBuilder: (BuildContext ctx, int index){
        return   ( MyApp.carrito[index] as _serviciomin).builder(context);
      },
    );
  }
}

class _serviciomin extends serviciosFin
{
  _serviciomin(int id, int nombre, String nombreServicio, String descripcion, TickerProvider estado) : super(id, nombre, nombreServicio, descripcion, estado);

  @override
  builder(context)
  {

      return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(right: BorderSide(width: 1.0,color: Colors.white24))
              ),
              child: Icon(Icons.category,color: Colors.white24) ,

            ),
            title: Text(this.nombre.toString() , style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            trailing:
            IconButton(
              icon: Icon(Icons.keyboard_arrow_right,color: Colors.white,size: 30.0,),
              onPressed: () =>{
               // Navigator.push(context,MaterialPageRoute(builder: (context)=> servicioemp(this._id,this._nombre)))
              },
            ),
          ),
        ),
      );

  }
}
