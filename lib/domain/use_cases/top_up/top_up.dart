import 'package:flix_id/data/repository/transaction_repository.dart';
import 'package:flix_id/domain/entities/result.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/domain/use_cases/create_transaction/create_transaction.dart';
import 'package:flix_id/domain/use_cases/create_transaction/create_transaction_param.dart';
import 'package:flix_id/domain/use_cases/top_up/top_up_param.dart';
import 'package:flix_id/domain/use_cases/use_case.dart';

class TopUp implements UseCase<Result<void>, TopUpParam> {
  final TransactionRepository _transactionRepository;

  TopUp({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopUpParam params) async {
    CreateTransaction createTransaction =
        CreateTransaction(transactionRepository: _transactionRepository);

    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    var createTransactionResult =
        await createTransaction(CreateTransactionParam(
            transaction: Transaction(
      id: 'flxtp-$transactionTime-${params.userId}',
      uid: params.userId,
      title: 'Top Up',
      adminFee: 0,
      total: -params.amount,
      transactionTime: transactionTime,
    )));

    return switch (createTransactionResult) {
      Success(value: _) => const Result.success(null),
      Failed(message: _) => const Result.failed('Failed to top up')
    };
  }
}
