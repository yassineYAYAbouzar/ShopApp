import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/controller/authCubit/states.dart';
import 'package:shopapp/controller/model/auth.dart';
import 'package:shopapp/controller/service/remote/dio_helper.dart';
import 'package:shopapp/controller/service/remote/end_points.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginItailState());

  static LoginCubit get(context) =>BlocProvider.of(context);
  LoginModel loginModel;
  var obscureText = false;
  void changeobscureText(){
    if(obscureText==true){
      obscureText = false;
    }else{
      obscureText = true;
    }

    emit(ChangeobscureTextState());
  }
    void userLogin(
      {@required String Email
     ,@required String Password
      }
    ) {
    emit(LoginLoadedState());
    DioHelper.postData(
      lang: 'ar',
        url: LOGIN,
        data: {
          'email':Email,
          'password':Password
        }
    ).then((data) {
      loginModel = LoginModel.fromJson(data.data);
      emit(LoginSucsessState(loginModel));
    }).catchError((onError){
      emit(LoginErrorState(onError.toString()));
    });
  }

}

