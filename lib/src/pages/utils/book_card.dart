import 'package:flutter/material.dart';

import '../../utils/constants/constant.dart';

class BookCard extends StatefulWidget {
  VoidCallback? function;
  String? title;
  String? noCall;
  String? author;

  BookCard({
    Key? key,
    required this.title,
    required this.noCall,
    required this.author,
    required this.function,
  }) : super(key: key);

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
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
                const Text("Judul:", style: bookInformationGrey),
                Text(
                  widget.title!.isNotEmpty ? widget.title! : "",
                  style: titleBook,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style, // Gaya default
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Nomor Panggil: ",
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.noCall!.isNotEmpty ? widget.noCall! : "",
                          style: bookInformationBlack),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style, // Gaya default
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Penulis: ",
                        style: bookInformationGrey,
                      ),
                      TextSpan(
                          text: widget.author!.isNotEmpty ? widget.author! : "",
                          style: bookInformationBlack),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: widget.function,
                    child: Container(
                      decoration: BoxDecoration(
                          color: colorBlueOpac,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        child: Text("Detail Buku", style: poppinsNormalWhite),
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
