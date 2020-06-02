import 'package:flutter/material.dart';
import 'package:myquotes/providers/quote_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/appbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuoteProvider>(
      context,
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Settings',
      ),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            title: Text(
              'Dark theme ',
              style: Theme.of(context).textTheme.headline5,
            ),
            value: provider.userTheme == UserTheme.dark,
            onChanged: (value) {
              if (value == false) {
                provider.changeTheme(UserTheme.light);
              } else
                provider.changeTheme(UserTheme.dark);
            },
          )
        ],
      ),
    );
  }
}
