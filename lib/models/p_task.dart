// ignore_for_file: non_constant_identifier_names, camel_case_types

class Task_record {
  final String username;
  final int task_num;
  final int enddate;
  final int estidate;
  final String extra_info;
  final String task_id;
  final String info;
  final int progress;
  final int startdate;

  const Task_record(
      {this.username = '',
      this.task_num = 0,
      this.enddate = 0,
      this.estidate = 0,
      this.extra_info = '',
      this.task_id = '',
      this.info = '',
      this.progress = 0,
      this.startdate = 0});

  Task_record.fromJson(Map<String, dynamic> json)
      : this(
            username: json['username'],
            task_num: json['task_num'],
            enddate: json['enddate'],
            estidate: json['estidate'],
            extra_info: json['extra_info'],
            task_id: json['task_id'],
            info: json['info'],
            progress: json['progress'],
            startdate: json['startdate']);

  Map<String, dynamic> toJson() => {
        'username': username,
        'task_num': task_num,
        'enddate': enddate,
        'estidate': estidate,
        'extra_info': extra_info,
        'task_id': task_id,
        'info': info,
        'progress': progress,
        'startdate': startdate
      };

  copyWith(
          {username,
          task_num,
          enddate,
          estidate,
          extra_info,
          task_id,
          info,
          progress,
          startdate}) =>
      Task_record(
          username: username ?? this.username,
          task_num: task_num ?? this.task_num,
          enddate: enddate ?? this.enddate,
          estidate: estidate ?? this.estidate,
          extra_info: extra_info ?? this.extra_info,
          task_id: task_id ?? this.task_id,
          info: info ?? this.info,
          progress: progress ?? this.progress,
          startdate: startdate ?? this.startdate);
}
