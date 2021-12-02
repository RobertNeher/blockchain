import 'block.dart';
import 'blockchain.dart';

void main(List<String> args) {
  BlockChain bc = BlockChain();

  bc.add('First Block');
  bc.add('Second Block');
  bc.add('Third Block');
  bc.add('Fourth Block');
  bc.add('Fifth Block');
  bc.add('Sixth Block');
  bc.add('Seventh Block');
  bc.add('Eighth Block');
  bc.add('Nineth Block');
  bc.add('Tenth Block');
  print(bc.length());

  for (Block block in bc.getBlocks()) {
    print(block.toString());
    // print(
    //     '${block.data}\t${block.timeStamp}\t${block.hash}\t${block.previousHash}');
  }
}
