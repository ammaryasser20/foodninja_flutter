import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';

part 'manger_state.dart';

class MangerCubit extends Cubit<MangerState> {
  MangerCubit() : super(MangerInitial());
  static MangerCubit get(context) => BlocProvider.of(context);

  String myLanguage = CashHelper.getString(key: Keys.language);
  bool? myMode = CashHelper.getMode() ;
  Future<void> changeLanguage(String language) async {
    myLanguage = language;
    await CashHelper.putString(key: Keys.language, value: language);

    emit(ChangeLanguage());
  }

  Future<void> darkMode(bool dark) async {
    myMode = dark;
    await CashHelper.putBool(key: Keys.darkMode, value: dark);

    emit(ChangeMode());
  }
}
