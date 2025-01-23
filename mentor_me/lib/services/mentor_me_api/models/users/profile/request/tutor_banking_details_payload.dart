import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutor_banking_details_payload.freezed.dart';
part 'tutor_banking_details_payload.g.dart';

@freezed
class TutorBankingDetailsPayload with _$TutorBankingDetailsPayload {
  const factory TutorBankingDetailsPayload({
    required String bankAccountNumber,
    required String bankAccountName,
    required int bankAccountType,
  }) = _TutorBankingDetailsPayload;

  factory TutorBankingDetailsPayload.fromJson(Map<String, dynamic> json)
    => _$TutorBankingDetailsPayloadFromJson(json);
}
