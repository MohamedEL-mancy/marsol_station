class OrdersClass {
  int _id;
  String _title, _subTitle;

  OrdersClass(dynamic obj) {
    _id = obj['id'];
    _title = obj['title'];
    _subTitle = obj['subTitle'];
  }

  OrdersClass.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _title = data['title'];
    _subTitle = data['subTitle'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'subTitle': _subTitle,
      };

  int get id => _id;
  String get title => _title;
  String get subTitle => _subTitle;
}
