import 'package:flutter/material.dart';
import 'package:smart_expense_tracker/models/expense.dart';
import 'package:smart_expense_tracker/repositories/expense_repository.dart';

class ExpenseProvider with ChangeNotifier {
  final ExpenseRepository _repository = ExpenseRepository();
  
  List<Expense> _expenses = [];
  List<Expense> _filteredExpenses = [];
  bool _isLoading = false;
  DateTime _selectedMonth = DateTime.now();
  
  List<Expense> get expenses => _expenses;
  List<Expense> get filteredExpenses => _filteredExpenses;
  bool get isLoading => _isLoading;
  DateTime get selectedMonth => _selectedMonth;
  
  Future<void> loadExpenses() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _expenses = await _repository.getAllExpenses();
      _filteredExpenses = List.from(_expenses);
    } catch (e) {
      print('Error loading expenses: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> addExpense(Expense expense) async {
    try {
      await _repository.addExpense(expense);
      await loadExpenses(); // Reload to get updated list
    } catch (e) {
      print('Error adding expense: $e');
      rethrow;
    }
  }
  
  Future<void> updateExpense(Expense expense) async {
    try {
      await _repository.updateExpense(expense);
      await loadExpenses();
    } catch (e) {
      print('Error updating expense: $e');
      rethrow;
    }
  }
  
  Future<void> deleteExpense(int id) async {
    try {
      await _repository.deleteExpense(id);
      await loadExpenses();
    } catch (e) {
      print('Error deleting expense: $e');
      rethrow;
    }
  }
  
  void filterByCategory(String category) {
    if (category.isEmpty) {
      _filteredExpenses = List.from(_expenses);
    } else {
      _filteredExpenses = _expenses
          .where((expense) => expense.category == category)
          .toList();
    }
    notifyListeners();
  }
  
  void searchExpenses(String query) {
    if (query.isEmpty) {
      _filteredExpenses = List.from(_expenses);
    } else {
      _filteredExpenses = _expenses
          .where((expense) =>
              expense.title.toLowerCase().contains(query.toLowerCase()) ||
              expense.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
  
  void setSelectedMonth(DateTime month) {
    _selectedMonth = month;
    notifyListeners();
  }
  
  double get totalAmount {
    return _expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }
  
  Map<String, double> get categoryTotals {
    final Map<String, double> totals = {};
    for (var expense in _expenses) {
      totals[expense.category] = (totals[expense.category] ?? 0) + expense.amount;
    }
    return totals;
  }
  
  List<String> get categories {
    return _expenses
        .map((e) => e.category)
        .toSet()
        .toList();
  }
}