import 'nft_collection_generator.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'nft_model.dart';

void main(List<String> arguments) {
  String nft = "NFT";

  createCollections(nft);
}

void createCollections(nft) {
  var excel = Excel.createExcel();

  Sheet sheetObject = excel['Lista NFTs'];
  CellStyle cellStyle =
      CellStyle(fontFamily: getFontFamily(FontFamily.Calibri));

  for (int counter = 1; counter < 1001; counter++) {
    var generator = NftDataBase();
    var model = NFTModel(nft: nft, collection: generator.benefitCollection);
    print(model.collection);
    var title = sheetObject.cell(CellIndex.indexByString("A$counter"));
    title.value = model.nft;
    title.cellStyle = cellStyle;
    var bene1 = sheetObject.cell(CellIndex.indexByString("B$counter"));
    bene1.value = model.collection[0];
    bene1.cellStyle = cellStyle;
    var bene2 = sheetObject.cell(CellIndex.indexByString("C$counter"));
    bene2.value = model.collection[1];
    bene2.cellStyle = cellStyle;
    var bene3 = sheetObject.cell(CellIndex.indexByString("D$counter"));
    bene3.value = model.collection[2];
    bene3.cellStyle = cellStyle;
  }
  excel.encode().then((onValue) {
    File(join("C:/Users/CM/Downloads/AAAFT.xlsx"))
      ..createSync(recursive: true)
      ..writeAsBytesSync(onValue);
  });
}
