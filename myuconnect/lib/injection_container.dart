

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:myuconnect/responses/features/domain/usecases/get_comments_useCase.dart';
import 'package:myuconnect/responses/features/domain/usecases/send_comments_useCase.dart';

import 'responses/features/data/remote/data_sources/firebase_remote_data_source.dart';
import 'responses/features/data/remote/data_sources/firebase_remote_data_source_impl.dart';
import 'responses/features/data/repositories/firebase_repository_impl.dart';
import 'responses/features/domain/repositories/firebase_repository.dart';
import 'responses/features/presentation/cubit/cubit_chat/cubit_comments.dart';



  GetIt sl = GetIt.instance;
  void setupLocator () async {

  sl.registerFactory<CommentsCubit>(() => 
    CommentsCubit(getCommentsUseCase: sl.call(), sendCommentsUseCase: sl.call())
  );

  //Casos de uso

  sl.registerLazySingleton<GetCommentsUseCase>(() => 
    GetCommentsUseCase()
  );

  sl.registerLazySingleton<SendCommentsUseCase>(() => 
    SendCommentsUseCase(sl.call())
  );
  

//Repository
  
  sl.registerLazySingleton<FireBaseRepository>(() => 
  FireBaseRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<FireBaseRemoteDataSource>(() => 
    FireBaseRemoteDataSourceIml(sl.call())
  );

  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => fireStore);
  
}