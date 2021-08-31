
class BoardStateModel {
final  bool isOpen ;
  int column = 0;
  int row = 0;

  BoardStateModel({required this.isOpen, required this.column, required this.row});

  BoardStateModel.fromJson(Map<String, dynamic> json)
      : isOpen = json['isOpen'],
        column = json['column'],
        row = json["row"];

  Map<String, dynamic> toJson() => {
    'isOpen': isOpen,
    'column': column,
    "row": row,
  };
}
