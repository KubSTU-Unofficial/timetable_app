import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/core/data/database/database.dart';
import 'package:timetable_app/features/initial_settings/data/datasources/api/groups/group_remote_data_source_int.dart';
import 'package:timetable_app/features/initial_settings/data/datasources/api/groups/mock_group_api.dart';
import 'package:timetable_app/features/initial_settings/data/datasources/database/groups_dao.dart';
import 'package:timetable_app/features/initial_settings/data/repos/group_repo.dart';
import 'package:timetable_app/features/initial_settings/domain/repo_ints/group_repo_int.dart';
import 'package:timetable_app/features/initial_settings/domain/usecases/get_all_groups_usecase.dart';

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
	// .. Объекты доступа к данным других сущностей здесь
}

void _initializeRemoteSources() {
	// Подставляем тестовый источник данных, т.к. API пока нет
	// getIt.registerLazySingleton<GroupRemoteDataSource>(() => GroupRemoteDataSource());
	getIt.registerLazySingleton<GroupRemoteDataSourceInt>(() => MockGroupRemoteDataSource());
	// ... Апишки для других сущностей здесь
}

void _initializeRepositories() {
	getIt.registerLazySingleton<GroupRepoInt>(() => GroupRepo(
		db: getIt.get(),
		api: getIt.get(),
		prefs: getIt.get(),
	));
	// .. Другие репозитории здесь
}

void _initializeUsecases() {
	getIt.registerLazySingleton(() => GetAllGroupsUsecase(
		repo: getIt.get()
	));
	// ... Другие сценарии здесь
}
