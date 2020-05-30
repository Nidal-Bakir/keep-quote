import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:provider/provider.dart';

import 'style.dart';
import 'pages/all_page.dart';
import 'providers/quote_provider.dart';
import 'pages/favorite_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context, child) => child,
      create: (BuildContext context) => QuoteProvider(),
      child: MaterialApp(
        title: 'My Quote',
        theme: darkTheme(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pages = [
    AllQuotes(),
    FavoriteQuotes(),
  ];
  int index = 0, prevIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              NavigationRail(
                onDestinationSelected: (value) {
                  setState(() {
                    index = value;
                  });
                },
                backgroundColor: Theme.of(context).primaryColor,
                groupAlignment: 0.4,
                labelType: NavigationRailLabelType.selected,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    selectedIcon: Icon(Icons.favorite),
                    label: Text('Favorite'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.all_inclusive),
                    label: Text('All'),
                  ),
                NavigationRailDestination(
                    icon: Container(
                      child: Icon(Icons.settings),
                    ),
                    label: Text('Settings'),
                  ),
                ],
                selectedIndex: index,
              ),
              VerticalDivider(
                width: 2.5,
                indent: 56,
                thickness: 4,
                color: Color.fromRGBO(56, 56, 78, 1.0),
              ),
              Expanded(
                child: PageTransitionSwitcher(
                    reverse: index > prevIndex ? false : true,
                    duration: Duration(milliseconds: 600),
                    transitionBuilder: (Widget child,
                        Animation<double> primaryAnimation,
                        Animation<double> secondaryAnimation) {
                      prevIndex = index;
                      return SharedAxisTransition(
                        transitionType: SharedAxisTransitionType.vertical,
                        secondaryAnimation: secondaryAnimation,
                        animation: primaryAnimation,
                        child: child,
                      );
                    },
                    child: pages[index]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'add quote',
        child: Icon(Icons.add),
      ),
    );
  }
}
