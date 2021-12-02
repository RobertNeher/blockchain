import 'package:crypto/crypto.dart';
import 'dart:convert';

class Block {
  List<int> data = <int>[];
  DateTime timeStamp = DateTime.now();
  Digest previousHash = Digest([]);
  Digest hash = Digest([]);

  Block(String data) {
    this.data = utf8.encode(data);
    this.hash = sha256.convert(this.data);
    this.timeStamp = DateTime.now();
  }

  Block.withHash(String data, Digest hash) {
    this.data = utf8.encode(data);
    this.hash = sha256.convert(this.data);
    this.previousHash = hash;
    this.timeStamp = DateTime.now();
  }

  bool isHashValid(Digest hash) {
    return ((hash.bytes[0] == '2'.codeUnitAt(0)) &&
        (hash.bytes[1] == '1'.codeUnitAt(0)) &&
        (hash.bytes[2] == '0'.codeUnitAt(0)) &&
        (hash.bytes[3] == '4'.codeUnitAt(0)));
  }

  void calculateValidHash() {
    Digest hash = Digest([]);
    int nonce = 0;

    while (!isHashValid(hash)) {
      Digest temp = hash;

      for (int i = 0; i < nonce.toString().length; i++) {
        temp.bytes.add(nonce.toString().codeUnitAt(0));
        nonce++;
      }
      print(hash);
      hash = temp;
    }
  }

  void fromString(String input) {
    for (int i = 0; i < input.length; i++) {
      data.add(input[i].codeUnitAt(i));
    }
  }

  @override
  String toString() {
    return '$data\t$timeStamp\t$hash';
  }
}
