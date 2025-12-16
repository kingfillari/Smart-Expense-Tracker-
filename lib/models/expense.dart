class Expense {
  int? id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final String? description;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.description,
  });

  // Convert Expense to Map for database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
      'description': description,
    };
  }

  // Convert Map to Expense from database
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
      category: map['category'],
      description: map['description'],
    );
  }

  // Copy with method for updates
  Expense copyWith({
    int? id,
    String? title,
    double? amount,
    DateTime? date,
    String? category,
    String? description,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}