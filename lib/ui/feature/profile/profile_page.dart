import 'package:picbox/component/routes.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:provider/provider.dart';

/// Вкладка `Профиль`.
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UScaffold(
      showBackButton: false,
      body: Column(
        children: <Widget>[
          _buildHead(context),
          const SizedBox(height: 20),
          Divider(),
          _buildBody(context),
        ],
      ),
    );
  }

  /// Основа страницы.
  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildProfileViewButton(context),
        Divider(),
        _buildThemeSwitch(context),
        UListButton(AppLocalizations.of(context).tr('settings.title'),
            iconData: MdiIcons.settings,
            onPressed: () => Navigator.pushNamed(context, Routes.SETTINGS)),
        Divider(),
        UListButton(AppLocalizations.of(context).tr('debug.title'),
            iconData: MdiIcons.bug,
            onPressed: () => Navigator.pushNamed(context, Routes.DEBUG)),
      ],
    );
  }

  /// Создаёт контент-кнопку `Хранилище`.
  Widget _buildProfileViewButton(BuildContext context) {
    return UListContent(
      AppLocalizations.of(context).tr('profile.storage'),
      iconData: MdiIcons.archive,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (int i = 0;
              i <
                  (MediaQuery.of(context).orientation == Orientation.portrait
                      ? 4
                      : 8);
              i++)
            ContentCard(
              height: 85,
              width: 85,
              variant: ContentCardVariant.nano,
            ),
        ],
      ),
    );
  }

  /// Создаёт переключатель ночной темы.
  Widget _buildThemeSwitch(BuildContext context) {
    var bloc = Provider.of<ThemeBloc>(context);
    return StreamBuilder(
      stream: bloc.theme,
      builder: (context, AsyncSnapshot<ThemeData> snapshot) {
        return UListSwitch(
          AppLocalizations.of(context).tr('profile.night_theme'),
          iconData: MdiIcons.powerSleep,
          value: bloc.isNightTheme(),
          onChanged: (bool value) => bloc.setNightTheme(value),
        );
      },
    );
  }

  /// Создаёт виджет, содержавший в себе фотографию пользователя, имя и фамилию пользователя, и его никнейм.
  Widget _buildHead(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).disabledColor,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          height: 70,
          width: 70,
          margin: const EdgeInsets.symmetric(vertical: 15),
        ),
        Column(
          children: <Widget>[
            Text("Oleg Tinkoff", style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 4),
            Text(
              "@tinkoffoleg",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Theme.of(context).hintColor),
            )
          ],
        ),
      ],
    );
  }
}
