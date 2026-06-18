import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/ira_conversation.dart';
import 'ira_message_model.dart';

part 'ira_chat_response_model.freezed.dart';
part 'ira_chat_response_model.g.dart';

@freezed
abstract class IraChatModel with _$IraChatModel {
  const factory IraChatModel({
    required String id,
    required String title,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'assistant_id') required String assistantId,
  }) = _IraChatModel;

  factory IraChatModel.fromJson(Map<String, dynamic> json) =>
      _$IraChatModelFromJson(json);
}

@freezed
abstract class IraChatResponseModel with _$IraChatResponseModel {
  const factory IraChatResponseModel({
    required List<IraChatModel> chats,
  }) = _IraChatResponseModel;

  factory IraChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IraChatResponseModelFromJson(json);
}

extension IraChatModelMapper on IraChatModel {
  IraConversation toEntity() {
    return IraConversation(
      id: id,
      title: title,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(updatedAt) ?? DateTime.now(),
      assistantId: assistantId,
    );
  }

  List<IraMessageModel> toMessageModels() {
    String replyText = '';
    if (assistantId == 'expense' || assistantId == '6a30173adc700605a794a792') {
      replyText = "I've reviewed your request about expenses: '$title'. Under our current policy, you can submit receipts up to 30 days after the expense date.";
    } else if (assistantId == 'hrms' || assistantId == '6a2d2459063374a0a19554e7') {
      replyText = "I've processed your query: '$title'. According to the HRMS portal policies, employee documentation is indexed under KORTEX database sources.";
    } else if (assistantId == 'leave') {
      replyText = "Regarding your leave request: '$title'. Standard annual leave entitlement is 20 days. You can request time off directly through the portal.";
    } else if (assistantId == 'payroll') {
      replyText = "Regarding payroll: '$title'. Your latest monthly pay statement was finalized on June 1st. Let me know if you would like a breakdown.";
    } else {
      replyText = "I have successfully processed your query: '$title'. Please let me know if you have any other questions.";
    }

    return [
      IraMessageModel(
        id: '${id}_user',
        agentId: assistantId,
        sender: 'user',
        text: title,
        timestamp: createdAt,
      ),
      IraMessageModel(
        id: '${id}_assistant',
        agentId: assistantId,
        sender: 'assistant',
        text: replyText,
        timestamp: updatedAt,
      ),
    ];
  }
}
