class IconHelper {
  // Ця функція приймає код від OpenWeather (напр. '01d', '09n')
  // і віддає шлях до твоєї картинки
  static String getIconPath(String code) {
    switch (code) {
      case '01d': return 'assets/icons/clear.png';       // Ясно (день)
      case '01n': return 'assets/icons/clear_night.png'; // Ясно (ніч)
      
      case '02d': 
      case '02n':
      case '03d':
      case '03n':
      case '04d':
      case '04n': return 'assets/icons/clouds.png';      // Хмари
      
      case '09d':
      case '09n':
      case '10d':
      case '10n': return 'assets/icons/rain.png';        // Дощ
      
      case '11d':
      case '11n': return 'assets/icons/thunder.png';     // Гроза
      
      case '13d':
      case '13n': return 'assets/icons/snow.png';        // Сніг
      
      case '50d':
      case '50n': return 'assets/icons/mist.png';        // Туман
      
      default: return 'assets/icons/clear.png';          // Запасний варіант
    }
  }
}