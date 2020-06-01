import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../widgets/quote_item.dart';
import '../widgets/appbar.dart';

class FavoriteQuotes extends StatelessWidget {
  final ScrollController sc;

  const FavoriteQuotes(this.sc);

  @override
  Widget build(BuildContext context) {
    var quotesList = Provider.of<QuoteProvider>(context).favoriteQuotes;

    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          CustomAppBar(
            title: 'My favorite quote',
          ),
          Expanded(
            child: ListView(
              controller: sc,
              children: quotesList.map((element) {
                return QuoteItem(
                  quote: element,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
