
import 'package:flutter/material.dart';

detailPayment(context, child) {
  showModalBottomSheet(
    elevation: 0,
    backgroundColor: Colors.white.withOpacity(0),
    isScrollControlled: true,
    context: context,
    builder: (ctx) => Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: child,
          ),
        ],
      ),
    ),
  );
}