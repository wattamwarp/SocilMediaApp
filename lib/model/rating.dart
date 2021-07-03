

class Rating{
  String _reason;
  String _givenBy;
  int _rating;


  Rating();

  Rating.fromJson(Map<String, dynamic> json)
      : _reason = json['reason'],
        _givenBy = json['givenBy'],
        _rating = json['rating'];

  Map<String, dynamic> toJson() => {
    'reason': _reason,
    'givenBy': _givenBy,
    'rating': _rating,
  };

  //
  // Rating(this._reason, this._givenBy, this._rating);
  //
  // int get rating => _rating;
  //
  // set rating(int value) {
  //   _rating = value;
  // }
  //
  // String get givenBy => _givenBy;
  //
  // set givenBy(String value) {
  //   _givenBy = value;
  // }
  //
  // String get reason => _reason;
  //
  // set reason(String value) {
  //   _reason = value;
  // }
  //

}