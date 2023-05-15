import 'package:flutter/material.dart';

class ModalToSignUp extends StatelessWidget {
  const ModalToSignUp({super.key});

  Widget tiles(context) {
    final List<Map<String, dynamic>> items = [
      {'type': 'Admin'},
      {'type': 'User'},
      {'type': 'Entrance Monitor'}
    ];
    List<Widget> tiles = [];

    items.forEach((element) {
      tiles.add(Expanded(
          flex: 2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Center(
                child: ListTile(
              onTap: () {
                // Navigator.pushNamed(context, '/homepage');
              },
              leading: const Icon(
                Icons.people,
                size: 30,
              ),
              title: Text(element['type']),
            )),
          )));
    });

    Widget allTiles = Expanded(
        flex: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: tiles,
        ));

    return allTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Sign up as?',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          tiles(context),
          Expanded(
              flex: 2,
              child: Container(
                child: Center(
                    child: TextButton(
                  child: Text("Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
                height: 20,
                padding: EdgeInsets.only(top: 20, bottom: 20),
              ))
        ],
      ),
    );
  }
}
