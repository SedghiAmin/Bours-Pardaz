class Funcs {
  String seprateThousand(int val) {
    int divide = val;
    String result = "";
    List sep = [];
    if (val >= 1000) {
      while (divide >= 1000) {
        sep.add(divide % 1000);
        divide = divide ~/ 1000;
      }
      sep.add(divide);
      for (var i = sep.length - 1; i > 0; i--) {
        result = result + sep[i].toString() + ',';
      }
      return result + sep[0].toString();
    } else
      return val.toString();
  }
}
