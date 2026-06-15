//Voici la palette complète du dashboard :
//Backgrounds
//#080e14 — fond principal (noir bleu profond)
//#0a1520 — header / surfaces secondaires
//#0d1822 — cartes de détail
//#0f1923 — cards / panneaux
//Bordures & séparateurs
//#1e2d3d — bordure standard
//#111d27 — séparateur de tableau (plus discret)
//Textes
//#e8f4ff — titres / valeurs importantes
//#c8e0f4 — texte principal
//#8ab4d4 — texte secondaire
//#5a7a99 — labels, légendes
//#4a6680 — texte tertiaire / horodatages
//#3d5a73 — section titles / axes de graphes
//Accents fonctionnels
//#00e5a0 — succès / 2xx / GET (vert menthe électrique)
//#4d8fff — info / POST / temps de réponse (bleu vif)
//#f5c542 — avertissement / 3xx / PUT (ambre)
//#ff8c42 — attention / 4xx / temps lent (orange)
//#ff4d6d — erreur / 5xx / DELETE (rouge vif)
//#c87dff — neutre accent / PATCH (violet)

import 'package:flutter/material.dart';

class DinologTheme {
  static const Color backgroundPrimary = Color(0xFF080E14);
  static const Color backgroundSecondary = Color(0xFF0A1520);
  static const Color cardDetailBackground = Color(0xFF0D1822);
  static const Color cardPanelBackground = Color(0xFF0F1923);

  static const Color borderStandard = Color(0xFF1E2D3D);
  static const Color tableSeparator = Color(0xFF111D27);

  static const Color textTitle = Color(0xFFE8F4FF);
  static const Color textPrimary = Color(0xFFC8E0F4);
  static const Color textSecondary = Color(0xFF8AB4D4);
  static const Color textLabel = Color(0xFF5A7A99);
  static const Color textTertiary = Color(0xFF4A6680);
  static const Color textSectionTitle = Color(0xFF3D5A73);

  static const Color accentSuccess = Color(0xFF00E5A0);
  static const Color accentInfo = Color(0xFF4D8FFF);
  static const Color accentWarning = Color(0xFFF5C542);
  static const Color accentAttention = Color(0xFFFF8C42);
  static const Color accentError = Color(0xFFFF4D6D);
  static const Color accentNeutral = Color(0xFFC87DFF);
}

ThemeData dinologThemeData() {
  const colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: DinologTheme.accentInfo,
    onPrimary: DinologTheme.textTitle,
    secondary: DinologTheme.accentSuccess,
    onSecondary: DinologTheme.backgroundPrimary,
    error: DinologTheme.accentError,
    onError: DinologTheme.textTitle,
    surface: DinologTheme.cardPanelBackground,
    onSurface: DinologTheme.textPrimary,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: DinologTheme.backgroundPrimary,
    canvasColor: DinologTheme.backgroundPrimary,
    dividerColor: DinologTheme.borderStandard,

    appBarTheme: const AppBarTheme(
      backgroundColor: DinologTheme.backgroundSecondary,
      foregroundColor: DinologTheme.textTitle,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: DinologTheme.textTitle,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    cardTheme: const CardThemeData(
      color: DinologTheme.cardPanelBackground,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: DinologTheme.borderStandard),
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: DinologTheme.textTitle,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: DinologTheme.textTitle,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: DinologTheme.textTitle,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: DinologTheme.textTitle,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: DinologTheme.textTitle,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: DinologTheme.textTitle,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: DinologTheme.textTitle,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: DinologTheme.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: DinologTheme.textSecondary,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(color: DinologTheme.textPrimary),
      bodyMedium: TextStyle(color: DinologTheme.textPrimary),
      bodySmall: TextStyle(color: DinologTheme.textSecondary),
      labelLarge: TextStyle(color: DinologTheme.textLabel),
      labelMedium: TextStyle(color: DinologTheme.textLabel),
      labelSmall: TextStyle(color: DinologTheme.textTertiary),
    ),

    iconTheme: const IconThemeData(color: DinologTheme.textSecondary),

    dividerTheme: const DividerThemeData(
      color: DinologTheme.borderStandard,
      space: 1,
      thickness: 1,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DinologTheme.accentInfo,
        foregroundColor: DinologTheme.textTitle,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: DinologTheme.accentInfo,
        side: const BorderSide(color: DinologTheme.accentInfo),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: DinologTheme.accentInfo),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: DinologTheme.cardDetailBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: DinologTheme.borderStandard),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: DinologTheme.borderStandard),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(color: DinologTheme.accentInfo),
      ),
      labelStyle: TextStyle(color: DinologTheme.textLabel),
      hintStyle: TextStyle(color: DinologTheme.textTertiary),
    ),

    chipTheme: const ChipThemeData(
      backgroundColor: DinologTheme.cardDetailBackground,
      labelStyle: TextStyle(color: DinologTheme.textSecondary),
      side: BorderSide(color: DinologTheme.borderStandard),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),

    dataTableTheme: const DataTableThemeData(
      headingRowColor: WidgetStatePropertyAll(DinologTheme.backgroundSecondary),
      dataRowColor: WidgetStatePropertyAll(DinologTheme.cardPanelBackground),
      dividerThickness: 1,
      headingTextStyle: TextStyle(
        color: DinologTheme.textLabel,
        fontWeight: FontWeight.w600,
      ),
      dataTextStyle: TextStyle(color: DinologTheme.textPrimary),
    ),

    tooltipTheme: const TooltipThemeData(
      decoration: BoxDecoration(
        color: DinologTheme.backgroundSecondary,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.fromBorderSide(
          BorderSide(color: DinologTheme.borderStandard),
        ),
      ),
      textStyle: TextStyle(color: DinologTheme.textPrimary),
    ),

    scrollbarTheme: const ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(DinologTheme.borderStandard),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? DinologTheme.accentSuccess
            : DinologTheme.textTertiary,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? DinologTheme.accentSuccess.withAlpha(80)
            : DinologTheme.borderStandard,
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: DinologTheme.accentInfo,
    ),

    snackBarTheme: const SnackBarThemeData(
      backgroundColor: DinologTheme.backgroundSecondary,
      contentTextStyle: TextStyle(color: DinologTheme.textPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        side: BorderSide(color: DinologTheme.borderStandard),
      ),
      behavior: SnackBarBehavior.floating,
    ),

    popupMenuTheme: const PopupMenuThemeData(
      color: DinologTheme.backgroundSecondary,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        side: BorderSide(color: DinologTheme.borderStandard),
      ),
      textStyle: TextStyle(color: DinologTheme.textPrimary),
    ),

    listTileTheme: const ListTileThemeData(
      tileColor: Colors.transparent,
      iconColor: DinologTheme.textSecondary,
      textColor: DinologTheme.textPrimary,
      titleTextStyle: TextStyle(color: DinologTheme.textPrimary),
      subtitleTextStyle: TextStyle(color: DinologTheme.textSecondary),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: DinologTheme.backgroundSecondary,
      surfaceTintColor: Colors.transparent,
    ),

    tabBarTheme: const TabBarThemeData(
      labelColor: DinologTheme.accentInfo,
      unselectedLabelColor: DinologTheme.textSecondary,
      indicatorColor: DinologTheme.accentInfo,
      dividerColor: DinologTheme.borderStandard,
    ),
  );
}
