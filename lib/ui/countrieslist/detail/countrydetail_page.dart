// ignore_for_file: must_be_immutable

import 'package:countrylist/entites/countries_list_entity.dart';
import 'package:countrylist/resources/color_manager.dart';
import 'package:countrylist/resources/style_manager.dart';
import 'package:countrylist/ui/countrieslist/detail/cubit/detail_cubit.dart';
import 'package:countrylist/ui/countrieslist/detail/widgets/info_page.dart';
import 'package:countrylist/utlis/constants.dart';
import 'package:countrylist/utlis/user_defaults.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  final CountriesList countryDetails;
  Function() onFavoriteAdded;
  DetailPage(
      {super.key, required this.countryDetails, required this.onFavoriteAdded});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<DetailCubit>(context);
    if (UserDefaults.getString(Constants.kFavoriteCountry).isNotEmpty) {
      if (UserDefaults.getString(Constants.kFavoriteCountry).toLowerCase() ==
          widget.countryDetails.name.toLowerCase()) {
        cubit.setFavorite(true, widget.countryDetails.name);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            widget.countryDetails.name,
            textAlign: TextAlign.left,
            style:
                getSemiBoldStyle(color: ColorManager.textColor, fontSize: 16),
          ),
          leadingWidth: 100,
          leading: IconButton(
            onPressed: () {
              widget.onFavoriteAdded();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 25,
            color: ColorManager.buttonColor,
          ),
          actions: [
            StreamBuilder(
                stream: cubit.isFormValid.stream,
                builder: (context, snapshot) {
                  return IconButton(
                    onPressed: () {
                      if (snapshot.data == false) {
                        cubit.setFavorite(true, widget.countryDetails.name);
                      } else {
                        cubit.setFavorite(false, "");
                      }
                    },
                    icon: snapshot.data == false
                        ? const Icon(Icons.favorite_border)
                        : const Icon(Icons.favorite),
                    iconSize: 30,
                    color: ColorManager.buttonColor,
                  );
                }),
          ]),
      body: SafeArea(
        child: Container(
          color: ColorManager.backGround,
          child: Stack(
            children: [
              BlocConsumer<DetailCubit, DetailState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return InfoPage(countryDetails: widget.countryDetails);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
