import 'block.dart';
import 'blockchain.dart';
import 'dart:math';
import 'dart:io';
import 'package:intl/intl.dart';

void main(List<String> args) {
  final intFormat = NumberFormat('00000');
  Map<String, dynamic> data;
  final Random secureRandom = Random.secure();
  BlockChain bc = BlockChain();

  for (int i = 0; i < 100; i++) {
    data = {
      'transaction': secureRandom.nextInt(100000),
      'amount': secureRandom.nextDouble().toString(),
      'desription': 'Beschreibung: $i'
    };
    stdout.write('${intFormat.format(i)}\r');
    bc.add(data.toString());
  }
  DateTime start = DateTime.now();
  for (Block block in bc.getBlocks()) {
    print(
        '${String.fromCharCodes(block.data)}\t${block.timeStamp}\t${block.hash}');
  }
}
