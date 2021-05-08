import 'package:intl/intl.dart';  //for date format

class DataType {
  getPosts(String data) {
    List<String> list = data.split(new RegExp(r"-"));

    return "${list[2]}/${list[1]}/${list[0]}";
  }
}