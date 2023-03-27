// ignore_for_file: camel_case_types, non_constant_identifier_names

class Group_Task_record {
  final String userid;
  final String task_nam;
  final DateTime? enddate;
  final DateTime? estidate;
  final String link;
  final String task_id;
  final String info;
  final int progress;
  final DateTime? startdate;
  final String group_id;
  bool activestate;

  Group_Task_record(
      {this.userid = '',
      this.task_nam = '',
      this.enddate,
      this.estidate,
      this.link = '',
      this.group_id = '',
      this.task_id = '',
      this.info = '',
      this.progress = 0,
      this.startdate,
      this.activestate = true});

  factory Group_Task_record.fromMap(map) {
    return Group_Task_record(
        userid: map['userid'],
        task_nam: map['task_nam'],
        enddate: map['enddate'].toDate(),
        estidate: map['estidate'].toDate(),
        link: map['link'],
        task_id: map['task_id'],
        info: map['info'],
        group_id: map['group_id'],
        progress: map['progress'],
        startdate: map['startdate'].toDate(),
        activestate: map['activestate']);
  }

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'task_nam': task_nam,
        'enddate': enddate,
        'estidate': estidate,
        'link': link,
        'task_id': task_id,
        'info': info,
        'group_id': group_id,
        'progress': progress,
        'startdate': startdate,
        'activestate': activestate
      };

  factory Group_Task_record.create(
      {userid,
      task_nam,
      enddate,
      estidate,
      link,
      task_id,
      info,
      progress,
      group_id,
      startdate,
      activestate}) {
    return Group_Task_record(
        userid: userid,
        task_nam: task_nam,
        enddate: enddate,
        estidate: estidate,
        link: link,
        task_id: task_id,
        info: info,
        group_id: group_id,
        progress: progress,
        startdate: startdate,
        activestate: activestate);
  }

  set setstate(bool state) {
    activestate = state;
  }
}
