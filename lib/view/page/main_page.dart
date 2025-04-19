import 'package:bargram_technical_manager/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../model/main_page_model.dart';
import '../widget/main_page/main_page_add_checklist_button.dart';
import '../widget/main_page/main_page_exit_button.dart';
import '../widget/main_page/main_page_filters_button.dart';
import '../widget/main_page/main_page_top_bar.dart';
import '../widget/registered_check_list_page/registered_check_list_page_list.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: MainPageModel.scaffoldKey,
      drawer: const Scaffold(),
      body: Column(
        children: [
          MainPageTopBar(),
          SizedBox(height:heightUtil(context, 0.01),),
          // Row(
          //   children: [
          //     Expanded(flex:2,child: MainPageAddCheckListButton()),
          //     Expanded(child: MainPageFiltersButton()),
          //     MainPageExitButton(),
          //   ],
          // ),
          // SizedBox(height:heightUtil(context, 0.01),),
          RegisteredChecklistPageBillLoadingsList(),
        ],
      ),
    );
  }
}
