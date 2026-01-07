import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'constants.dart';

// Створюємо глобальний об'єкт "getIt" (наш рюкзак)
final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // --- (Network) ---
  
  // Реєструємо Dio. Використовуємо registerLazySingleton.
  // "Lazy" (лінивий) означає, що Dio створиться тільки тоді, 
  // коли ми вперше його попросимо, а не одразу при старті (економить пам'ять).
  getIt.registerLazySingleton<Dio>(() {
    
    // Налаштування Dio
    final options = BaseOptions(
      baseUrl: Urls.baseUrl,
      connectTimeout: const Duration(seconds: 10), // Чекаємо 10 сек і кидаємо помилку
      receiveTimeout: const Duration(seconds: 10),
      queryParameters: {
        'appid': Urls.apiKey, // Автоматично додаємо ключ до кожного запиту
        'units': 'metric',    // Хочемо градуси Цельсія, а не Фаренгейта
      },
    );

    final dio = Dio(options);

    // Додаємо логування (щоб бачити в консолі, що ми відправляємо і отримуємо)
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    return dio;
  });

  // Пізніше тут ми додамо реєстрацію Cubit-ів та репозиторіїв
}