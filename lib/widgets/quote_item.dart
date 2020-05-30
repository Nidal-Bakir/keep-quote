import 'package:flutter/material.dart';
import '../models/quote_model.dart';
import '.././style.dart' as style;

class QuoteItem extends StatelessWidget {
  final Quote quote;

  const QuoteItem({Key key, this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(colors: [
              style.backGroundGradientItem1,
              style.backGroundGradientItem2
            ])),
        padding: EdgeInsets.all(24.0),
        width: double.infinity,
        //double.infinity,
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
        ));
  }
}
