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
    calculateValidHash();
  }

  Block.withHash(String data, Digest hash) {
    this.data = utf8.encode(data);
    this.hash = sha256.convert(this.data);
    this.previousHash = hash;
    this.timeStamp = DateTime.now();
    calculateValidHash();
  }

  bool isHashValid(Digest hash) {
    return hash.toString().startsWith('0' * 3);
  }

  void calculateValidHash() {
    Digest hash = Digest([]);
    int nonce = 0;

    while (!isHashValid(hash)) {
      String temp = this.hash.toString() + nonce.toString();
      hash = sha256.convert(utf8.encode(temp));
      nonce++;
    }
    this.hash = hash;
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
