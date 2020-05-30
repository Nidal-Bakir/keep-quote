import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../widgets/quote_item.dart';
import '.././style.dart' as style;
import 'package:google_fonts/google_fonts.dart';
class AllQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var quotesList = Provider.of<QuoteProvider>(context).quotes;

    return Expanded(
      child: Column(
        children: [
          AppBar(
            elevation: 0.0,
            title: ShaderMask(
                shaderCallback: (Rect bounds) => LinearGradient(
                      colors: [
                        style.backGroundGradientItem1,
                        style.backGroundGradientItem2
                      ],
                    ).createShader(bounds),
                child: Text(
                  'My quote',
                  style:GoogleFonts.alice(fontSize: 30),
                )),
          ),
          Expanded(
            child: ListView(
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
