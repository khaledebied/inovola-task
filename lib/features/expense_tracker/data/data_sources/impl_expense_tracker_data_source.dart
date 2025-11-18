import 'package:dartz/dartz.dart';
import 'package:expense_tracker/features/expense_tracker/data/model/currency_rate_model/currency_rate_model.dart';
import 'package:expense_tracker/features/expense_tracker/data/model/expense_model/expense_model.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/expense_filter_entity/expense_filter_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entity/pagination_entity/pagination_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/http/generic_http/generic_http.dart';
import '../../../../core/http/models/http_request_model.dart';
import '../../../../core/http/generic_http/api_names.dart';

abstract class ExpenseRemoteDataSource {
  Future<Either<Failure, PaginationEntity<ExpenseModel>>> getExpenses(
      ExpenseFilterEntity filter,
      );
  Future<Either<Failure, ExpenseModel>> addExpense(ExpenseEntity expense);
  Future<Either<Failure, CurrencyRateModel>> getCurrencyRate(
      String from,
      String to,
      );
  Future<Either<Failure, bool>> syncExpenses(List<ExpenseEntity> expenses);
}

@Injectable(as: ExpenseRemoteDataSource)
class ImplExpenseRemoteDataSource extends ExpenseRemoteDataSource {
  @override
  Future<Either<Failure, PaginationEntity<ExpenseModel>>> getExpenses(
      ExpenseFilterEntity filter,
      ) async {
    final queryParams = _buildExpenseQuery(filter);

    HttpRequestModel model = HttpRequestModel(
      url: "${ApiNames.baseUrl}/expenses?$queryParams",
      requestMethod: RequestMethod.get,
      responseType: ResType.model,
      errorFunc: (error) => error["message"],
      responseKey: (json) => json["data"],
      toJsonFunc: (json) => PaginationEntity<ExpenseModel>.fromJson(
        json,
            // (item) => ExpenseModel.fromJson(item as Map<String, dynamic>),
      ),
      refresh: true,
    );

    return await GenericHttpImpl<PaginationEntity<ExpenseModel>>()(model);
  }

  @override
  Future<Either<Failure, ExpenseModel>> addExpense(ExpenseEntity expense) async {
    HttpRequestModel model = HttpRequestModel(
      url: "${ApiNames.baseUrl}/expenses",
      requestMethod: RequestMethod.post,
      responseType: ResType.model,
      requestBody: _expenseToJson(expense),
      isMultipart: expense.receiptPath != null,
      showLoader: true,
      errorFunc: (error) => error["message"],
      responseKey: (json) => json["data"],
      toJsonFunc: (json) => ExpenseModel.fromJson(json),
    );

    return await GenericHttpImpl<ExpenseModel>()(model);
  }

  @override
  Future<Either<Failure, CurrencyRateModel>> getCurrencyRate(
      String from,
      String to,
      ) async {
    // Using free exchange rate API
    HttpRequestModel model = HttpRequestModel(
      url: "https://open.er-api.com/v6/latest/$from",
      requestMethod: RequestMethod.get,
      responseType: ResType.model,
      errorFunc: (error) => error["error"],
      responseKey: (json) => json,
      toJsonFunc: (json) => CurrencyRateModel.fromExchangeRateApi(json, from, to),
      refresh: true,
    );

    return await GenericHttpImpl<CurrencyRateModel>()(model);
  }

  @override
  Future<Either<Failure, bool>> syncExpenses(List<ExpenseEntity> expenses) async {
    HttpRequestModel model = HttpRequestModel(
      url: "${ApiNames.baseUrl}/expenses/sync",
      requestMethod: RequestMethod.post,
      responseType: ResType.type,
      requestBody: {
        'expenses': expenses.map((e) => _expenseToJson(e)).toList(),
      },
      showLoader: true,
      errorFunc: (error) => error["message"],
      responseKey: (json) => json["success"] == true,
    );

    return await GenericHttpImpl<bool>()(model);
  }

  String _buildExpenseQuery(ExpenseFilterEntity filter) {
    final params = <String>[];

    params.add('page=${filter.page}');
    params.add('limit=${filter.limit}');

    if (filter.category != null) {
      params.add('category=${filter.category}');
    }

    if (filter.period != 'all') {
      final now = DateTime.now();
      DateTime startDate;

      switch (filter.period) {
        case 'week':
          startDate = now.subtract(const Duration(days: 7));
          break;
        case 'month':
          startDate = DateTime(now.year, now.month, 1);
          break;
        default:
          startDate = filter.startDate ?? now.subtract(const Duration(days: 30));
      }

      params.add('startDate=${startDate.toIso8601String()}');
      params.add('endDate=${(filter.endDate ?? now).toIso8601String()}');
    }

    return params.join('&');
  }

  Map<String, dynamic> _expenseToJson(ExpenseEntity expense) {
    return {
      'category': expense.category,
      'amount': expense.amount,
      'currency': expense.currency,
      'convertedAmount': expense.convertedAmount,
      'date': expense.date.toIso8601String(),
      'description': expense.description,
      'categoryIcon': expense.categoryIcon,
      if (expense.receiptPath != null) 'receipt': expense.receiptPath,
    };
  }
}

