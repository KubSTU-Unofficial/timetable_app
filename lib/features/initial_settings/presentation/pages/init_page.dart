import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/features/initial_settings/presentation/bloc/init_page_bloc.dart';
import 'package:timetable_app/shared/presentation/theme/app_colors.dart';
import 'package:timetable_app/shared/data/constants.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<InitPageBloc, InitPageBlocState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Логотип или иконка приложения туточки будет
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Впешите название своей группы, чтобы мы могли загрузить ваше расписание",
                    style: TextStyle(
                      color: AppColors.textAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                sizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Например: 22-КБ-ИВ1",
                      hintStyle: TextStyle(color: AppColors.textDisabled),
                      filled: true,
                      fillColor: AppColors.surface,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppColors.enabledBorder,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppColors.focusedBorder,
                          width: 1.0,
                        ),
                      ),
                    ),
                    onChanged: (value) => context.read<InitPageBloc>().add(loudGroupsEvent(value)),
                  ),
                ),
                sizedBox,
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Продолжить",
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
