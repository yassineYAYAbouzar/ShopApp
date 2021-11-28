import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class CachHelper{
 static final box = GetStorage();

 static void SetData({@required key,@required value}) => box.write(key, value);
 static bool RedeBool({@required key}) => box.read(key);
 static dynamic RedeData({@required key}) => box.read(key);

}