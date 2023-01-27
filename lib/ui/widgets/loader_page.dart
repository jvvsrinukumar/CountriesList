import 'package:countrylist/resources/color_manager.dart';
import 'package:flutter/material.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Opacity(
        opacity: 0.5,
        child: Container(
          color: Colors.grey,
          child:  Padding(
              padding: const EdgeInsets.all(5.0),
              child: Opacity(
                  opacity: 1.0,
                  child:  Center(child: CircularProgressIndicator(
                    color: ColorManager.buttonColor,
                  )))),
        ),
      ),
    );
  }
}