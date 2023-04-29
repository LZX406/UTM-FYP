import 'package:cloud_firestore/cloud_firestore.dart';

DateTime estimate(DateTime initial, DateTime end, num progress) {
  if (progress != 0) {
    Timestamp current = Timestamp.fromDate(DateTime.now());
    Timestamp start = Timestamp.fromDate(initial);
    Timestamp e = Timestamp.fromDate(end);
    num currentvalue = num.parse(current.seconds.toString()) -
        num.parse(start.seconds.toString());
    int estivalue = ((currentvalue / progress) * 100).toInt();
    num esti = num.parse(start.seconds.toString()) + estivalue;
    Timestamp ending =
        Timestamp.fromMillisecondsSinceEpoch(esti.toInt() * 1000);
    int estimatedate = pert(ending, e);
    // print(progress);
    // print("start: " + start.seconds.toString());
    // print("end: " + e.seconds.toString());
    // print("esti: " + esti.toString());
    // print(initial);
    // print(DateTime.fromMillisecondsSinceEpoch(esti.toInt() * 1000));
    // print(DateTime.fromMillisecondsSinceEpoch(estimatedate * 1000));
    return DateTime.fromMillisecondsSinceEpoch(estimatedate * 1000);
  } else {
    return end;
  }
}

int pert(Timestamp value, Timestamp value2) {
  int o;
  int p;
  //print(value2.toString());
  int m = num.parse(value2.seconds.toString()).toInt();
  if (value.toDate().isAfter(value2.toDate())) {
    p = num.parse(value.seconds.toString()).toInt();
    o = num.parse(value2.seconds.toString()).toInt();
  } else {
    o = num.parse(value.seconds.toString()).toInt();
    p = num.parse(value2.seconds.toString()).toInt();
  }
  // print(value.toDate().isAfter(value2.toDate()));
  // print(o);
  // print(p);
  // print(m);
  int esti = (o + 4 * m + p) ~/ 6;
  return esti;
}
