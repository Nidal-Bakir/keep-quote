import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'style.dart';
import 'pages/all_page.dart';
import 'providers/quote_provider.dart';

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
  var pages = [AllQuotes()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              onDestinationSelected: (value) {
                setState(() {
                  index = value;
                });
              },
              backgroundColor: Theme.of(context).primaryColor.withOpacity(1.0),
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
              width: 0.0,
              thickness: 4,
              color: Color.fromRGBO(56, 56, 78, 1.0),
            ),
            pages[index]
          ],
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
