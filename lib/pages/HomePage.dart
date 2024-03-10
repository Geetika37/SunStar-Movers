import 'package:flutter/material.dart';
import 'package:sunstarmovers/pages/navBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        leading: Builder(
            builder: (context) {
              return IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon: Icon(Icons.menu,color: Colors.white,),);
            }
        ),
        title: Text("Hello Steve ,",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(image: AssetImage("assets/Group.png")),
          )
        ],
      ),
      drawer: navBar(),

    );
  }
}
