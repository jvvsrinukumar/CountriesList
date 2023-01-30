// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:countrylist/utlis/constants.dart';
import 'package:countrylist/utlis/user_defaults.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());
  final isFormValid = BehaviorSubject<bool>.seeded(false);
  setFavorite(bool isFavorite, String country) {
    if (isFavorite) {
      UserDefaults.setString(Constants.kFavoriteCountry, country);
      isFormValid.sink.add(true);
      return true;
    } else {
      UserDefaults.setString(Constants.kFavoriteCountry, "");
      isFormValid.sink.add(false);
    }
  }
}
