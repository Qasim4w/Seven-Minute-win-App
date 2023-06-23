import 'dart:async';

import 'package:flutter/foundation.dart';

class home_provider extends ChangeNotifier {



  var selectedIndex = 0;
  bool isPlaying = false;

  void togglePlayPause() {
    if (progressList.isNotEmpty) {
      isPlaying = !isPlaying;
      timer1!.isActive ? stop() : startTimer();
      print('play / stop working');
    }
    notifyListeners();
  }

  List<int> progressList = [];
  int progress = 0;

  void addTrack(int value) {
    if (progressList.length < 7) {
      progressList.add(value);
      print('Track added');
    } else {}
    notifyListeners();
  }

  void removeTrack(int value) {
    if (progressList.length > 1) {
      progressList.remove(value);
      print('Track removed');
    } else {
      print("only one track left can't removeTrack that one");
    }
    notifyListeners();
  }

  Timer? timer1 = Timer(const Duration(seconds: 0), () {});
  Timer? timer2 = Timer(const Duration(seconds: 0), () {});
  Timer? timer3 = Timer(const Duration(seconds: 0), () {});
  Timer? timer4 = Timer(const Duration(seconds: 0), () {});
  Timer? timer5 = Timer(const Duration(seconds: 0), () {});
  Timer? timer6 = Timer(const Duration(seconds: 0), () {});
  Timer? timer7 = Timer(const Duration(seconds: 0), () {});
  int start1 = 0;
  int start2 = 0;
  int start3 = 0;
  int start4 = 0;
  int start5 = 0;
  int start6 = 0;
  int start7 = 0;

  List<dynamic> percentValue = [];

  @override
  void initState() {
    // startTimer();
  }

