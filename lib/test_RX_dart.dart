import 'dart:async';

import 'package:code_base/src/core/helpers/base_widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartTest{
  final BehaviorSubject<int> publishSubject = BehaviorSubject<int>();

  Stream<String> get publishSubjectStreamWithTransformer => publishSubject.stream.transform<String>(transformer);

  Future<void> startStreaming()async{
    Stream ss;
    print('start');
    for(int i = 0; i < 20; i++){
      await Future.delayed(const Duration(seconds: 2));
      publishSubjectStreamWithTransformer;
      print(i);
    }
  }

  Future<void> startStream()async{
    Stream ss;
    print('start');
    for(int i = 0; i < 20; i++){
      publishSubject.add(i);
      print(i);
    }
  }

  // yield
  StreamTransformer<int,String> transformer = StreamTransformer<int,String>.fromHandlers(
    handleData: (data, sink) {
      data * 2;
    },
  );


  final behaviorSubject = BehaviorSubject<String>();

  void testBehaviorSubject(){
    behaviorSubject.listen((value) {

    });
    behaviorSubject.stream.listen((event) {

    });
  }
}

class RxUiTest extends StatefulWidget {
  const RxUiTest({super.key});

  @override
  State<RxUiTest> createState() => _RxUiTestState();
}

class _RxUiTestState extends State<RxUiTest> {
  final RxDartTest rxDartTest = RxDartTest();

  @override
  void initState() {
    rxDartTest.startStream();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rx Dart Test'),
      ),
      body: StreamBuilder<int>(
          stream: rxDartTest.publishSubject.stream.debounceTime(const Duration(seconds: 2)),
          builder: (context, snapshot) => Center(
            child: AppText(text: snapshot.data.toString()),
          ),
      )
    );
  }
}
