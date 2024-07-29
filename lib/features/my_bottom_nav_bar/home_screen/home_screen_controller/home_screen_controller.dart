import 'package:flutter_riverpod/flutter_riverpod.dart';


var homeScreenProvider = Provider((ref) => HomeScreenController(ref: ref));

class HomeScreenController {
  ProviderRef ref;
  HomeScreenController({required this.ref});




}