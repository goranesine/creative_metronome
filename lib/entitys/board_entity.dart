
class BoardStateE {
  bool isOpen = false;
  int column = 0;
  int row = 0;

  BoardStateE({required this.isOpen, required this.column, required this.row});

  BoardStateE.fromJson(Map<String, dynamic> json)
      : isOpen = json['isOpen'],
        column = json['column'],
        row = json["row"];

  Map<String, dynamic> toJson() => {
        'isOpen': isOpen,
        'column': column,
        "row": row,
      };
}
