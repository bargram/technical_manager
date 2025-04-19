import 'enum/register_check_list_step_status.dart';
import 'enum/register_check_list_step_type.dart';



class RegisterCheckListStep {

  RegisterCheckListStepType type;
  RegisterCheckListStepStatus status;
  String iconPath;
  String title;

  RegisterCheckListStep({
    required this.type,
    required this.status,
    required this.iconPath,
    required this.title
  });
}