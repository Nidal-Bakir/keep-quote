import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:provider/provider.dart';
import '../models/quote_model.dart';
import '../providers/quote_provider.dart';
import '../widgets/appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddQuotePage extends StatefulWidget {
  final Quote quote;

  AddQuotePage({Key key, this.quote}) : super(key: key);

  @override
  _AddQuotePageState createState() => _AddQuotePageState();
}

class _AddQuotePageState extends State<AddQuotePage> {
  final form = GlobalKey<FormState>();
  String text, author;
  QuoteProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<QuoteProvider>(context, listen: false);
  }

  void getValues() {
    if (form.currentState.validate()) {
      form.currentState.save();
      storeTheQuote();
    }
  }

  void storeTheQuote() {
    provider
        .addQuote(Quote(DateTime.now().millisecondsSinceEpoch, text, author));
    form.currentState.reset();
    Fluttertoast.showToast(
      gravity: ToastGravity.CENTER,
      textColor: Colors.white,
      fontSize: 20.0,
      backgroundColor: Theme.of(context).accentColor,
      msg: 'Done',
    );
  }

  @override
  void dispose() {
    Fluttertoast.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add your quote',
        elevation: 5.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
              key: form,
              child: Column(
                children: [
                  SizedBox(height: 5.0),
                  TextFormField(
                    onSaved: (value) {
                      author = value;
                    },
                    validator: (value) {
                      if (value.trim().isEmpty) return 'the field is empty';
                      return null;
                    },
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(letterSpacing: 1),
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(),
                        labelText: 'Author'),
                  ),
                  SizedBox(height: 24.0),
                  TextFormField(
                    onSaved: (value) {
                      text = value;
                    },
                    validator: (value) {
                      if (value.trim().isEmpty) return 'the field is empty';

                      return null;
                    },
                    maxLines: 6,
                    minLines: 1,
                    style: Theme.of(context).textTheme.headline6,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'The quote'),
                  ),
                  SizedBox(height: 16.0),
                  FlatButton(
                    onPressed: () {
                      getValues();
                    },
                    child: Text(
                      'SAVE',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
