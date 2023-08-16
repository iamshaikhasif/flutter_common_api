
import 'package:flutter/material.dart';

class CommonUtils {
  CommonUtils._();
  static final instance = CommonUtils._();

void debugLog(tag, msg){
  debugPrint("$tag ---> $msg");
}

}