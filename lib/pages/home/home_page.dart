import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_optical_reader/base/base_stateful_state.dart';
import 'package:mobile_optical_reader/pages/exam/exam_provider.dart';
import 'package:mobile_optical_reader/pages/home/components/drawer_item.dart';
import 'package:mobile_optical_reader/pages/home/components/options_button.dart';
import 'package:provider/provider.dart';

import '../../utils/utility.dart';
import 'home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  late HomeViewModel vm;

  String imgUrl = "";

  @override
  void initState() {
    super.initState();
    vm = Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFddcbdc),
        title: const Row(
          children: [
            Icon(Icons.home_work_outlined, color: Colors.black),
            SizedBox(width: 8),
            Text(
              "Mobil Optik Okuyucu",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 235, 249),
      drawer: buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: OptionsButton(
                      buttonTitle: "Sınavlar",
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExamProvider(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: vm.image,
                        builder: (_, __, ___) {
                          return GestureDetector(
                            onTap: () async {
                              imagePick(ImageSource.camera);
                              debugPrint("Seçenek2 tıklandı!!");

                              //if (vm.image == null) return;
                              String uniqueFileName = DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();
                              Reference referenceRoot =
                                  FirebaseStorage.instance.ref();
                              Reference referenceDirImages =
                                  referenceRoot.child("images");
                              Reference referenceImageToUpload =
                                  referenceDirImages.child(uniqueFileName);

                              try {
                                await referenceImageToUpload.putFile(
                                  File(vm.image.value!.path),
                                );
                                imgUrl = await referenceImageToUpload
                                    .getDownloadURL();
                              } catch (error) {
                                debugPrint(error.toString());
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFddcbdc),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                  strokeAlign: 1,
                                ),
                                image: vm.image.value != null
                                    ? DecorationImage(
                                        image: FileImage(
                                          File(vm.image.value!.path),
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : const DecorationImage(
                                        // CachedNetworkImageProvider()
                                        image: AssetImage(
                                          "assets/images/kucuklogo.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              alignment: Alignment.center,
                              child: const Text(""),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: OptionsButton(
                      buttonTitle: "Seçenek3",
                      onClick: () {
                        debugPrint("Seçenek3 tıklandı!!");
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OptionsButton(
                      buttonTitle: "Seçenek4",
                      onClick: () {
                        debugPrint("Seçenek4 tıklandı!!");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color:
                  Color(0xFFddcbdc), // Açılır menü başlığının arka plan rengi
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/kucuklogo.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 10, height: 20),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HIZLI, GÜVENİLİR VE KOLAY",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900,
                          wordSpacing: 2.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Optical Monster",
                        style: TextStyle(
                          wordSpacing: 2.0,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: DrawerItem(
              itemTitle: "İsim",
              onClick: () {
                debugPrint("İsim tıklandı");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: DrawerItem(
              itemTitle: "Soyisim Anahtarı",
              onClick: () {
                debugPrint("Soyisim tıklandı");
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 10, top: 10),
              child: InkWell(
                onTap: () {},
              )),
          // İsteğe bağlı olarak diğer menü öğelerini buraya ekleyebilirsiniz
        ],
      ),
    );
  }

  void imagePick(ImageSource imageSource) async {
    vm.image.value = await Utility().pickImageFromGallery(imageSource);
    debugPrint("image path ${vm.image.value?.path ?? ""}");
  }
}
