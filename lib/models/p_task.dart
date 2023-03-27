// ignore_for_file: non_constant_identifier_names, camel_case_types

class Task_record {
  final String userid;
  final String task_nam;
  final DateTime? enddate;
  final DateTime? estidate;
  final String link;
  final String task_id;
  final String info;
  final int progress;
  final DateTime? startdate;
  bool activestate;

  Task_record(
      {this.userid = '',
      this.task_nam = '',
      this.enddate,
      this.estidate,
      this.link = '',
      this.task_id = '',
      this.info = '',
      this.progress = 0,
      this.startdate,
      this.activestate = true});

  factory Task_record.fromMap(map) {
    return Task_record(
      userid: map['userid'],
      task_nam: map['task_nam'],
      enddate: map['enddate'].toDate(),
      estidate: map['estidate'].toDate(),
      link: map['link'],
      task_id: map['task_id'],
      info: map['info'],
      progress: map['progress'],
      startdate: map['startdate'].toDate(),
      activestate: map['activestate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'task_nam': task_nam,
        'enddate': enddate,
        'estidate': estidate,
        'link': link,
        'task_id': task_id,
        'info': info,
        'progress': progress,
        'startdate': startdate,
        'activestate': activestate
      };

  factory Task_record.create(
      {userid,
      task_nam,
      enddate,
      estidate,
      link,
      task_id,
      info,
      progress,
      startdate,
      activestate}) {
    return Task_record(
        userid: userid,
        task_nam: task_nam,
        enddate: enddate,
        estidate: estidate,
        link: link,
        task_id: task_id,
        info: info,
        progress: progress,
        startdate: startdate,
        activestate: activestate);
  }

  set setstate(bool state) {
    activestate = state;
  }
}
