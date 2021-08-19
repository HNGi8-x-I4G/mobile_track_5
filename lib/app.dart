import 'package:flutter/material.dart';
import 'package:mobile_user_input/info_overview.dart';
import 'package:mobile_user_input/splash_screen.dart';

final zuriLogo = 'assets/images/zuri.jpg';

final hngLogo = 'assets/images/hng.jpg';

final i4gLogo = 'assets/images/i4g.jpg';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNGi8 x I4G intership',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final _gender = [
    "Male",
    "Female",
  ];

  final _tracks = [
    "UI/UX",
    "Frontend",
    "Backend",
    "Mobile",
  ];

  final _xpLevels = [
    "Novice",
    "Beginner",
    "Intermediate",
    "Professional",
  ];

  final _employmentStatus = [
    "Employed",
    "Unemployed",
    "Self-employed",
  ];

  var _currentSelectedValue, _trackValue, _xpValue, _employmentValue;

  var _fullNameController = TextEditingController();
  var _emailController = TextEditingController();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: FadeTransition(
            opacity: _animation,
            child: ListView(
              children: [
                // logos
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(zuriLogo),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(hngLogo),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(i4gLogo),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                // headline
                Text(
                  'Join over 10 thousand',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Text(
                  'learners from around the globe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // subtitle
                Text(
                  'Master the track of your choice, whether it is frontend, backend,'
                  ' mobile, UX/UI, DevOps, digital marketing or even entrepreneurship.'
                  'This intership will prepare you to break into the tech industry.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // form
                Form(
                  key: _formKey,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // name
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Your full name',
                          border: OutlineInputBorder(),
                        ),
                        controller: _fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // email
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Your e-mail address',
                          border: OutlineInputBorder(),
                        ),
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //gender
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                labelText: 'Your gender',
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _currentSelectedValue,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _currentSelectedValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _gender.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // tracks
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                labelText: 'Your track',
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            isEmpty: _trackValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _trackValue,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _trackValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _tracks.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // xp level
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                labelText: 'Your experience level',
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            isEmpty: _xpValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _xpValue,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _xpValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _xpLevels.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // employment status
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                labelText: 'Your employment status',
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            isEmpty: _employmentValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _employmentValue,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _employmentValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _employmentStatus.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // submit button
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    const SnackBar(
                                      duration: const Duration(seconds: 2),
                                      content: Text('Submitting...'),
                                    ),
                                  )
                                  .closed
                                  .then(
                                    (value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InfoOverview(
                                                fullName:
                                                    _fullNameController.text,
                                                email: _emailController.text,
                                                gender: _currentSelectedValue,
                                                track: _trackValue,
                                                xpLevel: _xpValue,
                                                employmentStatus:
                                                    _employmentValue,
                                              )),
                                    ),
                                  );
                            }
                          },
                          child: const Text(
                            'Break into the tech industry!',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
