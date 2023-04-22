import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: const [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
          ),
          child: Center(
            child: Text(
              'Menu Lateral',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('message'),
        ),
        ListTile(
          leading: Icon(
            Icons.adb,
            color: Colors.green,
          ),
          title: Text('Android'),
        ),
        ListTile(
          leading: Icon(Icons.yard_outlined),
          title: Text('Flower'),
        ),
        ListTile(
          leading: Icon(
            Icons.woo_commerce,
            color: Colors.orange,  
          ),
          title: Text('Woo'),
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.pink,
            ),
          title: Text('message'),
        ),
      ],
    );
  }
}