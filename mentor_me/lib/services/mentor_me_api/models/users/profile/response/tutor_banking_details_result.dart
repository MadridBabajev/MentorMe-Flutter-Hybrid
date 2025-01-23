import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentor_me/common/enums/bank_account_variants.dart';

part 'tutor_banking_details_result.freezed.dart';
part 'tutor_banking_details_result.g.dart';

@freezed
class TutorBankingDetailsResult with _$TutorBankingDetailsResult {
  const factory TutorBankingDetailsResult({
    required String bankAccountNumber,
    required String bankAccountName,
    required BankAccountVariants bankAccountType,
  }) = _TutorBankingDetailsResult;

  factory TutorBankingDetailsResult.fromJson(Map<String, dynamic> json)
    => _$TutorBankingDetailsResultFromJson(json);
}
