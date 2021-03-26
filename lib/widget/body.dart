import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../widget/foem.dart';

class FormController {
  static const String URL = "https://script.google.com/macros/s/AKfycbzpc3Ih04kkaBWUa70gJjy9o7TZXtWqA8CllsRlD0kqzp1FD2t2A8XEJkjvrWsYmqbH2Q/exec";
  static const STATUS_SUCCESS = "SUCCESS";
  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      await http.post(URL, body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}