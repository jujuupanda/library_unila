import 'package:flutter/material.dart';
import 'package:library_unila/src/pages/bottom_navigation/home/home_header.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const HeaderHome(),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: colorBlueHome,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  context.goNamed(Routes.barcodeKTM);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    imageBarcode,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text("Barcode KTM", style: poppinsNormal),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: colorBlueHome,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  context.pushNamed(Routes.status);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    imageStatus,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text("Status Pinjam", style: poppinsNormal),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: colorBlueHome,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  context.pushNamed(Routes.history);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    imageHistory,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "History Pinjam",
                            style: poppinsNormal,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: colorBlueHome,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  context.pushNamed(Routes.edit);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Image.asset(
                                    imageChecklist,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text("Lengkapi Akun", style: poppinsNormal),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: colorBlueHome,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  context.pushNamed(Routes.help);
                                },
                                child: const Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.help_outline_rounded,
                                      size: 50,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text("Bantuan", style: poppinsNormal),
                        ],
                      ),
                      const SizedBox(height: 90, width: 90),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              )),
        ],
      ),
    );
  }
}
