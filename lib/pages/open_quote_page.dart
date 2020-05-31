import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/quote_model.dart';
import '../providers/quote_provider.dart';
import '../widgets/appbar.dart';
import '.././style.dart' as style;

class OpenQuote extends StatefulWidget {
  final Quote quote;

  const OpenQuote({Key key, @required this.quote}) : super(key: key);

  @override
  _OpenQuoteState createState() => _OpenQuoteState();
}

class _OpenQuoteState extends State<OpenQuote> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuoteProvider>(context);
    isFav = provider.isFavorite(widget.quote);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'about this quote',
          elevation: 2,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                  onPressed: () {
                    if (provider.isFavorite(widget.quote)) {
                      provider.removeFromFavoriteQuote(widget.quote.id);
                    } else {
                      provider.addFavoriteQuote(widget.quote);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isFav ? Colors.red[900] : Colors.grey[100],
                  ),
                  label: Text(
                    'Love',
                    style: TextStyle(
                      color: isFav ? Colors.red[900] : Colors.grey[100],
                    ),
                  ),
                ),
                Text(
                  'Author : ${widget.quote.author}',
                  style: TextStyle(
                      color: Colors.grey[100], fontWeight: FontWeight.bold),
                ),
                FlatButton.icon(
                  textColor: Colors.grey,
                  onPressed: () {
                    provider.deleteQuote(widget.quote.id);
                  },
                  icon: Icon(Icons.delete),
                  label: Text(
                    'Delete ',
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    style.backGroundGradientItem1,
                    style.backGroundGradientItem2
                  ],
                ),
              ),
              child: Text(
                widget.quote.text,
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
