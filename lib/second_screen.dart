import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberNotifier extends ChangeNotifier {
  int number = 0;

  void increase() {
    number++;
    notifyListeners();
  }

  void decrease() {
    number--;
    notifyListeners();
  }
}

final numberNotifier = ChangeNotifierProvider<NumberNotifier>(
    (ref) => NumberNotifier()); //will retrun instance from number notifier

class SecondScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberChanage = ref.watch(numberNotifier);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numberChanage.number.toString(),
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      
                      numberChanage.increase();
                    },
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      numberChanage.decrease();
                    },
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
