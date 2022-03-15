import 'dart:math';

class NftDataBase {
  final Map<int, String> _benefits = {
    1: "Photo with the head liner (M&G)",
    2: "Open bar",
    3: "Beer",
    4: "2x1",
    5: "Vip",
    6: "sound check",
    7: "first row",
    8: "Food",
    9: "50%off",
    10: "Transport",
    11: "Soda",
    12: "Water included",
    13: "Toilets",
    14: "Wifi",
    15: "Fast past",
    16: "Recharge station",
    17: "Parking lot",
    18: "Poster"
  };

  final List<String> _collection = [];

  Map<int, String> get benefits => _benefits;

  List<String> get collection => _collection;

  List<String> benefitCollection(longitude) {
    List<int> record = [];
    do {
      int length = _benefits.length;
      var r = Random().nextInt(length) + 1;

      if (!record.contains(r)) {
        record.add(r);
        _collection.add(
          _benefits[r].toString(),
        );
      }
    } while (_collection.length < longitude);

    return _collection;
  }
}



// Necesito hacer un documento excel el cual tenga 1000 celdas. 
// La celda A* corresponderá a la llave del elemento.
// La celda B* corresponderá al primer BENEFICIO* y así consecutivamente
//SERÁ UN PROCESO?????
// Todo en una función? o una función secuencial???