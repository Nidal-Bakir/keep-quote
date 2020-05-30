import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/quote_model.dart';
import '../providers/quote_provider.dart';
import '../widgets/appbar.dart';

class OpenQuote extends StatelessWidget {
  final Quote quote;

  const OpenQuote({Key key, @required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<QuoteProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'about this quote  '),
    );
  }
}
