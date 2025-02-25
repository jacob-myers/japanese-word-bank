import 'package:flutter/material.dart';

// Local
import 'package:japanese_word_bank/widgets/term_card.dart';
import 'package:japanese_word_bank/classes/term_entry.dart';

// Styles
import 'package:japanese_word_bank/themes.dart';

import '../../persistence.dart';
import '../term_editor.dart';

class PageWords extends StatefulWidget {
  const PageWords({super.key});

  @override
  State<StatefulWidget> createState() => _PageWords();
}

class _PageWords extends State<PageWords> {
  List<TermEntry> entries = [
    TermEntry(en_term: "Hello", reading: "こんにちは"),
    TermEntry(en_term: "Rice", k_term: "米", reading: "こめ"),
    TermEntry(en_term: "Rice", k_term: "米", reading: "こめ"),
    TermEntry(en_term: "Rice", k_term: "米", reading: "こめ"),
    TermEntry(en_term: "Rice", k_term: "米", reading: "こめ"),
    TermEntry(en_term: "Rice", k_term: "米", reading: "こめ"),
  ];

  _superSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
                future: WordsDatabaseHelper.instance.getTerms(),
                builder: (BuildContext context, AsyncSnapshot<List<TermEntry>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text("Loading..."));
                  }

                  return ListView(
                      children: List.generate(snapshot.data!.length, (i) {
                        return TermCard(
                          term: snapshot.data![i],
                          onDelete: () {
                            setState(() {});
                          },
                          onEdit: () {
                            setState(() {});
                          },
                          showButtons: true,
                        );
                      })
                  );
                }
            )
        ),
        Container(
          decoration: BoxDecoration(
              color: JWBColors.txtEntryBG
          ),
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: JWBColors.txtEntryUnfocused, width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: JWBColors.txtEntryFocused, width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: JWBColors.txtEntryFocused, width: 2),
                      ),
                      hintStyle: TextStyle(
                          color: JWBColors.txtEntryUnfocused
                      ),
                      hintText: "English or Romaji..."
                  ),
                ),
              ),


              IconButton(
                padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                icon: Icon(Icons.add_box_rounded, size: 40,),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog.fullscreen(
                        child: TermEditor(
                          onClose: _superSetState,
                        )
                      );
                    }
                  );
                },
              )
            ],
          )
        ),
      ],
    );
  }
}