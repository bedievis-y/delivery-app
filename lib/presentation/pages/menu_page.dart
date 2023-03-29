import 'package:delivery_app/data/data.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Spacer(),
          ...List.generate(menuItem.length, (index) {
            return ListTile(
              minLeadingWidth: 20,
              leading: Icon(
                menuItem[index].icon,
                color: Colors.white,
              ),
              title: Text(
                menuItem[index].title,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {},
            );
          }),
          const Spacer(flex: 2),
        ],
      )),
    );
  }
}
