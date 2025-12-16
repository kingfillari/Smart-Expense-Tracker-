import 'dart:async';
import 'package:smart_expense_tracker/models/expense.dart';
import 'package:smart_expense_tracker/services/database_helper.dart';

class ExpenseRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Expense>> getAllExpenses() async {
    return await _databaseHelper.getAllExpenses();
  }

  Future<List<Expense>> getExpensesByMonth(DateTime month) async {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    return await _databaseHelper.getExpensesByDateRange(firstDay, lastDay);
  }

  Future<List<Expense>> getRecentExpenses(int limit) async {
    final allExpenses = await _databaseHelper.getAllExpenses();
    return allExpenses.take(limit).toList();
  }

  Future<Map<String, double>> getCategoryTotals() async {
    final expenses = await _databaseHelper.getAllExpenses();
    final Map<String, double> totals = {};
    
    for (var expense in expenses) {
      totals[expense.category] = (totals[expense.category] ?? 0) + expense.amount;
    }
    
    return totals;
  }

  // FIXED METHOD: Properly handles the future and folding
  Future<double> getMonthlyTotal(DateTime month) async {
    final List<Expense> expenses = await getExpensesByMonth(month);
    double total = 0.0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    return total;
  }

  Future<int> addExpense(Expense expense) async {
    return await _databaseHelper.insertExpense(expense);
  }

  Future<int> updateExpense(Expense expense) async {
    return await _databaseHelper.updateExpense(expense);
  }

  Future<int> deleteExpense(int id) async {
    return await _databaseHelper.deleteExpense(id);
  }

  Future<List<Expense>> searchExpenses(String query) async {
    final expenses = await _databaseHelper.getAllExpenses();
    return expenses.where((expense) {
      return expense.title.toLowerCase().contains(query.toLowerCase()) ||
             expense.category.toLowerCase().contains(query.toLowerCase()) ||
             (expense.description?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();
  }
}