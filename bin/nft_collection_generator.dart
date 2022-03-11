import 'dart:math';

class NftDataBase {
  final Map<int, String> _benefits = {
    0: "Water included",
    1: "soda",
    2: "beer",
    3: "2x1",
    4: "toilets",
    5: "Wifi",
    6: "vip",
    7: "sound check",
    8: "fastpass",
    9: "food",
    10: "poster",
    11: "first row",
    12: "photo with head liner (M&G)",
    13: "transport",
    14: "50%Off",
    15: "Recharge Station",
    16: "PARKING LOT",
    17: "OPEN BAR"
  };

  final List<String> _collection = [];

  Map<int, String> get benefits => _benefits;

  List<String> get collection => _collection;
  List<String> get benefitCollection => _benefitCollection();
  List<String> _benefitCollection() {
    List<int> record = [];
    do {
      int length = _benefits.length;
      var random = Random().nextInt(length);
      var r = random;

      if (!record.contains(r)) {
        record.add(r);
        _collection.add(_benefits[r].toString());
      }
    } while (_collection.length < 3);

    return _collection;
  }
}
