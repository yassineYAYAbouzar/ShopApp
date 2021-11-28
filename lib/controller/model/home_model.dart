class HomeModel{
  bool status;
  HomeDataModel data;
  HomeModel.fromJson(Map<String,dynamic>json){
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}
class HomeDataModel{
  List<BannersModel> banners =[];
  List<ProductsModel> prodcuts = [];
  HomeDataModel.fromJson(Map<String,dynamic>json){
    json['banners'].forEach((element)=>{
      banners.add(element)
    });
    json['prodcuts'].forEach((element)=>{
      prodcuts.add(element)
    });
  }
}
 class BannersModel{
  int id ;
  String image;
   BannersModel.fromJson(Map<String,dynamic>json){
     id = json['id'];
     image = json['image'];
   }
 }
 class ProductsModel{
   int id ;
   String image;
   String name;
   dynamic price;
   dynamic old_price;
   dynamic discount;
   dynamic inFavorites;
   dynamic inCart;
   ProductsModel.fromJson(Map<String,dynamic>json){
     id = json['id'];
     image = json['image'];
     name = json['name'];
     price = json['price'];
     old_price = json['old_price'];
     discount = json['discount'];
     inFavorites = json['in_favorites'];
     inCart = json['in_cart'];
   }
 }