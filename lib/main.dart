import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'style.dart';
import 'pages/all_page.dart';
import 'providers/quote_provider.dart';
import 'pages/favorite_page.dart';
import 'pages/add_quote_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuoteProvider(),
      child: Consumer<QuoteProvider>(
        builder: (_, QuoteProvider provider, __) {
          return MaterialApp(
            title: 'My Quote',
            theme: provider.userTheme == UserTheme.dark
                ? darkTheme()
                : lightTheme(),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  static ScrollController sc = ScrollController();
  AnimationController _fABOffSetAnimationController;
  Animation<Offset> _fABOffsetAnimation;
  AnimationController _fABAnimationController;
  var _isFABShown = true;
  final pages = [
    FavoriteQuotes(sc),
    AllQuotes(sc),
    SettingsPage(),
  ];
  int index = 0, prevIndex = 0;

  @override
  void initState() {
    super.initState();
    _fABAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _fABOffSetAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _fABOffsetAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 1.5)).animate(
            CurvedAnimation(
                parent: _fABOffSetAnimationController, curve: Curves.ease));

    sc.addListener(scCallback);
    _fABAnimationController.value = 1;
  }

  @override
  void dispose() {
    super.dispose();
    _fABAnimationController.dispose();
    _fABOffSetAnimationController.dispose();
    sc.dispose();
    sc.removeListener(scCallback);
  }

  void scCallback() {
    if (sc.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isFABShown) {
        _fABOffSetAnimationController.forward();
        _isFABShown = false;
      }
    } else {
      if (!_isFABShown) {
        _fABOffSetAnimationController.reverse();
        _isFABShown = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuoteProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              NavigationRail(
                onDestinationSelected: (value) {
                  provider.upDateTracker(value);
                  if (value == 2) {
                    _fABAnimationController.reverse();
                  } else {
                    _fABOffSetAnimationController.reverse(); //show the FAB
                    _isFABShown = true;
                    _fABAnimationController.forward();
                  }
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
                  child: pages[index],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SlideTransition(
        position: _fABOffsetAnimation,
        child: FadeScaleTransition(
          animation: _fABAnimationController,
          child: OpenContainer(
            tappable: false,
            transitionDuration: Duration(milliseconds: 400),
            openColor: Theme.of(context).primaryColor,
            closedColor: Theme.of(context).primaryColor,
            openShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            closedBuilder: (BuildContext context, void Function() action) =>
                FloatingActionButton(
              onPressed: action,
              tooltip: 'add quote',
              child: Icon(Icons.add),
            ),
            openBuilder: (BuildContext context, void Function() action) =>
                AddQuotePage(),
          ),
        ),
      ),
    );
  }
}
