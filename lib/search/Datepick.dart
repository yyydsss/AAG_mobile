import 'package:flutter/material.dart';

class DatePickerDemo extends StatefulWidget {
  final callback;

  const DatePickerDemo({Key? key, this.callback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DatePickerDemo();
}

class _DatePickerDemo extends State<DatePickerDemo> {
  _showDataPicker() async {
    Locale myLocale = Localizations.localeOf(context);
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2024),
        locale: myLocale);
    setState(() {
      _time = picker!.month.toString() + '月' + picker.day.toString() + '日';
      widget.callback(_time);
    });
  }

  var _time;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        MaterialButton(
          color: Colors.green,
          height: 50.0,
          elevation: 10,
          minWidth: 140.0,
          child: Text(
            _time == null ? '选择日期' : _time,
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          onPressed: () {
            _showDataPicker();
          },
        ),
      ],
    );
  }
}

class Searchtitle extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 175.0,
        width: 300.0,
        child: Container(
          decoration: ShapeDecoration(
            color: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 162.0,
              width: 280.0,
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.green[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                alignment: Alignment(0, 0),
                child: Text(
                  '蒙多自驾行',
                  style: new TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Title2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 175.0,
        width: 300.0,
        child: Container(
          decoration: ShapeDecoration(
            color: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 162.0,
              width: 280.0,
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.blue[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                alignment: Alignment(0, 0),
                child: Text(
                  '蒙多自驾行',
                  style: new TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
