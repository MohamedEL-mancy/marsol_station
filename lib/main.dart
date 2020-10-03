import 'package:flutter/material.dart';
import 'package:marsol/constants/lists_widgets.dart';
import 'package:marsol/constants/widgets/screens_widgets/details_screen_widgets.dart';
import 'package:marsol/helper_provider/map_data.dart';

import 'package:marsol/screens/Registration.dart';
import 'package:marsol/screens/add_to_cart.dart';
import 'package:marsol/screens/check_out.dart';
import 'package:marsol/screens/delivery_place.dart';
import 'package:marsol/screens/details.dart';
import 'package:marsol/screens/orders.dart';

import 'package:marsol/screens/pages.dart';
import 'package:marsol/screens/payments.dart';

import 'package:marsol/screens/settings.dart';

import 'package:marsol/screens/splash_screens/splash_delivery_orders.dart';
import 'package:marsol/screens/splash_screens/splash_main_screen.dart';
import 'package:marsol/screens/splash_screens/splash_market_now.dart';

import 'package:marsol/screens/user_location.dart';
import 'package:marsol/screens/wasf.dart';
import 'package:marsol/screens/splash_screens/splash_recieve.dart';
import 'package:provider/provider.dart';

//void main() => runApp(DevicePreview(builder: (context) => Marsol()));
void main() => runApp(Marsol());

class Marsol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailsWidgets(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapData(),
        )
      ],
      child: MaterialApp(
          //builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          routes: {
            SplashMainScreen.id: (context) => SplashMainScreen(),
            SplashMarketNow.id: (context) => SplashMarketNow(),
            Splashreceive.id: (context) => Splashreceive(),
            SplashDeliveryOrders.id: (context) => SplashDeliveryOrders(),
            Details.id: (context) => Details(),
            Payments.id: (context) => Payments(),
            AddToCart.id: (context) => AddToCart(),
            CheckOut.id: (context) => CheckOut(),
            Wasf.id: (context) => Wasf(),
            DeliveryPlace.id: (context) => DeliveryPlace(),
            Registration.id: (context) => Registration(),
            Pages.id: (context) => Pages(),
            UserLocation.id: (context) => UserLocation(),
            Orders.id: (context) => Orders(),
            Settings.id: (context) => Settings()
          },
          initialRoute: SplashMainScreen.id
          //home: Profile(),
          ),
    );
  }
}
