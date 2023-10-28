import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/constant.dart';

class BorrowCard extends StatefulWidget {
  String? title;
  String? author;
  String? noCall;
  String? dateReturn;
  VoidCallback? function;

  BorrowCard({
    Key? key,
    required this.title,
    required this.noCall,
    required this.author,
    required this.dateReturn,
    required this.function,
  }) : super(key: key);

  @override
  State<BorrowCard> createState() => _BorrowCardState();
}

class _BorrowCardState extends State<BorrowCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1.5, color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            width: 80,
            child: Image.asset(
              imageBookCover,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(bookTitle, style: bookInformationGrey),
                Text(
                  widget.title!,
                  style: titleBook,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: bookNoCall,
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.noCall!, style: bookInformationBlack),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: bookAuthor,
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.author, style: bookInformationBlack),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: bookDateReturn,
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.dateReturn!.isNotEmpty
                              ? "${DateFormat('dd MMMM yyyy').format(DateTime.parse(widget.dateReturn!))}"
                              : "",
                          style: bookInformationBlack),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: colorBlueOpac,
                        borderRadius: BorderRadius.circular(5)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: widget.function,
                        splashColor: colorPrimary,
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                          child:
                              Text(bookDetailBorrow, style: poppinsNormalWhite),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
