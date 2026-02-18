import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/initial_settings_page/data/datasources/api/groups/group_remote_data_source.dart';
import 'package:timetable_app/features/initial_settings_page/data/datasources/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/features/initial_settings_page/data/datasources/database/groups_dao.dart';
import 'package:timetable_app/features/initial_settings_page/data/repos/group_repo.dart';
import 'package:timetable_app/features/initial_settings_page/domain/repo_ints/group_repo_int.dart';
import 'package:timetable_app/features/initial_settings_page/domain/usecases/get_all_groups_usecase.dart';
import 'package:timetable_app/shared/data/datasources/api/lessons/lesson_remote_data_source_int.dart';
import 'package:timetable_app/shared/data/datasources/api/lessons/lesson_remote_datasource.dart';
import 'package:timetable_app/shared/data/datasources/database/lessons_dao.dart';
import 'package:timetable_app/shared/data/repos/lesson_repo.dart';
import 'package:timetable_app/shared/domain/repo_ints/lesson_repo_int.dart';
import 'package:timetable_app/shared/domain/usecases/ensure_user_group_classes_up_to_data_usecase.dart';
import 'package:timetable_app/shared/domain/usecases/get_all_classes_for_group_usecase.dart';
import 'package:timetable_app/shared/domain/usecases/get_lessons_for_date_usecase.dart';

final	getIt = GetIt.asNewInstance();

Future<void> configureDependencises() async {

	SharedPreferences prefs = await SharedPreferences.getInstance();

	getIt.registerLazySingleton<Database>(() => Database());
	getIt.registerLazySingleton<SharedPreferences>(() => prefs);

	_initializeRemoteSources();
	_initializeDaos();
	_initializeRepositories();
	_initializeUsecases();
}

void _initializeDaos() {
	getIt.registerLazySingleton(() => GroupsDao(getIt.get()));
	getIt.registerLazySingleton(() => LessonsDao(getIt.get()));
	// .. Объекты доступа к данным других сущностей здесь
}

void _initializeRemoteSources() {
	// Подставляем тестовый источник данных, т.к. API пока нет
	getIt.registerLazySingleton<GroupRemoteDataSourceInt>(() => GroupRemoteDataSource());
	getIt.registerLazySingleton<LessonRemoteDataSourceInt>(() => LessonRemoteDatasource());
	// ... Апишки для других сущностей здесь
}

void _initializeRepositories() {
	getIt.registerLazySingleton<GroupRepoInt>(() => GroupRepo(
		db: getIt.get(),
		api: getIt.get(),
		prefs: getIt.get(),
	));

	getIt.registerLazySingleton<LessonRepoInt>(() => LessonRepo(
		db: getIt.get(),
		api: getIt.get(),
		prefs: getIt.get(),
	));
	// .. Другие репозитории здесь
}

void _initializeUsecases() {
	getIt.registerLazySingleton<GetAllGroupsUsecase>(() => GetAllGroupsUsecase(
		repo: getIt.get()
	));
	
	getIt.registerLazySingleton<GetAllLessonsForUserGroupUsecase>(() => GetAllLessonsForUserGroupUsecase(
		repo: getIt.get()
	));

	getIt.registerLazySingleton<GetLessonsForUserGroupForDateUsecase>(() => GetLessonsForUserGroupForDateUsecase(
		repo: getIt.get()
	));

	getIt.registerLazySingleton<EnsureUserGroupClassesUpToDataUsecase>(() => EnsureUserGroupClassesUpToDataUsecase(
		repo: getIt.get()
	));
	// ... Другие сценарии здесь
}
