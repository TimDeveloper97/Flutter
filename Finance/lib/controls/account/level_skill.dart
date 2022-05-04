import 'package:finance/shares/my_colors.dart';
import 'package:flutter/material.dart';

class LevelSkill extends StatefulWidget{
  final double level;
  final double max;
  const LevelSkill({required this.level, required this.max});

  @override
  _LevelSkill createState() => _LevelSkill();
}

class _LevelSkill extends State<LevelSkill>{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          height: 50,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile level',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  getLevelSkill(widget.level, widget.max),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColors.gray.withOpacity(0.8),
                  ),
                ),
              )
            ],
          ),
        ),
        drawLevel(widget.level, widget.max),
      ],
    );
  }
}

Widget drawLevel(double level, double max){
  int number = 6;
  double width = 50, height = 10;
  double value = (level / max) * number;

  print('${width * (value - value.truncate())}');
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for(int i = 0; i < value.truncate(); i++)
        Container(
          width: width,
          height: height,
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
        ),

      Container(
        alignment: Alignment.topLeft,
        width: width,
        height: height,
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.gray.withOpacity(0.4),
        ),
        child: Container(
          alignment: Alignment.topLeft,
          width: width * (value - value.truncate()),
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
        ),
      ),

      for(int i = 0; i < number - 1 - value.truncate(); i++)
        Container(
          width: width,
          height: height,
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.gray.withOpacity(0.4),
          ),
        ),
    ],
  );
}

String getLevelSkill(double level, double max){
  double value = level / max;
  if(value < 0.2) return 'Junior Developer';
  else if(value < 0.4) return 'Senior Developer';
  else if(value < 0.6) return 'Architect';
  else if(value < 0.8) return 'Mid-level Manager';
  else return 'Senior Leader';
}