import 'package:get_it/get_it.dart';
import 'package:myuconnect/responses/data/repository/responseRepository.dart';
import 'package:myuconnect/responses/data/repository/responseRepositoryImpl.dart';
import 'package:myuconnect/responses/data/service/firestore_service.dart';
import 'package:myuconnect/responses/domain/add_new_responseUC.dart';
import 'package:myuconnect/responses/domain/delete_responseUC.dart';
import 'package:myuconnect/responses/domain/get_responses_UC.dart';
import 'package:myuconnect/responses/presentation/provider/responses_provider.dart';

final _injector = GetIt.instance;

void setUp() {
  _injector.registerLazySingleton<FirebaseService>(() => FirebaseService());
  _injector.registerLazySingleton<ResponsesRepository>(
      () => ResponseRepositoryImpl(_injector<FirebaseService>()));

  //Providers

  _injector.registerLazySingleton<ResponsesProvider>(() => ResponsesProvider(
      _injector<GetResponsesUC>(),
      _injector<AddNewResponseUC>(),
      _injector<DeleteResponseUC>()));

  //Casos de uso
  _injector.registerLazySingleton<GetResponsesUC>(
      () => GetResponsesUC(_injector<ResponsesRepository>()));
  _injector.registerLazySingleton<AddNewResponseUC>(
      () => AddNewResponseUC(_injector<ResponsesRepository>()));
  _injector.registerLazySingleton<DeleteResponseUC>(
      () => DeleteResponseUC(_injector<ResponsesRepository>()));
}
