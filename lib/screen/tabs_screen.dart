import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import './favourite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
   int _selectedPageIndex = 0;

  initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'Favourites',
      },
    ];
    super.initState();
  }

 

  void _selectPage(int index) {
    //gets index automaatically
    setState(() {
      _selectedPageIndex =
          index; //here build is called when any tab is pressed and that index is also saved and used in build
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectPage, //while executing _selectpage,flutter also pass index no. of selected tab eg-0,1,2
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor:
            Colors.white, //here we gave color to selected n unselected tabs
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex:
            _selectedPageIndex, // currentindex is used because to color a tab when it is selected we need to tell it to bottomnavigaton bar that this index is selected and u need to color this
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
