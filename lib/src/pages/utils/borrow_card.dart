import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/constant.dart';

class BorrowCard extends StatefulWidget {
  final String? title;
  final String? noCall;
  final String? borrowDate;
  final String? dueDate;
  final String? returnDate;
  final int? fineAmnt;
  final VoidCallback? function;

  const BorrowCard({
    Key? key,
    required this.title,
    this.noCall,
    this.borrowDate,
    this.dueDate,
    this.returnDate,
    this.fineAmnt,
    this.function,
  }) : super(key: key);

  @override
  State<BorrowCard> createState() => _BorrowCardState();
}

class _BorrowCardState extends State<BorrowCard> {
  final parsingBook = _ParsingBook();

  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

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
                  parsingBook.parsingTitle(widget.title!),
                  style: titleBook,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                widget.noCall != null
                    ? RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: bookNoCall,
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.noCall!.toUpperCase(),
                          style: bookInformationBlack),
                    ],
                  ),
                )
                    : const SizedBox(),
                widget.borrowDate != null
                    ? RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: bookDateBorrow,
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.borrowDate!.isNotEmpty
                              ? parsingBook
                              .convertMonth(widget.borrowDate!)
                              : "",
                          style: bookInformationBlack),
                    ],
                  ),
                )
                    : const SizedBox(),
                widget.returnDate != null
                    ? RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: bookDateReturn,
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.returnDate!.isNotEmpty
                              ? parsingBook
                              .convertMonth(widget.returnDate!)
                              : "",
                          style: bookInformationBlack),
                    ],
                  ),
                )
                    : const SizedBox(),
                widget.dueDate != null
                    ? RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: bookDueDate,
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.dueDate!.isNotEmpty
                              ? parsingBook.convertMonth(widget.dueDate!)
                              : "",
                          style: bookInformationBlack),
                    ],
                  ),
                )
                    : const SizedBox(),
                widget.fineAmnt != null
                    ? RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Denda: ",
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: currencyFormatter.format(widget.fineAmnt),
                          style: bookInformationBlack),
                    ],
                  ),
                )
                    : const SizedBox(),
                const SizedBox(height: 16),
                widget.function != null ? Align(
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
                ) : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class _ParsingBook {
  parsingTitle(String title) {
    return title == "" || title == "-" ? "" : title.toTitleCase();
  }

  String convertMonth(String input) {
    final parsedEnglish =
    DateFormat('dd MMMM yyyy').format(DateTime.parse(input));
    return parsedEnglish.replaceAllMapped(
      RegExp(
          r'\b(January|February|March|April|May|June|July|August|September|October|November|December)\b'),
          (Match match) {
        switch (match.group(0)) {
          case 'January':
            return 'Januari';
          case 'February':
            return 'Februari';
          case 'March':
            return 'Maret';
          case 'April':
            return 'April';
          case 'May':
            return 'Mei';
          case 'June':
            return 'Juni';
          case 'July':
            return 'Juli';
          case 'August':
            return 'Agustus';
          case 'September':
            return 'September';
          case 'October':
            return 'Oktober';
          case 'November':
            return 'November';
          case 'December':
            return 'Desember';
          default:
            return match.group(0)!;
        }
      },
    );
  }
}
