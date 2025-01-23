import 'package:flutter/material.dart';
import 'package:mentor_me/common/constants/ui_strings.dart';
import 'package:mentor_me/pages/components/layout/app_body.dart';
import 'package:mentor_me/pages/components/layout/app_bottom_bar.dart';
import 'package:mentor_me/pages/components/layout/app_drawer.dart';
import 'package:mentor_me/pages/components/layout/app_top_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppTopBar(title: UiStrings.appTitle),
      drawer: AppDrawer(),
      body: AppBody(),
      bottomNavigationBar: AppBottomBar()
    );
  }
}
