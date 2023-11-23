import 'package:flutter/material.dart';
import 'package:library_unila/src/utils/constants/constant.dart';

class StatusMenuHome extends StatefulWidget {
  final Color colorPrimary;
  final Color colorSecondary;
  final String nameStatusMenuHome;
  final String valueStatusMenuHome;
  final VoidCallback function;

  const StatusMenuHome(
      {Key? key,
        required this.colorPrimary,
        required this.colorSecondary,
        required this.nameStatusMenuHome,
        required this.valueStatusMenuHome,
        required this.function})
      : super(key: key);

  @override
  State<StatusMenuHome> createState() => _StatusMenuHomeState();
}

class _StatusMenuHomeState extends State<StatusMenuHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.function,
          splashColor: colorPrimaryOpacity,
          borderRadius: BorderRadius.circular(5),
          child: Row(
            children: [
              Container(
                width: 6,
                decoration: BoxDecoration(
                  color: widget.colorPrimary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                ),
              ),
              Container(
                width: 3,
                color: widget.colorSecondary,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.nameStatusMenuHome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: poppinsNormal,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          widget.valueStatusMenuHome,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: poppinsBig,
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
    );
  }
}