  void stop() {
    if (timer1 != null) {

      timer1!.cancel();
      timer2!.cancel();
      timer3!.cancel();
      timer4!.cancel();
      timer5!.cancel();
      timer6!.cancel();
      timer7!.cancel();

      notifyListeners();
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    print("this is timer value before  ${start1.toString()}");
    timer1 = Timer.periodic(oneSec, (Timer timer) {
      if (start1 < 420) {
        print("this is start 1 = ${start1.toString()}");
        percentValue.add(start1);
        start1++;
        selectedIndex = 1;
        SevenMinutesIncrement1();
        // TimerValues();

        notifyListeners();
      }
      else if (start2 < 420) {
        print("this is  start 3 = ${start2.toString()}");
        percentValue.add(start2);
        start2++;
        selectedIndex = 3;
        SevenMinutesIncrement3();
        // TimerValues();

        notifyListeners();
      } else if (start3 < 420) {
        print("this is timer value ${start3.toString()}");
        percentValue.add(start3);
        start3++;
        selectedIndex = 4;
        SevenMinutesIncrement4();
        // TimerValues();

        notifyListeners();
      } else if (start4 < 420) {
        print("this is timer value ${start4.toString()}");
        percentValue.add(start4);
        start4++;
        selectedIndex = 5;
        SevenMinutesIncrement5();
        // TimerValues();

        notifyListeners();
      } else if (start5 < 420) {
        print("this is timer value ${start5.toString()}");
        percentValue.add(start5);
        start5++;
        selectedIndex = 6;
        SevenMinutesIncrement6();
        // TimerValues();

        notifyListeners();
      } else {
        if (start6 >= 420) {
          percentValue.add(start6);
          start6++;
          selectedIndex = 7;
          SevenMinutesIncrement7();
          // TimerValues();
          print("timer 1 cancel ");


          notifyListeners();
        } else {
          if (start7 >= 420) {
            percentValue.add(start7);
            SevenMinutesIncrement7();
            // TimerValues();
            print("timer 6 cancel ");
            timer.cancel();

            notifyListeners();
          } else {
            print("this is timer 7 value ${start7.toString()}");
            percentValue.add(start7);
            start7++;

            notifyListeners();
          }
        }
      }
      ;
    });
  }

  var timerValue1;
  var timerValue2;
  var timerValue3;
  var timerValue4;
  var timerValue5;
  var timerValue6;
  var timerValue7;

  void TimerValues() {
    timerValue1 = start1 / 420;
    timerValue2 = start2 / 420;
    timerValue3 = start3 / 420;
    timerValue4 = start4 / 420;
    timerValue5 = start5 / 420;
    timerValue6 = start6 / 420;
    timerValue7 = start7 / 420;

    notifyListeners();
  }


  /// minutes increment function = 1
  var minute1 = 0;

  void SevenMinutesIncrement1() {
    if (start1 < 60) {
      minute1 = 0;
    } else if (start1 >= 60 && start1 < 120) {
      minute1 = 1;
    } else if (start1 >= 120 && start1 < 180) {
      minute1 = 2;
    } else if (start1 >= 180 && start1 < 240) {
      minute1 = 3;
    } else if (start1 >= 240 && start1 < 300) {
      minute1 = 4;
    } else if (start1 >= 300 && start1 < 360) {
      minute1 = 5;
    } else if (start1 >= 360 && start1 < 420) {
      minute1 = 6;
    } else if (start1 == 420) {
      minute1 = 7;
    }
    notifyListeners();
  }

  /// minutes increment function = 2
  var minute2 = 0;

  void SevenMinutesIncrement2() {
    if (start2 < 60) {
      minute2 = 0;
    } else if (start2 >= 60 && start2 < 120) {
      minute2 = 1;
    } else if (start2 >= 120 && start2 < 180) {
      minute2 = 2;
    } else if (start2 >= 180 && start2 < 240) {
      minute2 = 3;
    } else if (start2 >= 240 && start2 < 300) {
      minute2 = 4;
    } else if (start2 >= 300 && start2 < 360) {
      minute2 = 5;
    } else if (start2 >= 360 && start2 < 420) {
      minute2 = 6;
    } else if (start2 == 420) {
      minute2 = 7;
    }
    notifyListeners();
  }

  /// minutes increment function = 3
  var minute3 = 0;

  void SevenMinutesIncrement3() {
    if (start2 < 60) {
      minute3 = 0;
    } else if (start2 >= 60 && start2 < 120) {
      minute3 = 1;
    } else if (start2 >= 120 && start2 < 180) {
      minute3 = 2;
    } else if (start2 >= 180 && start2 < 240) {
      minute3 = 3;
    } else if (start2 >= 240 && start2 < 300) {
      minute3 = 4;
    } else if (start2 >= 300 && start2 < 360) {
      minute3 = 5;
    } else if (start2 >= 360 && start2 < 420) {
      minute3 = 6;
    } else if (start2 == 420) {
      minute3 = 7;
    }
    notifyListeners();
  }

  /// minutes increment function = 4
  var minute4 = 0;

  void SevenMinutesIncrement4() {
    if (start3 < 60) {
      minute4 = 0;
    } else if (start3 >= 60 && start3 < 120) {
      minute4 = 1;
    } else if (start3 >= 120 && start3 < 180) {
      minute4 = 2;
    } else if (start3 >= 180 && start3 < 240) {
      minute4 = 3;
    } else if (start3 >= 240 && start3 < 300) {
      minute4 = 4;
    } else if (start3 >= 300 && start3 < 360) {
      minute4 = 5;
    } else if (start3 >= 360 && start3 < 420) {
      minute4 = 6;
    } else if (start3 == 420) {
      minute4 = 7;
    }
    notifyListeners();
  }

  /// minutes increment function = 5
  var minute5 = 0;

  void SevenMinutesIncrement5() {
    if (start4 < 60) {
      minute5 = 0;
    } else if (start4 >= 60 && start4 < 120) {
      minute5 = 1;
    } else if (start4 >= 120 && start4 < 180) {
      minute5 = 2;
    } else if (start4 >= 180 && start4 < 240) {
      minute5 = 3;
    } else if (start4 >= 240 && start4 < 300) {
      minute5 = 4;
    } else if (start4 >= 300 && start4 < 360) {
      minute5 = 5;
    } else if (start4 >= 360 && start4 < 420) {
      minute5 = 6;
    } else if (start4 == 420) {
      minute5 = 7;
    }
    notifyListeners();
  }

  /// minutes increment function = 6
  var minute6 = 0;

  void SevenMinutesIncrement6() {
    if (start5 < 60) {
      minute6 = 0;
    } else if (start5 >= 60 && start5 < 120) {
      minute6 = 1;
    } else if (start5 >= 120 && start5 < 180) {
      minute6 = 2;
    } else if (start5 >= 180 && start5 < 240) {
      minute6 = 3;
    } else if (start5 >= 240 && start5 < 300) {
      minute6 = 4;
    } else if (start5 >= 300 && start5 < 360) {
      minute6 = 5;
    } else if (start5 >= 360 && start5 < 420) {
      minute6 = 6;
    } else if (start5 == 420) {
      minute6 = 7;
    }
    notifyListeners();
  }

  /// minutes increment function = 7
  var minute7 = 0;

  void SevenMinutesIncrement7() {
    if (start6 < 60) {
      minute7 = 0;
    } else if (start6 >= 60 && start6 < 120) {
      minute7 = 1;
    } else if (start6 >= 120 && start6 < 180) {
      minute7 = 2;
    } else if (start6 >= 180 && start6 < 240) {
      minute7 = 3;
    } else if (start6 >= 240 && start6 < 300) {
      minute7 = 4;
    } else if (start6 >= 300 && start6 < 360) {
      minute7 = 5;
    } else if (start6 >= 360 && start6 < 420) {
      minute7 = 6;
    } else if (start6 == 420) {
      minute7 = 7;
    }
    notifyListeners();
  }
}
