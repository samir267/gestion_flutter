final String familytable = 'Family';


class FamilyField {
  static final List<String> values = [id, familyName];
  static final String id = '_id';
  static final String familyName = 'familyName';


}

class Family {
  final int? id;
  final String familyName;


  const Family({
    this.id,
    required this.familyName,

  });
  static Family fromJson(Map<String, Object?> json) => Family(
    id: json[FamilyField.id] as int?,
    familyName: json[FamilyField.familyName] as String,

  );

  Map<String, Object?> toJson() => {
    FamilyField.id: id,
    FamilyField.familyName: familyName,

  };
  Family copy({int? id}) => Family(
    id: id ?? this.id,
    familyName: familyName ?? this.familyName,

  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'familyname': familyName,

    };
  }


}
