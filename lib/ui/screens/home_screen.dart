import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../logic/weather_cubit.dart';
import '../../logic/weather_state.dart';
import '../../data/models/forecast_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  final Color _textColor = const Color(0xFF303345);

  // --- СТИЛІ ---
  BoxDecoration _glassDecoration({bool isActive = false}) {
    return BoxDecoration(
      color: isActive 
          ? Colors.white.withValues(alpha: 0.6) // Майже білий (активний)
          : Colors.white.withValues(alpha: 0.3), // Світло-молочний (звичайний)
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.4),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05), // Дуже ніжна тінь
          blurRadius: 15,
          offset: const Offset(0, 5),
        )
      ],
    );
  }

  String _getDateString(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${weekdays[date.weekday - 1]}, ${date.day} ${months[date.month - 1]}';
  }

  String _getTimeString(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.hour.toString().padLeft(2, '0')}:00';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..loadWeather('Lviv'),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFEE3BC), Color(0xFFF39876)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            // Використовуємо ListView для всього екрана.
            // Це гарантує, що SearchBar і контент прокручуються разом
            // і ніколи не викликають overflow.
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                // --- ПОШУК (Виніс окремим віджетом для чистоти) ---
                _buildSearchSection(),

                const SizedBox(height: 10),

                // --- ГОЛОВНИЙ КОНТЕНТ ---
                BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    // Використовуємо .when, щоб уникнути помилок типів
                    return state.when(
                      initial: () => const SizedBox(height: 50),
                      loading: () => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: const Center(child: CircularProgressIndicator(color: Colors.white)),
                      ),
                      error: (msg) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(child: Text("Error: $msg", style: TextStyle(color: _textColor))),
                      ),
                      success: (forecast) => _buildSuccessContent(context, forecast),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- ВІДЖЕТ ПОШУКУ ---
  Widget _buildSearchSection() {
    // Тут ми використовуємо Builder, щоб отримати context, який має доступ до Provider
    // (хоча в цій архітектурі це не критично, бо BlocProvider вище, але так безпечніше)
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5)
                )
              ],
            ),
            child: TextField(
              controller: _cityController,
              style: TextStyle(color: _textColor),
              decoration: InputDecoration(
                hintText: 'Search city...',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.orangeAccent),
                  onPressed: () {
                    if (_cityController.text.isNotEmpty) {
                      context.read<WeatherCubit>().loadWeather(_cityController.text);
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                ),
              ),
              onSubmitted: (val) {
                if (val.isNotEmpty) {
                  context.read<WeatherCubit>().loadWeather(val);
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
            ),
          ),
        );
      }
    );
  }

  // --- ВІДЖЕТ З ПОГОДОЮ ---
  Widget _buildSuccessContent(BuildContext context, ForecastModel forecast) {
    final current = forecast.list.first;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          
          // МІСТО
          Text(
            forecast.city.name,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: _textColor),
          ),
          Text(
            _getDateString(current.dt),
            style: TextStyle(
                fontSize: 16,
                color: _textColor.withValues(alpha: 0.6)),
          ),

          const SizedBox(height: 30),

          // ВЕЛИКА ІКОНКА
          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1), // М'яка тінь
                        blurRadius: 30, // Більший радіус розмиття для м'якості
                        offset: const Offset(0, 10)
                      )
                    ]
                  ),
                  child: Image.network(
                    "https://openweathermap.org/img/wn/${current.weather.first.icon}@4x.png",
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "${current.main.temp.round()}°",
                  style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold, color: _textColor),
                ),
                Text(
                  current.weather.first.description.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w600, 
                    letterSpacing: 1.5,
                    color: _textColor.withValues(alpha: 0.7)
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // БЛОК ДЕТАЛЕЙ
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: _glassDecoration(isActive: false),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailItem(Icons.thermostat, "${current.main.feelsLike.round()}°", "Feels like"),
                _buildDetailItem(Icons.air, "${current.wind.speed} m/s", "Wind"),
                _buildDetailItem(Icons.water_drop, "${current.main.humidity}%", "Humidity"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ЗАГОЛОВОК NEXT 5 DAYS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _textColor),
              ),
              TextButton(
                onPressed: () => context.push('/details', extra: forecast),
                child: Text(
                  "Next 5 Days >", 
                  style: TextStyle(
                      color: _textColor.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),

          const SizedBox(height: 10),

          // ГОРИЗОНТАЛЬНИЙ СКРОЛ
          SizedBox(
            height: 150, // 👈 ЗБІЛЬШИВ ВИСОТУ (було 140), щоб прибрати overflow всередині карток
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                final item = forecast.list[index + 1]; 
                final isFirst = index == 0;

                return Container(
                  width: 100, // Фіксована ширина для кращого вигляду
                  margin: const EdgeInsets.only(right: 15, bottom: 10, top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: _glassDecoration(isActive: isFirst),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${item.main.temp.round()}°",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 18,
                          color: _textColor, 
                        ),
                      ),
                      const SizedBox(height: 5),
                      Image.network(
                        "https://openweathermap.org/img/wn/${item.weather.first.icon}.png",
                        width: 40,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _getTimeString(item.dt),
                        style: TextStyle(
                          fontSize: 12,
                          color: _textColor.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: _textColor.withValues(alpha: 0.5), size: 26),
        const SizedBox(height: 8),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: _textColor)),
        Text(label, style: TextStyle(color: _textColor.withValues(alpha: 0.5), fontSize: 12)),
      ],
    );
  }
}