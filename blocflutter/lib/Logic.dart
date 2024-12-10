import 'dart:async';
import 'dart:core';

class Logic {
  StreamController controller = StreamController();
  Sink get sink => controller.sink;
  Stream get stream => controller.stream;

  int count = 0;
  increate() {
    count ++;
    sink.add(count);
  }
}

main() {}
