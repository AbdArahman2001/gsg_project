import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Localization extends StatefulWidget {
  @override
  _LocalizationState createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.language),
          onPressed: () {
            context.setLocale(context.locale == Locale('en') ? Locale('ar') : Locale('en'));
          },
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.teal,
          child: Column(
            children: [
              Text('name').tr(),
              Text('college').tr(),
              Text('dep').tr(),
              Text('level').tr(),
            ],
          ),
        ),
      ),
    );
  }
}
