import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../models/quote_model.dart';
import '.././style.dart' as style;
import '../pages/open_quote_page.dart';

class QuoteItem extends StatelessWidget {
  final Quote quote;

  const QuoteItem({Key key, this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
      child: OpenContainer(
        openColor: Theme.of(context).primaryColor,
        closedColor: Theme.of(context).primaryColor,
        transitionDuration: Duration(milliseconds:300),
        closedBuilder: (BuildContext context, void Function() action) =>
            Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                style.backGroundGradientItem1,
                style.backGroundGradientItem2
              ],
            ),
          ),
          padding: EdgeInsets.all(24.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quote.text,
                softWrap: true,
                maxLines: 10,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  quote.author,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        ),
        openBuilder: (BuildContext context, void Function() action) =>
            OpenQuote(
          quote: quote,
        ),
      ),
    );

  }
}
