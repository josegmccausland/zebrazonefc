import 'package:html/parser.dart' as parser;

String removeTags(docc) {
  var findata = parser.parse(docc);
  return parser.parse(findata.body.text).documentElement.text;
}