// final sl = GetIt.instance;

Future<void> dependencyInjectionInitialization() async {
  /// shared preferences instance
  // final sharedPreferences = await SharedPreferences.getInstance();

  /// shared preferences singleton instance
  // sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  /// Android Notification Channel
  // sl.registerFactory<AndroidNotificationChannel>(() =>
  //     const AndroidNotificationChannel(
  //         'drw_skincare_high_importance_channel', // id
  //         'DRW Skincare Importance Notifications', // title
  //         description:
  //             'This channel is used for DRW Skincare important notifications.', // description
  //         importance: Importance.high,
  //         playSound: false));

  /// Flutter Local Notification Plugin
  // sl.registerSingleton<FirebaseCubit>(FirebaseCubit());
  // sl.registerLazySingleton<FlutterLocalNotificationsPlugin>(
  //     () => FlutterLocalNotificationsPlugin());

  // sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
