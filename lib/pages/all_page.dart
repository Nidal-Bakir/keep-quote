import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../widgets/quote_item.dart';
import '../widgets/appbar.dart';

class AllQuotes extends StatelessWidget {
  final ScrollController sc;

  const AllQuotes(this.sc);

  @override
  Widget build(BuildContext context) {
    var quotesList = Provider.of<QuoteProvider>(context).quotes;

    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          CustomAppBar(
            title: 'My quote',
          ),
          Expanded(
            child: ListView(controller: sc,
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
