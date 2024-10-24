class DataModel {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  DataModel({
    this.id,
    this.body,
    this.title,
    this.userId,
  });

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return new DataModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'userId': this.userId,
      'title': this.title,
      'body': this.body,
    } as Map<String, dynamic>;
  }
}
