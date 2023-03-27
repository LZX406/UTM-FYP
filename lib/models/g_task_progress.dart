// ignore_for_file: non_constant_identifier_names, camel_case_types

class Group_task_progress {
  final String group_id;
  final String user_id;
  final String group_task_id;
  final String group_task_progress_id;
  final bool task_involved;
  final int progress;

  const Group_task_progress(
      {this.group_id = '',
      this.user_id = '',
      this.group_task_progress_id = '',
      this.group_task_id = '',
      this.task_involved = false,
      this.progress = 0});

  factory Group_task_progress.fromMap(map) {
    return Group_task_progress(
        group_id: map['group_id'],
        user_id: map['user_id'],
        group_task_id: map['group_task_id'],
        task_involved: map['task_involved'],
        group_task_progress_id: map['group_task_progress_id'],
        progress: map['progress']);
  }

  Map<String, dynamic> toJson() => {
        'group_id': group_id,
        'user_id': user_id,
        'group_task_id': group_task_id,
        'group_task_progress_id': group_task_progress_id,
        'task_involved': task_involved,
        'progress': progress
      };

  copyWith({group_id, user_id, group_task_id, task_involved, progress}) =>
      Group_task_progress(
          group_id: group_id ?? this.group_id,
          user_id: user_id ?? this.user_id,
          group_task_id: group_task_id ?? this.group_task_id,
          task_involved: task_involved ?? this.task_involved,
          progress: progress ?? this.progress);
}
