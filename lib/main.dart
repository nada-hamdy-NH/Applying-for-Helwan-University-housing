import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdina1/core/controllers/observer.dart';
import 'package:mdina1/core/controllers/others/constrain/constrainCubit.dart';
import 'package:mdina1/screens/others/splashScreen.dart';
import 'core/controllers/newStudent/request_form_controller/new_student_cubit.dart';
import 'core/controllers/oldStudent/getProfileData/get_profileData_cubit.dart';
import 'core/controllers/oldStudent/request_form_controller/old_student_cubit.dart';
import 'core/controllers/oldStudent/upDate/update_cubit.dart';

import 'core/controllers/others/login/login_cubit.dart';
import 'network/remote/cache_helper.dart';
import 'network/remote/dio_file.dart';
import 'package:mdina1/core/controllers/others/studentResult/stuRes_cubit.dart';

Future<void> main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
  DioHelperStore.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver() ;
  runApp( MyApp());


  }



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
          providers: [
          BlocProvider(create:(context)=>OldStudentCubit(),
            lazy: true,),
            BlocProvider(create:(context)=>NewStudentCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>ConstraintCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>LoginCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>GetProfileCubit(),
              lazy: true,),
            BlocProvider(create:(context)=>UpdateCubit(),
              lazy: true,),
              BlocProvider(create:(context)=>StudentResCubit(),
              lazy: true,)

          ],
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home://RequestConfirm(),
      //  RequestTime(),
     // RequestType(),
      //    StudentProfile()
      // RequestForm(),
      //  Questions(),

    // RequestResult()
    //  login()
     //   StudentProfile()
      SplashScreen()
    ));
  }
}

