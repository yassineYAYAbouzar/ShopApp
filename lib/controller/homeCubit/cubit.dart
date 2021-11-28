import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/controller/homeCubit/states.dart';
import 'package:shopapp/controller/model/home_model_c.dart';
import 'package:shopapp/controller/service/locale/constant.dart';
import 'package:shopapp/controller/service/remote/dio_helper.dart';
import 'package:shopapp/controller/service/remote/end_points.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeItailState());

  static HomeCubit get(context) =>BlocProvider.of(context);
  HomeModel homeModel;
    void getHomeItems() {
    emit(HomeLoadedState());
    DioHelper.getData(
      lang: 'ar',
      url: HOME,
      token: token
    ).then((data) {
      homeModel = HomeModel.fromJson(data.data);
      emit(HomeSucsessState());
    }).catchError((onError){
      emit(HomeErrorState(onError.toString()));
      print(onError.toString());
    });
  }

}

