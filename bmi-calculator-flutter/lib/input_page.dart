import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const Color activeColor = Color(0xff314c68);
const Color inactiveColor = Color(0xff223649);

enum Gender {
  None,
  Male,
  Female,
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.None;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.Male;
                      });
                    },
                    child: ReusableCard(
                      color:
                          gender == Gender.Male ? activeColor : inactiveColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: "MALE"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.Female;
                      });
                    },
                    child: ReusableCard(
                      color:
                          gender == Gender.Female ? activeColor : inactiveColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.pink,
            height: 88,
          )
        ],
      ),
      floatingActionButton: Theme(
        data: ThemeData.light(),
        child: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContent({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        Text(label),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  ReusableCard({this.color, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
//                    color: Colors.grey,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
