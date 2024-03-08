import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutUsScreen extends ConsumerStatefulWidget {
  const AboutUsScreen({super.key});

  @override
  ConsumerState<AboutUsScreen> createState() {
    return _AboutUsScreenState();
  }
}

class _AboutUsScreenState extends ConsumerState<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Card(
          child: Text(
              "This is an app, integrated with machine learning, used for easing different stages of farming and harvesting. Our goal is to provide a platform for beginner farmers and the experienced ones to utilise the app for utility functions."),
        ),
      ),
    );
  }
}
