import 'nft_collection_generator.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'nft_model.dart';

int getAverage(x, per) {
  var res = x * per;
  return res.round();
}

void main(List<String> arguments) {
  String nft = "NFT";

  createCollections(nft);
}

void createCollections(nft) {
  int contenedor = 100;
  var excel = Excel.createExcel();
  int index = 1, breaker = 1, counter = 1;

  List percentages = [.20, .15, .15, .20, .20, .10];
  Sheet sheetObject = excel['Lista NFTs'];
  CellStyle cellStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
  );
  for (int i = 0; i < contenedor; i++) {
    //LOOP THAT CREATES EACH NFT
//AGREGATES THE NFT ORDERED BY BENEFITS
    var generator = NftDataBase(); //DATABASE
    print("Breaker es de $breaker y Counter es de $counter");
    var title = sheetObject.cell(
      //CELL TITLE INITIALIZATION
      CellIndex.indexByString("A$index"),
    );
    title.value = index; //CELL VALUE
    title.cellStyle = cellStyle;
    print("A$index = ${title.value}");
    var model = NFTModel(
      //MODEL
      nft: nft,
      collection: generator.benefitCollection(breaker),
    );
    var bene1 = sheetObject.cell(
        //CELL BENEFIT INITIALIZATION
        CellIndex.indexByString("B$index"))
      ..value = model.collection[0].isNotEmpty ? model.collection[0] : null
      ..cellStyle = cellStyle;
    print("B$index = ${bene1.value}");

    if (index < getAverage(contenedor, percentages[1]).round()) {
      //LOOP BREAKER HASTA EL 15% DEL TOTAL
      index++; //De esta manera se procura que index sea dentro del porcentaje de NFTS de todo el contenido
      continue;
    } else {
      if (counter == 1) {
        breaker++;
        counter++;
        index++;
        continue;
      }
    }

    var bene2 = sheetObject.cell(CellIndex.indexByString("C$index"))
      ..value = model.collection[1].isNotEmpty ? model.collection[1] : null
      ..cellStyle = cellStyle;
    print("C$index = ${bene2.value}");
    if (index < //LOOP BREAKER HASTA EL 35% DEL TOTAL
        getAverage(contenedor, (percentages[1] + percentages[2])).round() + 1) {
      index++;
      continue;
    } else {
      if (counter == 2) {
        breaker++;
        counter++;
        index++;
        continue;
      }
    }

    var bene3 = sheetObject.cell(CellIndex.indexByString("D$index"))
      ..value = model.collection[1].isNotEmpty ? model.collection[2] : null
      ..cellStyle = cellStyle;
    print("D$index = ${bene3.value}");
    if (index < //LOOP BREAKER HASTA EL 50% DEL TOTAL
        getAverage(
                contenedor, (percentages[1] + percentages[2] + percentages[3]))
            .round()) {
      index++;
      continue;
    } else {
      if (counter == 3) {
        breaker++;
        counter++;
        index++;
        continue;
      }
    }

    var bene4 = sheetObject.cell(
      CellIndex.indexByString("E$index"),
    )
      ..value = model.collection[3].isNotEmpty ? model.collection[3] : null
      ..cellStyle = cellStyle;
    print("B$index = ${bene4.value}");
    if (index < //LOOP BREAKER HASTA EL 70% DEL TOTAL
        getAverage(
          contenedor,
          (percentages[1] + percentages[2] + percentages[3] + percentages[4]),
        ).round()) {
      index++;
      continue;
    } else {
      if (counter == 4) {
        breaker++;
        counter++;
        index++;
        continue;
      }
    }

    var bene5 = sheetObject.cell(
      CellIndex.indexByString("F$index"),
    )
      ..value = model.collection[4].isNotEmpty ? model.collection[4] : null
      ..cellStyle = cellStyle;
    print("B$index = ${bene5.value}");
    if (index < //LOOP BREAKER HASTA EL 90% DEL TOTAL
        getAverage(
          contenedor,
          (percentages[1] + percentages[2] + percentages[3] + percentages[4]),
        ).round()) {
      index++;
      continue;
    } else {
      if (counter == 5) {
        breaker++;
        counter++;
        index++;
        continue;
      }
    }

    var bene6 = sheetObject.cell(
      CellIndex.indexByString("F$index"),
    )
      ..value = model.collection[5].isNotEmpty ? model.collection[5] : null
      ..cellStyle = cellStyle;

    print(index);
  }

  excel.encode().then(
    (onValue) {
      File(
        join("C:/Users/CM/Downloads/EJEJE.xlsx"),
      )
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    },
  );
}
