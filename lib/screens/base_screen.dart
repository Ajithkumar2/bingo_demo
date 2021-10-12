import 'package:bingo_demo/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Coming Soon',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    OrdersListPage(),
    Text('Coming Soon',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    Text('Coming Soon',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    Text('Coming Soon',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 25,
            onTap: _onItemTapped,
            elevation: 5,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  label: "Home",
                  activeIcon: Icon(Icons.home, color: Color(0xff5d39c1)),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
                label: 'Orders',
                activeIcon: Icon(Icons.production_quantity_limits_outlined,
                    color: Color(0xff5d39c1)),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.padding_outlined, color: Colors.grey),
                  activeIcon:
                      Icon(Icons.padding_outlined, color: Color(0xff5d39c1)),
                  label: "Products",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined, color: Colors.grey),
                  label: "Manage",
                  activeIcon:
                      Icon(Icons.list_alt_outlined, color: Color(0xff5d39c1)),
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon:
                      Icon(Icons.manage_accounts_outlined, color: Colors.grey),
                  label: "Accounts",
                  activeIcon: Icon(Icons.manage_accounts_outlined,
                      color: Color(0xff5d39c1)),
                  backgroundColor: Colors.white),
            ]));
  }
}
