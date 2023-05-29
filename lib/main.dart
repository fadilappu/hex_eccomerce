import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hex_ecommerce/view/home_page_ui/home_page_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/firebase_options.dart';
import 'model/hive_model_class.dart';

Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
// initializing the firebase app
// await Firebase.initializeApp();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(ProductAdapter().typeId)){
    Hive.registerAdapter(ProductAdapter());
  }
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}