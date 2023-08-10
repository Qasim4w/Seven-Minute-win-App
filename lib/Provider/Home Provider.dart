import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  bool isLock = true;
  int selectedIndex = 0;
  int startValue = 0;
  List<TimerTracksModel> progressList = [];
  List<Widget> indicators = [];
  bool isTimerRunning = true;
  int seconds = 0;
  Timer? timer;
  // int timerValue = 0;
  bool isPlaying = false;

  int _seconds = 1;

  int get secondss => _seconds;

  int _minutes = 0;

  int get minutes => _minutes;

  void updateMinutes(int newMinutes) {
    _minutes = newMinutes;
    notifyListeners();
  }

  // void updateMinutes() {
  //   int minutes = (timerProvider.seconds ~/ 60); // Calculate minutes based on timerValue
  //   if (minutes < 0) {
  //     minutes = 0;
  //   }
  //   timerProvider.updateMinutes(minutes);
  // }

  bool getTrophyStatus(int index) {
    return index <= selectedIndex; // Trophy is true for previous and current indices
  }

  double getCurrentProgress(int totalSeconds) {
    double currentProgress = seconds / totalSeconds;
    return currentProgress.clamp(0.0, 1.0); // Clamp the value between 0.0 and 1.0
  }
 Future <void> removeAllIndicators()async {
    progressList.clear(); // Remove all elements from the progressList
    startValue = 0; // Reset the startValue
    seconds = 0;

    getCurrentProgress(0);
    notifyListeners();

  }


  void updateProgress(int index, int progressTotalSeconds) {
    if (isPlaying && index == selectedIndex) {
      // If the index is the selected index
      if (seconds >= (progressTotalSeconds * (selectedIndex + 1))) {
        // If the required time (60 seconds * index) has passed, move to the next indicator
        if (selectedIndex == progressList.length - 1) {
          // Check if it's the last index
          isPlaying = false; // Set isPlaying to false after finishing all indexes
        } else {
          selectedIndex = (selectedIndex + 1) % progressList.length; // Move to the next index and wrap around if necessary
          setSeconds(0); // Reset the seconds value for the next indicator
        }
      }
    }

    double progressCurrentProgress = 0.0; // Default progress for previous indices
    bool trophy = index <= selectedIndex; // Trophy is true for previous and current indices

    if (index == selectedIndex) {
      // If the index is the selected index
      // Calculate the elapsed time within the current index
      int elapsedTime = seconds - (progressTotalSeconds * selectedIndex);

      // Calculate the progress for the current index
      progressCurrentProgress = elapsedTime / progressTotalSeconds;
      progressCurrentProgress = progressCurrentProgress.clamp(0.0, 1.0); // Clamp the value between 0.0 and 1.0
    } else {
      // Reset progress for indices other than the selected index
      progressCurrentProgress = 0.0;
    }

    // Return the calculated progress and trophy status or use them as desired
  }


  void setSeconds(int value) {
    _seconds = value;
    notifyListeners();
  }

  void addIndicatorAtIndex(int index) {
    progressList.insert(index, TimerTracksModel(start: startValue, minute: 1));

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    });
  }


  IconData getPlayPauseIcon() {
    return isPlaying ? Icons.pause : Icons.play_arrow;
  }

  void addIndicator() {
    if (progressList.length < 7) {
      int index = progressList.length;
      addIndicatorAtIndex(index);
      startValue += 60;
      notifyListeners();
    }
  }


  void removeIndicator() {
    if (progressList.isNotEmpty) {
      int lastIndex = progressList.length - 1;
      startValue -= 60;
      if (startValue < 0) {
        startValue = 0;
      }
      progressList.removeAt(lastIndex);
      notifyListeners();
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (isPlaying) {
        seconds++; // Increment the timerValue by 1 second
        notifyListeners(); // Notify the listeners about the state change
      } else {
        timer.cancel();
      }
    });
  }

  void resetTrophy() {
    selectedIndex = 0; // Reset the selectedIndex to 0
    notifyListeners();
  }

  // void togglePlayPause() {
  //   isPlaying = !isPlaying;
  //   if (isPlaying) {
  //     if (timer == null || !timer!.isActive) {
  //       startTimer();
  //     }
  //   } else {
  //     pauseTimer();
  //   }
  //   notifyListeners(); // Notify listeners after updating the isPlaying property
  // }

  void togglePlayPause() {
    isPlaying = !isPlaying;
    if (isPlaying) {
      if (timer == null || !timer!.isActive) {
        if (progressList.length > 0) {
          startTimer();
        } else {
          addIndicator(); // Add at least one indicator if the list is empty
          startTimer();
        }
      }
    } else {
      pauseTimer();
    }
    notifyListeners(); // Notify listeners after updating the isPlaying property
  }
  void pauseTimer() {
    timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
class TimerTracksModel {
  int start;
  int minute;
  bool trophy;
  TimerTracksModel({required this.start, required this.minute, this.trophy = false});
}
