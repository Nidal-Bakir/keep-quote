import '../database/database.dart' show QuoteTable;

class Quote {
  final int id;
  final String text;
  final String author;
  bool isFavorite = false;

  Quote(this.id, this.text, this.author);

  @override
  bool operator ==(other) {
    return this.id == other.id;
  }

  @override
  int get hashCode => super.hashCode;

  Map<String, dynamic> toMap() => {
        QuoteTable.id: id,
        QuoteTable.quote: text,
        QuoteTable.author: author,
        QuoteTable.isFavorite: isFavorite == true ? 1 : 0,
      };

  Quote.fromDataBase(Map<String, dynamic> map)
      : id = map[QuoteTable.id],
        text = map[QuoteTable.quote],
        author = map[QuoteTable.author],
        isFavorite = map[QuoteTable.isFavorite] == 0 ? false : true;
}
