class SendForm {
  final String name;
  final String phone;
  final String message;

  SendForm({required this.name, required this.phone, required this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['message'] = message;

    return data;
  }
}