import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/features/buy/ui/buy_screens.dart';
import 'package:foodninja/features/chat/ui/chat_screen.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/home/ui/home_view.dart';
import 'package:foodninja/features/profile/ui/profile_screen.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  static NavigationCubit get(context) => BlocProvider.of(context);
  int index = 0;

  void changeIndex({required int newIndex}) {
    index = newIndex;
    emit(ChangeIndex());
  }

  get screen {
    return [
      BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: const HomeScreen(),
      ),
      const ProfileScreen(),
      const BuyScreen(),
      const ChatScreen()
    ];
  }
}