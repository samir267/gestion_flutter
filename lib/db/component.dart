final String componenttable = 'Component';


class ComponentField {
  static final List<String> values = [id, componentName,quantity,date];
  static final String id = '_id';
  static final String componentName = 'componentName';
  static final String quantity = 'quantity';
  static final String date = 'date';
  static final String cat = 'cat';



}

class Component {
  final int? id;
  final String componentName;
  final String quantity;
  final String date;
  final String cat;

  Component({
    this.id,
    required this.componentName,
    required this.quantity,
    required this.date,
    required this.cat

  });
  static Component fromJson(Map<String, Object?> json) => Component(
    id: json[ComponentField.id] as int?,
    componentName: json[ComponentField.componentName] as String,
    quantity: json[ComponentField.quantity] as String,
    date: json[ComponentField.date] as String,
    cat: json[ComponentField.cat] as String,



  );

  Map<String, Object?> toJson() => {
    ComponentField.id: id,
    ComponentField.componentName: componentName,
    ComponentField.quantity: quantity,
    ComponentField.date: date,
    ComponentField.cat: cat,



  };
  Component copycomponent({int? id}) => Component(
    id: id ?? this.id,
    componentName: componentName ?? this.componentName,
    quantity: quantity ?? this.quantity,
    date: date ?? this.date,
    cat:cat ??this.cat


  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'componentname': componentName,
      'quantity':quantity,
      'date':date,
      'cat':cat


    };
  }






}
