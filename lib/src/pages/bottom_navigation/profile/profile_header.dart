import 'package:flutter/material.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../../utils/constants/constant.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
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
                        context.pushNamed(Routes.edit);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.edit,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
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
                        context.pushNamed(Routes.setting);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.settings,
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
        Container(
          height: 5,
          color: colorTertiary,
        ),
        Container(
          height: 8,
          color: colorSecondary,
        ),
      ],
    );
  }
}
