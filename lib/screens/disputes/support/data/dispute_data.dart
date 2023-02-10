import 'package:flutter/material.dart';

import 'package:skupal/screens/disputes/support/data/dispute_items.dart';

class DISPUTE_DATA {
  static List<DISPUTE_ITEMS> disputFnc() {
    return [
      DISPUTE_ITEMS(
          title: 'Contract Disputes',
          desc: 'Please ensure to have the contract ID'),
      DISPUTE_ITEMS(
          title: 'Verification Issues',
          desc: 'If you need help verifying your ID drop us a line'),
      DISPUTE_ITEMS(
          title: 'Account Issues', desc: 'General account issues and more'),
      DISPUTE_ITEMS(
          title: 'Security Issues',
          desc: 'Feel your account has been compromised?'),
      DISPUTE_ITEMS(
          title: 'Payment and Wallet Issues',
          desc: 'Have a stucked payment? Send us a complaint'),
    ];
  }
}
