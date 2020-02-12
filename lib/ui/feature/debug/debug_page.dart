import 'package:picbox/ui/feature/splash/phone_input_Sheet.dart';
import 'package:picbox/ui/global/localizations/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:picbox/ui/widget/pansy.dart';
import 'package:picbox/ui/widget/pansy/sheets/scaffold.dart';

/// Страница `Для разработчиков`.
class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: AppLocalizations.of(context).tr('debug.title'),
      body: Column(
        children: <Widget>[
          UListButton(
            "Open splash",
            onPressed: () =>
                showScaffoldSheet(context, child: PhoneInputSheet()),
          ),
        ],
      ),
    );
  }
}
