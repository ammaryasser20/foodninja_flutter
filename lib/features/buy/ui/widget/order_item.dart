import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/resources/assets_manager.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/font_manager.dart';
import 'package:foodninja/features/buy/data/model/order_model.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/profile/logic/cubit/profile_cubit.dart';
import 'package:foodninja/features/widget/food_screen.dart';
import 'package:foodninja/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderModel});
  final FoodOrder orderModel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(orderModel.food.name!),
      background: Container(
        alignment: isItArabic() ? Alignment.centerLeft : Alignment.centerRight,
        height: 10.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: ColorManager.darkOrange,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 5.w, left: isItArabic() ? 5.w : 0),
          child: const Icon(Icons.delete),
        ),
      ),
      onDismissed: (d) {
        BuyCubit.get(context).removeItem(orderModel.food.id!);
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider<ProfileCubit>.value(
                        value: getIt<ProfileCubit>(),
                      ),
                      BlocProvider<BuyCubit>.value(
                        value: getIt<BuyCubit>(),
                      ),
                    ],
                    child: FoodScreen(
                      food: orderModel.food,
                      restaurant: orderModel.restaurant,
                    ),
                  ),
                  type: PageTransitionType.bottomToTop));
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isItDark() ? ColorManager.liteGray : ColorManager.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              isItDark()
                  ? BoxShadow(
                      color: ColorManager.darkShadow.withOpacity(.5),
                      blurRadius: 50)
                  : BoxShadow(
                      color: ColorManager.whiteShadow.withOpacity(.07),
                      offset: const Offset(12, 26),
                      blurRadius: 50)
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 25.w,
                height: 10.h,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: orderModel.food.pic != null
                    ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://project1.amit-learning.com/food/${orderModel.food.pic!.split("/").last}",
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image.asset(ImageAssets.errorImage),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderModel.food.name ?? " ",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontFamily: FontFamilies.bentonSansMedium),
                  ),
                  SizedBox(
                    height: .1.h,
                  ),
                  Text(
                    orderModel.restaurant.name ?? " ",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: isItDark()
                            ? ColorManager.white.withOpacity(.3)
                            : ColorManager.gray.withOpacity(.3),
                        fontFamily: FontFamilies.bentonSansRegular),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  GradientText(
                    colors: const [
                      ColorManager.primaryColorLight,
                      ColorManager.primaryColor,
                    ],
                    '\$${orderModel.food.price}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontFamily: FontFamilies.bentonSansBold),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  BuyCubit.get(context).deleteOrder(
                    orderModel.food,
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 1.7.w, vertical: 3.2.w),
                  width: 7.w,
                  height: 7.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.primaryColorLight.withOpacity(.1),
                        ColorManager.primaryColor.withOpacity(.1),
                      ],
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorManager.primaryColorLight,
                          ColorManager.primaryColor,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                orderModel.number.toString(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                width: 3.w,
              ),
              GestureDetector(
                onTap: () {
                  BuyCubit.get(context).addOrder(
                      orderModel.food, orderModel.restaurant,
                      needSnackBar: false);
                },
                child: Container(
                  width: 7.w,
                  height: 7.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [
                        ColorManager.primaryColorLight,
                        ColorManager.primaryColor,
                      ],
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
