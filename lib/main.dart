import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_registration_app/firebase_options.dart';
import 'package:flutter_registration_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_registration_app/src/utils/themes/theme.dart';
import 'package:get/get.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async{
 WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

 //Await splash until other items load
 FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // initialize firebase and Auth Repo
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  await FirebaseAppCheck.instance.activate(
    appleProvider: AppleProvider.debug,
  );

  //main app starts here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TeamAppTheme.lightTheme,
      darkTheme: TeamAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
      home: CircularProgressIndicator(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("default page"),
        leading: const Icon(Icons.ondemand_video),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Heading",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Sub-heading",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Paragraph",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text("Elvated Button")),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined Button")),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(image: AssetImage("assets/images/books.png")),
            )
          ],
        ),
      ),
    );
  }
}

// extension on ThemeData {
//   get backgroungColor => null;
// }
