import 'package:contact_dairy/utils/globallist.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class about_contact extends StatefulWidget {
  const about_contact({Key? key}) : super(key: key);

  @override
  State<about_contact> createState() => _about_contactState();
}

class _about_contactState extends State<about_contact> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Contact"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              foregroundImage: Globallist.allcontact[index].image != null
                  ? FileImage(Globallist.allcontact[index].image!)
                  : null,
              child: const Text("No Photos"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(Globallist.allcontact[index].name!),
            const SizedBox(
              height: 10,
            ),
            Text(Globallist.allcontact[index].phone!),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Uri call = Uri(
                      scheme: 'tel',
                      path: Globallist.allcontact[index].phone,
                    );
                    launchUrl(call);
                  },
                  child: const Icon(Icons.call),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Uri mess = Uri(
                      scheme: 'sms',
                      path: Globallist.allcontact[index].phone,
                    );
                    launchUrl(mess);
                  },
                  child: const Icon(Icons.messenger_outline_sharp),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Uri mail = Uri(
                      scheme: 'mailto',
                      path: Globallist.allcontact[index].email,
                    );
                    launchUrl(mail);
                  },
                  child: const Icon(Icons.mail),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Share.share(Globallist.allcontact[index].phone!,
                        subject: Globallist.allcontact[index].name!);
                  },
                  child: const Icon(Icons.share),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
