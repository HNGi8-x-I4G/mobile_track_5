import 'package:flutter/material.dart';

class InfoOverview extends StatelessWidget {
  InfoOverview({
    Key? key,
    this.fullName,
    this.email,
    this.gender,
    this.track,
    this.xpLevel,
    this.employmentStatus,
  }) : super(key: key);

  final fullName, email, gender, track, xpLevel, employmentStatus;

  @override
  Widget build(BuildContext context) {
    List<Widget> steps = [
      ListTile(
        leading: Text('nono'),
        title: Text("dddd"),
      )
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Text(
                'Here is your information recap',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Full name",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: Text(
                  fullName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                minVerticalPadding: 7,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
              ListTile(
                title: Text(
                  "Email",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: Text(
                  email,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                minVerticalPadding: 7,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
              ListTile(
                title: Text(
                  "Gender",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: gender == null
                    ? Text("----")
                    : Text(
                        gender,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                minVerticalPadding: 7,
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
              ),
              ListTile(
                title: Text(
                  "Track",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: track == null
                    ? Text("-----")
                    : Text(
                        track,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                minVerticalPadding: 7,
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
              ),
              ListTile(
                title: Text(
                  "Experience level",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: xpLevel == null
                    ? Text("----")
                    : Text(
                        xpLevel,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                minVerticalPadding: 7,
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
              ),
              ListTile(
                title: Text(
                  "Employment status",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: employmentStatus == null
                    ? Text("----")
                    : Text(
                        employmentStatus,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                minVerticalPadding: 7,
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
