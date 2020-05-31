class Quote {
  final int id;
  final String text;
  final String author;

  Quote(this.id, this.text, this.author);

  @override
  bool operator ==(other) {
    return this.id == other.id;
  }

  @override
  int get hashCode => super.hashCode;

//  Quote.fromDataBase(Map<>);
}
