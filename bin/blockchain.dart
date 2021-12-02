import 'block.dart';
import 'package:crypto/crypto.dart';

class BlockChain {
  List<Block> blocks = <Block>[];

  BlockChain() {
    blocks = <Block>[];
    blocks.add(createGenesisBlock());
  }

  Block createGenesisBlock() {
    List<int> generic = List<int>.filled(64, 0);
    Digest newData = Digest([]);

    newData.bytes.addAll(generic);

    Block genesisBlock = Block.withHash('Genesis\t', newData);
    return genesisBlock;
  }

  int length() {
    return blocks.length;
  }

  Digest getLastHash() {
    return blocks.last.hash;
  }

  void add(String data) {
    Block block = Block.withHash(data, getLastHash());
    blocks.add(block);
  }

  List<Block> getBlocks() {
    return blocks;
  }
}
