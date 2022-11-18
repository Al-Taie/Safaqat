// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';

class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug && kDebugMode) {
      print('DEBUGGING: $data \n');

      if (stackTrace != null) {
        
        print('DEBUGGING: StackTrace:\n$stackTrace\n');
      }
    }
  }
}

enum LogMode { debug, live }
