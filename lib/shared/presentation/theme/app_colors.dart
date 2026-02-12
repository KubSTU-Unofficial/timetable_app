import 'package:flutter/material.dart';

abstract class AppColors {
  // Оранжево-золотая гамма
  static const Color primary = Color(0xFFF97316);     // Яркий оранжевый
  static const Color primaryDark = Color(0xFFEA580C); // Темный оранжевый
  static const Color primaryLight = Color(0xFFFDBA74); // Светлый оранжевый
  
  // Навигационная панель
  static const Color navigationBarBackground = Color(0xFF1E293B); // Темный фон

  // Акцентные цвета
  static const Color accent = Color(0xFFD4AF37);      // Золотой акцент
  static const Color secondary = Color(0xFF0F172A);   // Черный для контраста
  
  // Нейтральные
  static const Color background = Color(0xFFF8FAFC);  // Белый фон
  static const Color surface = Color(0xFFD5D5D5);     // Темно-белый фон
  static const Color card = Color(0xFFF1F5F9);        // Фон карточек
  
  // Текст
  static const Color textPrimary = Color(0xFF0F172A); // Черный текст
  static const Color textSecondary = Color(0xFF475569); // Темно-серый
  static const Color textDisabled = Color(0xFF94A3B8); // Серый
  static const Color textAccent = Color(0xFFEA580C); // Оранжевый для акцентов в тексте
  static const Color focusedText = Color(0xFFEA580C); // Оранжевый для фокус текста
  static const Color unfocusedText = Color(0x80EA580C);
  
  // Системные
  static const Color error = Color(0xFFEF4444);       // Красный
  static const Color success = Color(0xFF10B981);     // Изумрудный
  static const Color warning = Color(0xFFF59E0B);     // Янтарный
  static const Color info = Color(0xFF3B82F6);        // Синий
  
  // Границы и разделители
  static const Color enabledBorder = Color(0xFFFDBA74); // Светло-оранжевый для границ
  static const Color focusedBorder = Color(0xFFF97316); // Оранжевый для границ в фокусе
  static const Color divider = Color(0xFFE2E8F0);     // Светло-серый разделитель
  
  // Темная тема
  static const Color darkBackground = Color(0xFF0F172A); // Темный фон
  static const Color darkSurface = Color(0xFF1E293B);   // Поверхность
  static const Color darkTextPrimary = Color(0xFFF1F5F9); // Светлый текст
}
