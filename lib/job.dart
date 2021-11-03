class Job {
  String name;
  String task;

  Job(this.name, this.task);

  Job.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        task = json['task'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'task': task,
      };
}
