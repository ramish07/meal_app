import 'package:flutter/material.dart';
import 'package:mealapp/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget listTile(String text,IconData icon,Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         listTile('Meals',Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/'); 
         }),
         listTile('Settings',Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
         }),
        ],
      ),
    );
  }
}
