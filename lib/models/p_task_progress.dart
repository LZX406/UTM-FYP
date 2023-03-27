// ignore_for_file: non_constant_identifier_names, camel_case_types

class P_task_progress {
  final String account_id;
  final String task_id;
  final bool task_involved;
  final int progress;

  const P_task_progress(
      {this.account_id = '',
      this.task_id = '',
      this.task_involved = false,
      this.progress = 0});

  factory P_task_progress.fromMap(map) {
    return P_task_progress(
        account_id: map['account_id'],
        task_id: map['task_id'],
        task_involved: map['task_involved'],
        progress: map['progress']);
  }

  Map<String, dynamic> toJson() => {
        'account_id': account_id,
        'task_id': task_id,
        'task_involved': task_involved,
        'progress': progress
      };

  copyWith({account_id, task_id, task_involved, progress}) => P_task_progress(
      account_id: account_id ?? this.account_id,
      task_id: task_id ?? this.task_id,
      task_involved: task_involved ?? this.task_involved,
      progress: progress ?? this.progress);
}
