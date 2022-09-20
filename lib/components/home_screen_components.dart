// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nebat/screens/home_screen.dart';
import 'package:nebat/services/apis.dart';
import 'package:nebat/services/providers.dart';
import 'package:provider/provider.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (() async {
          await Provider.of<Services>(context).pickImage();
        }),
        child: Container(
          height: (MediaQuery.of(context).size.height / 3),
          width: double.infinity,
          margin: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 12, color: Colors.deepPurpleAccent),
          ),
          child: image == null
              ? const Center(child: Icon(FontAwesomeIcons.images))
              : Center(
                  child: Image(
                  image: FileImage(image!),
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
        ),
      ),
    );
  }
}

class IdentificationButton extends StatelessWidget {
  const IdentificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (image != null) {
            APIS api = APIS();
            api.identifyPlant(
                Provider.of<Services>(context, listen: false).base64Image);
          } else {
            print('please capture image');
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 22),
          child: Material(
            elevation: 6,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  // border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 40,
              child: const Text(
                'IDENTIFY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }
}

class PlantNameWidget extends StatelessWidget {
  const PlantNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
      child: Center(
          child: Text(
        Provider.of<Services>(context).isImageSet
            ? '??'
            : (Provider.of<Services>(context).isPlant
                ? Provider.of<Services>(context, listen: false)
                    .plans[0]
                    .plantName
                : 'Not Plant !'),
        style: const TextStyle(fontSize: 22),
      )),
    );
  }
}
