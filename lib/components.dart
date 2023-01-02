import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SansText extends StatelessWidget {
  final text;
  final size;
  const SansText(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.openSans(
          fontSize: size, fontWeight: FontWeight.w300, color: Colors.white),
    );
  }
}

class TextBlack extends StatelessWidget {
  final text;
  final size;
  const TextBlack(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size, fontWeight: FontWeight.w300, color: Colors.black),
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final page;
  const NavButton(this.text, this.page, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}

DialogBox(BuildContext context, String title) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: EdgeInsets.all(32.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 2.0, color: Colors.black),
      ),
      title: TextBlack(title, 20.0),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Color(0XFF004aad),
          child: SansText("Ok", 20.0),
        ),
      ],
    ),
  );
}

class studentList extends StatefulWidget {
  final code;
  final fullname;
  final belt;
  final email;
  final phone;
  final address;
  final attendance;
  const studentList(
      {Key? key,
      this.code,
      this.fullname,
      this.email,
      this.address,
      this.belt,
      this.phone,
      this.attendance})
      : super(key: key);

  @override
  State<studentList> createState() => _studentListState();
}

class _studentListState extends State<studentList> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid, width: 1.0, color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: SansText(widget.fullname.toString(), 25.0),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(Icons.arrow_drop_down_circle_outlined),
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(height: 7.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: GoogleFonts.openSans(fontSize: 15.0),
                  widget.belt.toString(),
                ),
                Text(
                  style: GoogleFonts.openSans(fontSize: 15.0),
                  widget.phone.toString(),
                ),
                Text(
                  style: GoogleFonts.openSans(fontSize: 15.0),
                  widget.email.toString(),
                ),
                Text(
                  style: GoogleFonts.openSans(fontSize: 15.0),
                  widget.address.toString(),
                ),
                Text(
                  style: GoogleFonts.openSans(fontSize: 15.0),
                  widget.attendance.toString(),
                  maxLines: expand == true ? null : 3,
                  overflow: expand == true
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class attendanceRecord extends StatefulWidget {
  final code;
  final date;
  const attendanceRecord({
    Key? key,
    this.code,
    this.date,
  }) : super(key: key);

  @override
  State<attendanceRecord> createState() => _attendanceRecordState();
}

class _attendanceRecordState extends State<attendanceRecord> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(
                style: BorderStyle.solid, width: 1.0, color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: SansText(widget.code.toString(), 25.0),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expand = !expand;
                    });
                  },
                  icon: Icon(Icons.arrow_drop_down_circle_outlined),
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(height: 7.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  style: GoogleFonts.openSans(fontSize: 15.0),
                  widget.date.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
