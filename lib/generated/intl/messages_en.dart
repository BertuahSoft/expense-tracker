// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Expense Tracker"),
        "budgetPlanning":
            MessageLookupByLibrary.simpleMessage("Budget Planing"),
        "budgetPlanningDesc": MessageLookupByLibrary.simpleMessage(
            "Since budgeting allows you to create a spending plan for your money, it ensures that you will always have enough money for the things you need and the things that are important to you. Following a budget or spending plan will also keep you out of debt or help you work your way out of debt if you are currently in debt."),
        "happySaving": MessageLookupByLibrary.simpleMessage("Happy Saving"),
        "happySavingDesc": MessageLookupByLibrary.simpleMessage(
            "Remember to record cash disbursements every day to avoid wasting expenses and make plans to save money so you can buy things as needed. We will help you manage your finances."),
        "moneyManagement":
            MessageLookupByLibrary.simpleMessage("Money Management"),
        "moneyManagementDesc": MessageLookupByLibrary.simpleMessage(
            "Good money management helps you set and achieve long-term financial goals, whether that\'s as big as buying a home or planning your retirement, or as routine as funding an emergency fund so you aren\'t stressed out over every unexpected expense that pops up."),
        "startSaving": MessageLookupByLibrary.simpleMessage("Start Saving")
      };
}
