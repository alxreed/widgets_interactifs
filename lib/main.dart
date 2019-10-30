import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int itemSelectionne;
  bool interrupteur = false;
  double sliderDouble = 0.0;
  DateTime date;
  TimeOfDay time;

  List<Widget> radios() {
    List<Widget> l = [];
    for (int x = 0; x < 4; x++) {
      Row row = new Row(
        children: <Widget>[
          new Text("Choix numéro ${x + 1}"),
          new Radio(
            value: x,
            groupValue: itemSelectionne,
            onChanged: (int i) {
              setState(() {
                itemSelectionne = i;
                print(i);
              });
            },
          )
        ],
      );
      l.add(row);
    }
    return l;
  }

  Map check = {
    'Carottes': false,
    'Bananes': false,
    'Yaourt': false,
    'Pain': false
  };

  List<Widget> checkList() {
    List<Widget> l = [];
    check.forEach((key, value) {
      Row row = new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(key,
              style: new TextStyle(color: (value) ? Colors.green : Colors.red)),
          new Checkbox(
            value: (value),
            onChanged: (bool b) {
              setState(() {
                check[key] = b;
                print("$key $b");
              });
            },
          )
        ],
      );
      l.add(row);
    });
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new FlatButton(
              child: new Text((date == null) ? "Appuyez moi" : date.toString()),
              onPressed: montrerDate,
            ),
            new FlatButton(
              child: new Text((time == null) ? "Appuyez moi" : time.toString()),
              onPressed: montrerHeure,
            )
          ],
        ),
      ),
    );
  }

  Future<Null> montrerDate() async {
    DateTime choix = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.year,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1983),
        lastDate: new DateTime(2045));
    if (choix != null) {
      setState(() {
        date = choix;
      });
    }
  }

  Future<Null> montrerHeure() async {
    TimeOfDay heure = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());
    if (heure != null) {
      setState(() {
        time = heure;
      });
    }
  }
}

// Pour utilisateurs IPHONE

//   String changed;
// String submitted;

// return new GestureDetector(
//   onTap: () {
//     FocusScope.of(context).requestFocus(new FocusNode());
//   },
//   child: Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new TextField(
//               keyboardType: TextInputType.number,
//               onChanged: (String string) {
//                 setState(() {
//                   changed = string;
//                 });
//               },
//               onSubmitted: (String string) {
//                 setState(() {
//                   submitted = string;
//                 });
//               },
//               decoration: new InputDecoration(labelText: 'Entrez votre nom'),
//             ),
//             new Text(changed ?? ''),
//             new Text(submitted ?? '')
//           ],
//         ),
//       ),
//     )
// ),
// );

// Interrupteur ON/OFF

// new Text("Aimer vous Poople ?"),
// new Switch(
//   value: interrupteur,
//   inactiveTrackColor: Colors.red,
//   activeColor: Colors.green,
//   onChanged: (bool b) {
//     setState(() {
//       interrupteur = b;
//     });
//   },
// )

// Slider

// new Text("Valeur du slider $sliderDouble"),
//   new Slider(
//     value: sliderDouble,
//     min: 0.0,
//     max: 10.0,
//     divisions: 5,
//     inactiveColor: Colors.black,
//     activeColor: Colors.pink,
//     onChanged: (double d) {
//       setState(() {
//         sliderDouble = d;
//       });
//     },
//   )
