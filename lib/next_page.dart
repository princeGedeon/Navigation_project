import 'package:flutter/material.dart';
class Next extends StatefulWidget{
  final color;

  Next({required this.color});

  @override
  NextState createState()=>NextState();
}

class NextState extends State<Next>{


  @override
  void initState()
  {
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("Nouvelle page"),
       backgroundColor: widget.color,
     ),
     body: Center(
       child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           ElevatedButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Retour en arriere"))
         ],
       )
     ),
   );
  }




}