import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base_project/config/router/app_router.dart';
import 'package:flutter_base_project/core/constants/app_constants.dart';
import 'package:flutter_base_project/core/constants/view_constants.dart';
import 'package:flutter_base_project/core/utils/bottom_sheets_manager.dart';
import 'package:flutter_base_project/features/home/presentation/bloc/language/language_bloc.dart';
import 'package:flutter_base_project/features/home/presentation/bloc/theme/theme_bloc.dart';
import 'package:flutter_base_project/features/home/presentation/widgets/bottom_sheets/language.dart';
import 'package:flutter_base_project/features/home/presentation/widgets/theme_button.dart';
import 'package:flutter_base_project/features/home/presentation/widgets/translated_text.dart';
import 'package:gap/gap.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late final ThemeBloc themeBloc = context.watch<ThemeBloc>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pop(AppRouter.settings.id);
        return true;
      },
      child: Scaffold(
        body: PopScope(
          child: SafeArea(
              child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.gap16Px,
                vertical: AppConstants.gap24Px),
            children: [
              SettingsTile(
                  title: ViewConstants.theme,
                  subtitle: themeBloc.themeType == ThemeType.light
                      ? ViewConstants.light
                      : ViewConstants.dark,
                  trailing: const ThemeButton()),
              const Gap(AppConstants.font16Px),
              LanguageTile(themeBloc: themeBloc),
            ],
          )),
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.themeBloc,
  });

  final ThemeBloc themeBloc;

  @override
  Widget build(BuildContext context) {
    final LanguageBloc languageBloc = context.read<LanguageBloc>();
    return SettingsTile(
        title: ViewConstants.language,
        subtitle: languageBloc.selectedLanguage.name,
        trailing: const Padding(
          padding: EdgeInsets.all(AppConstants.gap16Px),
          child: Icon(Icons.arrow_forward_ios),
        ),
        onTap: () => onTap(context));
  }

  void onTap(context) {
    showModalSheet(
        backgroundColor: themeBloc.baseTheme.identity,
        context: context,
        content: const LanguageBottomSheet());
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.trailing,
      this.onTap});

  final String title;
  final String subtitle;
  final Widget trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = context.read<ThemeBloc>();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.gap16Px),
        decoration: BoxDecoration(
            color: themeBloc.baseTheme.identity,
            border: Border.all(color: themeBloc.baseTheme.border),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TranslatedText(
                  title,
                  style: TextStyle(
                      fontSize: AppConstants.font18Px,
                      color: themeBloc.baseTheme.primaryText),
                ),
                TranslatedText(
                  subtitle,
                  style: TextStyle(
                      fontSize: AppConstants.font14Px,
                      color: themeBloc.baseTheme.secondaryText),
                ),
              ],
            ),
            const Spacer(),
            trailing
          ],
        ),
      ),
    );
  }
}
