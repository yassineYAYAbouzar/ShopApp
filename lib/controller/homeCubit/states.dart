abstract class HomeState {}
class HomeItailState extends HomeState{}

class HomeSucsessState extends HomeState{
}
class HomeErrorState extends HomeState{
  final onError;
  HomeErrorState(this.onError);
}
class HomeLoadedState extends HomeState{}
