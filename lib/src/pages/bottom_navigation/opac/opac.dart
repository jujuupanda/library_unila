import 'package:flutter/material.dart';
import 'package:library_unila/src/pages/utils/search.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../../data/blocs/opac/opac_bloc.dart';

class OpacPage extends StatefulWidget {
  const OpacPage({Key? key}) : super(key: key);

  @override
  State<OpacPage> createState() => _OpacPageState();
}

class _OpacPageState extends State<OpacPage> {
  TextEditingController searchController = TextEditingController();
  late OpacBloc opacBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: colorPrimary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "PERPUSTAKAAN",
                          style: headerHome1,
                        ),
                        Text(
                          "UNIVERSITAS LAMPUNG",
                          style: headerHome2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: colorBlueAnotherOpacity,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: colorPrimaryOpacity,
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          showSearch(context: context, delegate: MySearch());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(6),
                          child: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(height: 5, color: colorTertiary),
          Container(height: 8, color: colorSecondary),
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  imageBackgroundOpac,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.4),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    imageOpacUnila,
                    width: 130,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          context.goNamed(Routes.signIn);
                        },
                        child: const Text(
                          "OPAC Unila",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      const Text(
                        "Layanan Online Public Access Catalog Universitas Lampung",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
