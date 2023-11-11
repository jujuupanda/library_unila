import 'package:flutter/material.dart';

import '../../../utils/constants/constant.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Image.asset(
                  imageUnila,
                  width: 60,
                  height: 60,
                  fit: BoxFit.fill,
                  scale: 1,
                )
              ],
            ),
          ),
        ),
        Container(height: 5, color: colorTertiary),
        Container(height: 8, color: colorSecondary),
      ],
    );
  }
}
