import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pop up and Nav'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color btnColor=Colors.greenAccent;
  Color appBarColor=Colors.lightBlue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
                showMyDialog(alert: createAlert());
             
            }, child: Text("Montrer une alerte")),
            ElevatedButton(onPressed: (){}, child: Text("Pardi"))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: btnColor,
        onPressed:(){
       
          ScaffoldMessenger.of(context).showSnackBar(createSnack(text: "Bla bla bla"));

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  SnackBar createSnack({required String text}){
    SnackBar snack=SnackBar(action:SnackBarAction(
      label: "Changer couleur bouton",
      onPressed: (){
        setState((){
          btnColor=(btnColor==Colors.greenAccent)?Colors.redAccent:Colors.greenAccent;
        });
      },
    )
        ,content:
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.home),
        Text(text),
      ],
    )
    );
    return snack;

  }
  AlertDialog createAlert(){
    return AlertDialog(title: Text("Ma premiere Alerte"),content: Text("J'ai creer mon aleerte")
      ,actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("Ok")),
        TextButton(onPressed: (){
          Navigator.of(context).pop();
          setState((){
            appBarColor=(appBarColor==Colors.lightBlue)?Colors.lightGreenAccent:Colors.lightBlue;
          });
        }, child: const Text("Changer le App bar"))

      ],);
  }
  
  Future<void> showMyDialog({required AlertDialog alert}) async{
    await showDialog(context: context, builder: (BuildContext ctx){
      return alert;
    },barrierDismissible:false);
  }
}
