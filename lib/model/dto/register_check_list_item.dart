import 'enum/register_check_list_step_status.dart';
import 'enum/register_check_list_step_type.dart';



class RegisterCheckListItem {
  String title;
  String? metaText;
  bool? approveStatus;

  RegisterCheckListItem({required this.title, this.approveStatus, this.metaText});
}