import 'package:countrylist/entites/countries_list_entity.dart';
import 'package:countrylist/resources/color_manager.dart';
import 'package:countrylist/resources/font_manager.dart';
import 'package:countrylist/resources/routes_manager.dart';
import 'package:countrylist/resources/style_manager.dart';
import 'package:countrylist/resources/value_manager.dart';
import 'package:countrylist/ui/countrieslist/cubit/countries_cubit.dart';
import 'package:countrylist/ui/widgets/loader_page.dart';
import 'package:countrylist/ui/widgets/no_data.dart';
import 'package:countrylist/ui/widgets/textfeild_widget.dart';
import 'package:countrylist/utlis/constants.dart';
import 'package:countrylist/utlis/user_defaults.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesListPage extends StatefulWidget {
  const CountriesListPage({super.key});

  @override
  State<CountriesListPage> createState() => _CountriesListPageState();
}

class _CountriesListPageState extends State<CountriesListPage> {
  late CountriesCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<CountriesCubit>(context);
    cubit.fetchCountries();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text("List"),
          actions: [
            BlocBuilder<CountriesCubit, CountriesState>(
              builder: (context, state) {
                if (state is CountriesListFavState) {
                  return IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.detailRoute,
                          arguments: {
                            "countryDetails": cubit.favCountry,
                            "onFavoriteAdded": () {
                              cubit.getFavorite();
                            }
                          });
                    },
                    icon: const Icon(Icons.favorite),
                    iconSize: 30,
                    color: ColorManager.buttonColor,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ]),
      body: SafeArea(
          child: Container(
        color: ColorManager.backGround,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p14, horizontal: AppPadding.p12),
              child: Column(
                children: [
                  StreamBuilder(
                      stream: cubit.emailStream,
                      builder: (context, snapshot) {
                        return TextFieldWidget(
                          text: "",
                          keyboardType: TextInputType.text,
                          hintText: "",
                          suffixIcon: const Icon(Icons.search),
                          onChanged: (search) {
                            cubit.searchCountries(search,cubit.data);
                          },
                        );
                      }),
                  const SizedBox(
                    height: AppPadding.p10,
                  ),
                  StreamBuilder<List<CountriesList>>(
                      stream: cubit.lstStream,
                      builder: (context,
                          AsyncSnapshot<List<CountriesList>> snapshot) {
                        return snapshot.data != null
                            ? Expanded(
                                child: ListView.builder(
                                  primary: false,
                                  itemCount: snapshot.data?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: AppPadding.p2,
                                          horizontal: AppPadding.p8),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.detailRoute,
                                              arguments: {
                                                "countryDetails":
                                                    snapshot.data![index],
                                                "onFavoriteAdded": () {
                                                  cubit.getFavorite();
                                                }
                                              });
                                        },
                                        child: Card(
                                          elevation: 1.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ListTile(
                                              title: Text(
                                                snapshot.data![index].name,
                                                style: getBoldStyle(
                                                    color: snapshot.hasData
                                                        ? ColorManager.textColor
                                                        : ColorManager.grey2,
                                                    fontSize: FontSizes.s17),
                                              ),
                                              leading: CircleAvatar(
                                                radius:
                                                    35, //we give the image a radius of 50
                                                backgroundImage: NetworkImage(
                                                    snapshot
                                                        .data![index].flagPng),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container();
                      }),
                ],
              ),
            ),
            BlocConsumer<CountriesCubit, CountriesState>(
              builder: (context, state) {
                if (state is CountriesLoading) {
                  return const LoaderPage();
                } else if (state is CountriesSearchState) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p10),
                    child: NoData("No Country with search - ${state.search}"),
                  );
                } else {
                  return Container();
                }
              },
              listener: (context, state) {
                if (state is CountriesLoaded) {
                  if (UserDefaults.getString(Constants.kFavoriteCountry)
                      .isNotEmpty) {
                    cubit.getFavorite();
                  }
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
