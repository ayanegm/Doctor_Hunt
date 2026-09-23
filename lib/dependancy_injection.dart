import 'package:doctor_hunt/features/admin/data/repo/admin_repository.dart';
import 'package:doctor_hunt/features/admin/data/service/admin_service.dart';
import 'package:doctor_hunt/features/admin/presentation/controllers/cubit/admin_cubit.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/features/auth/data/service/auth_services.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependancyInjection() async {
  //this function thtat will crate  the object
  getIt.registerLazySingleton<AuthFirebaseServices>(
    () => AuthFirebaseServices(),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<AuthFirebaseServices>()),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
  
  //  getIt.registerLazySingleton<AdminService>(
  //   () => AdminService(),
  // );
  // getIt.registerLazySingleton<AdminRepository>(
  //   () => AdminRepository(getIt<AdminService>()),
  // );
  // getIt.registerFactory<AdminCubit>(() => AdminCubit(getIt<AdminRepository>()));
  
}
//registerSingelton create object only 1 time for the whole proejct
//registerLazySingelton create object 1 time but it  will be created when you call it 
//registerFactroy create object many times
