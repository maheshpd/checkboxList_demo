import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Map> categories = [
    {"name": "Swimming", "isChecked": false},
    {"name": "Cycling", "isChecked": false},
    {"name": "Tennis", "isChecked": false},
    {"name": "Boxing", "isChecked": false},
    {"name": "Volleyball ", "isChecked": false},
    {"name": "Bowling ", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text('Dynamic Checkboxes'),
            Text(
              '@CodeWithMahesh',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Please Choose Your Favorite Category:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: categories.map((favorite) {
                  return CheckboxListTile(
                      title: Text(favorite['name']),
                      activeColor: Colors.deepPurpleAccent,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      value: favorite["isChecked"],
                      onChanged: (val) {
                        setState(() {
                          favorite["isChecked"] = val;
                        });
                      });
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: categories.map((favorite) {
                  if (favorite['isChecked'] == true) {
                    return Card(
                      elevation: 3,
                      color: Colors.deepPurpleAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              favorite['name'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  favorite['isChecked'] =
                                      !favorite['isChecked'];
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
