import 'package:expense_tracker/Screen/Add.dart';
import 'package:expense_tracker/Screen/Expenses.dart';
import 'package:expense_tracker/Screen/Report.dart';
import 'package:expense_tracker/Screen/Settings.dart';
import 'package:flutter/material.dart';

class MyAppState extends StatefulWidget {
  const MyAppState({super.key});

  @override
  State<MyAppState> createState() => _MyAppStateState();
}

// ignore: must_be_immutable

class _MyAppStateState extends State<MyAppState> {
  // ignore: unused_field
  var _selectedindex = 0;

  // ignore: unused_field
  static const List<Widget> _pages = [
    Expenses(),
    Reports(),
    Add(),
    Settings(),
  ];
  // ignore: unused_element
  void _onItemtapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(_pages[_selectedindex].toString()),
          ),
          body: _pages[_selectedindex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.paid), label: 'Expense'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart), label: 'Reports'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            currentIndex: _selectedindex,
            onTap: _onItemtapped,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue,
          ),
        ));
  }
}
