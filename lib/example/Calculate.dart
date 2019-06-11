import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  Calculate({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalculatePage();
  }
}

enum CalType { Divide, Multiply, Minus, Plus, None }

class CalculatePage extends State<Calculate> {
  String result = "0";
  String cal = "0";
  bool flagDel = false;
  bool flagClear = false;
  bool flagDivide = false;
  bool flagMultiply = false;
  bool flagMinus = false;
  bool flagPlus = false;
  CalType type = CalType.None;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return viewSet(context);
  }

  Container viewSet(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          textCalView(),
          buttonRowView1(),
          buttonRowView2(),
          buttonRowView3(),
          buttonRowView4(),
          buttonRowView5(),
        ],
      ),
    );
  }

  void onClickNumber(String num, bool flag) {
    setState(() {
      if (flag) {
        result = "0";
        cal = "0";
        flagDel = false;
        flagClear = false;
      } else if (num != ".") {
        if (double.parse(result) > 0.0 && !flagClear) {
          result = result + num;
        } else if (!result.contains(".") && !flagClear) {
          result = num;
          flagClear = false;
        } else if (result.contains(".") && flagClear) {
          result = num;
        } else {
          result = result + num;
        }
      } else if (num == "." && !result.contains(".")) {
        if (double.parse(result) > 0.0 && !flagClear) {
          result = result + num;
        } else {
          result = '0' + num;
          flagClear = false;
        }
      }

      flagClear = false;
      flagDivide = false;
      flagMultiply = false;
      flagMinus = false;
      flagPlus = false;
    });
  }

  void calNum() {
    if (type == CalType.Plus) {
      cal = (double.parse(cal) + double.parse(result)).toString();
      result = cal;
    } else if (type == CalType.Minus) {
      cal = (double.parse(cal) - double.parse(result)).toString();
      result = cal;
    } else if (type == CalType.Multiply) {
      cal = (double.parse(cal) * double.parse(result)).toString();
      result = cal;
    } else if (type == CalType.Divide) {
      cal = (double.parse(cal) / double.parse(result)).toString();
      result = cal;
    }
  }

  Container textCalView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black54,
      height: 150,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: new Align(
          alignment: Alignment.bottomRight,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: new Text(
              result,
              style: new TextStyle(
                fontSize: 60.0,
                color: Colors.white,
              ),
            ),
          )),
    );
  }

  Expanded buttonRowView1() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("0", true);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.green),
                ),
                Text(
                  "AC",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {},
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.green),
                ),
                Text(
                  "+/-",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {},
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.green),
                ),
                Text(
                  "%",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                if (flagDivide) {
                  flagDivide = false;
                  flagClear = false;
                } else {
                  flagClear = true;
                  flagDivide = true;
                  flagMultiply = false;
                  flagMinus = false;
                  flagPlus = false;
                }
              });
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadiusCal(
                      Colors.blue, Colors.lightBlueAccent, flagDivide),
                ),
                Text(
                  "/",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  Expanded buttonRowView2() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("1", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "1",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("2", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "2",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("3", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "3",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                if (flagMultiply) {
                  flagMultiply = false;
                  flagClear = false;
                } else {
                  flagClear = true;
                  flagMultiply = true;
                  flagDivide = false;
                  flagMinus = false;
                  flagPlus = false;
                }
              });
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadiusCal(
                      Colors.blue, Colors.lightBlueAccent, flagMultiply),
                ),
                Text(
                  "*",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  Expanded buttonRowView3() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("4", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "4",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("5", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "5",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("6", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "6",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                if (flagMinus) {
                  flagMinus = false;
                  flagClear = false;
                } else {
                  flagClear = true;
                  flagMinus = true;
                  flagDivide = false;
                  flagMultiply = false;
                  flagPlus = false;
                  calNum();
                  type = CalType.Minus;
                }
              });
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadiusCal(
                      Colors.blue, Colors.lightBlueAccent, flagMinus),
                ),
                Text(
                  "-",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  Expanded buttonRowView4() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("7", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "7",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("8", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "8",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              onClickNumber("9", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "9",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                if (flagPlus) {
                  flagPlus = false;
                  flagClear = false;
                } else {
                  flagClear = true;
                  flagPlus = true;
                  flagDivide = false;
                  flagMultiply = false;
                  flagMinus = false;
                  calNum();
                  type = CalType.Plus;
                }
              });
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadiusCal(
                      Colors.blue, Colors.lightBlueAccent, flagPlus),
                ),
                Text(
                  "+",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  Expanded buttonRowView5() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onClickNumber("0", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  width: 80,
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  "0",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onClickNumber(".", false);
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  width: 80,
                  height: double.maxFinite,
                  margin: EdgeInsets.all(5),
                  decoration: setBorderRadius(Colors.lightBlue),
                ),
                Text(
                  ".",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                flagClear = false;
                flagPlus = false;
                flagDivide = false;
                flagMultiply = false;
                flagMinus = false;
                calNum();
              });
            },
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: setBorderRadius(Colors.pink),
                ),
                Text(
                  "=",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  BoxDecoration setBorderRadius(MaterialColor color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.0),
    );
  }

  BoxDecoration setBorderRadiusCal(
      MaterialColor color, MaterialAccentColor colorFocus, bool flag) {
    return BoxDecoration(
      color: (flag) ? colorFocus : color,
      borderRadius: BorderRadius.circular(20.0),
    );
  }
}
