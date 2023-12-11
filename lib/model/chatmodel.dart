class Chatmodel {
  final String? name;
  final String? icon;
  final bool? isGroup;
  final String? currentMessage;
  final String? status;
  final String? time;
  bool isSelect = false;
  final int? id;

  Chatmodel(
      {this.name,
      this.icon,
      this.isGroup,
      this.currentMessage,
      this.time,
      this.status,
      this.isSelect = false,
      this.id});
}
