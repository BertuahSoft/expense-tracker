// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Expense Tracker`
  String get appName {
    return Intl.message(
      'Expense Tracker',
      name: 'appName',
      desc: 'Your Money Manager',
      args: [],
    );
  }

  /// `Money Management`
  String get moneyManagement {
    return Intl.message(
      'Money Management',
      name: 'moneyManagement',
      desc: '',
      args: [],
    );
  }

  /// `Good money management helps you set and achieve long-term financial goals, whether that's as big as buying a home or planning your retirement, or as routine as funding an emergency fund so you aren't stressed out over every unexpected expense that pops up.`
  String get moneyManagementDesc {
    return Intl.message(
      'Good money management helps you set and achieve long-term financial goals, whether that\'s as big as buying a home or planning your retirement, or as routine as funding an emergency fund so you aren\'t stressed out over every unexpected expense that pops up.',
      name: 'moneyManagementDesc',
      desc: '',
      args: [],
    );
  }

  /// `Budget Planing`
  String get budgetPlanning {
    return Intl.message(
      'Budget Planing',
      name: 'budgetPlanning',
      desc: '',
      args: [],
    );
  }

  /// `Since budgeting allows you to create a spending plan for your money, it ensures that you will always have enough money for the things you need and the things that are important to you. Following a budget or spending plan will also keep you out of debt or help you work your way out of debt if you are currently in debt.`
  String get budgetPlanningDesc {
    return Intl.message(
      'Since budgeting allows you to create a spending plan for your money, it ensures that you will always have enough money for the things you need and the things that are important to you. Following a budget or spending plan will also keep you out of debt or help you work your way out of debt if you are currently in debt.',
      name: 'budgetPlanningDesc',
      desc: '',
      args: [],
    );
  }

  /// `Happy Saving`
  String get happySaving {
    return Intl.message(
      'Happy Saving',
      name: 'happySaving',
      desc: '',
      args: [],
    );
  }

  /// `Remember to record cash disbursements every day to avoid wasting expenses and make plans to save money so you can buy things as needed. We will help you manage your finances.`
  String get happySavingDesc {
    return Intl.message(
      'Remember to record cash disbursements every day to avoid wasting expenses and make plans to save money so you can buy things as needed. We will help you manage your finances.',
      name: 'happySavingDesc',
      desc: '',
      args: [],
    );
  }

  /// `Start Saving`
  String get startSaving {
    return Intl.message(
      'Start Saving',
      name: 'startSaving',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
