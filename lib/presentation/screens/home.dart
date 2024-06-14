import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Tạo class MyHomePage và state tương ứng của nó.
class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double drawerHeaderHeight = MediaQuery.of(context).size.height * 0.2;
    String dropdownValue = 'One';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),

            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'test123',
            ),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['One', 'Two', 'Three', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(onPressed: (){
              Fluttertoast.showToast(
                msg: "Hello, this is a Toast message!",
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.black,
                textColor: Colors.red,
                fontSize: 16.0,
              );
            }, child: Text('Show Toast')),
            BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CloseButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
