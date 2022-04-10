import 'package:flutter/material.dart';

class Scorer extends StatefulWidget {
  const Scorer({Key? key}) : super(key: key);

  @override
  State<Scorer> createState() => _ScorerState();
}

class _ScorerState extends State<Scorer> {
  String playerTitle = "";
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;
  bool isSelected7 = false;
  bool isSelected0 = false;
  bool isSelected10 = false;
  bool isSelected20 = false;
  bool isSelected30 = false;
  bool isSelected40 = false;
  bool isSelected50 = false;
  bool isSelected60 = false;
  bool isSelected70 = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "2",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "3",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 9,
                          endIndent: 9,
                        ),
                        Column(
                          children: [
                            PlayerCheckboxRow(
                              playerTitle: '選手　太郎1',
                              playerTitle1:'選手　太郎2' ,
                              isSelected: isSelected,
                              isSelected1: isSelected0,
                              callback: (String s, bool b){
                                setState(() {
                                  playerTitle=s;
                                  isSelected=b;
                                });
                              },
                            ),
                            PlayerCheckboxRow(
                              playerTitle: '選手　太郎3',
                              playerTitle1: '選手　太郎4',
                              isSelected: isSelected1,
                              isSelected1: isSelected10,
                              callback: (String s, bool b){
                                setState(() {
                                  playerTitle=s;
                                  isSelected=b;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(playerTitle)),
        ),
      ),
    );
  }
}

class PlayerCheckboxRow extends StatefulWidget {
  PlayerCheckboxRow(
      {Key? key, required this.playerTitle, required this.isSelected, required this.isSelected1, required this.callback, required this.playerTitle1})
      : super(key: key);

  bool isSelected;
  bool isSelected1;
  Function(String, bool) callback;
  String playerTitle;
  String playerTitle1;

  @override
  State<PlayerCheckboxRow> createState() => _PlayerCheckboxRowState();
}

class _PlayerCheckboxRowState extends State<PlayerCheckboxRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PlayerCheckbox(
          playerTitle: widget.playerTitle,
          callback: widget.callback,
          isSelected: widget.isSelected,
        ),
        PlayerCheckbox(
          playerTitle: widget.playerTitle1,
          callback: widget.callback,
          isSelected: widget.isSelected1,
        ),
      ],
    );
  }
}

class PlayerCheckbox extends StatefulWidget {
  PlayerCheckbox({Key? key, required this.callback, required this.isSelected, required this.playerTitle})
      : super(key: key);
  Function(String string, bool b) callback;
  bool isSelected;
  String playerTitle;

  @override
  _PlayerCheckboxState createState() => _PlayerCheckboxState();
}

class _PlayerCheckboxState extends State<PlayerCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: widget.isSelected,
            onChanged: (newValue) {
              if (newValue != null) {
                setState(() {
                  widget.isSelected = newValue;
                  widget.callback(widget.playerTitle, newValue);
                });
              }
            },
          ),
          Text(widget.playerTitle),
        ],
      ),
    );
  }
}
