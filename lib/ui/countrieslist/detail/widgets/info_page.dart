

import 'package:countrylist/entites/countries_list_entity.dart';
import 'package:countrylist/resources/color_manager.dart';
import 'package:countrylist/ui/countrieslist/detail/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final CountriesList countryDetails;
  const InfoPage({super.key, required this.countryDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.backGround,
     height: (MediaQuery.of(context).size.height),
      child: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(child: Image.network(countryDetails.flagPng)),
              ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     Container(
                            color: ColorManager.lightGrey,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0, top: 8.0, left: 20.0, right: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const TextWidget(
                                    text: "Capital",
                                    isValue: false,
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    child: TextWidget(
                                      text: countryDetails.capital,
                                      isValue: true,
                                    ),
                                  
                                  ),
                                ],
                              ),
                            ),
                          ),
                           Container(
                      color: ColorManager.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, top: 8.0, left: 20.0, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextWidget(
                              text: "EAN",
                              isValue: false,
                            ),
                            const Spacer(),
                            Expanded(
                              child: TextWidget(
                                text: countryDetails.nativeName,
                                isValue: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   ],
                 ),
               ),
            ],
      )),
    );
  }
}