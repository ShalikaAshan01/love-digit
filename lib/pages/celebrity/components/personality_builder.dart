import 'package:flutter/material.dart';
import 'package:flutter_template/components/components.dart';
import 'package:flutter_template/models/personality.dart';

class PersonalityBuilder extends StatelessWidget{
  final List<Personality> personalities;

  const PersonalityBuilder({Key key,@required this.personalities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final style = Theme.of(context).textTheme.bodyText1.copyWith(color: color,fontSize: 12,fontWeight: FontWeight.w400);
    final titleStyle = Theme.of(context).textTheme.bodyText1.copyWith(color: color);
    final subtitleStyle = style.copyWith(fontSize: 10);
    final iconSize = 36.0;
    final width = SizeConfig.blockSizeHorizontal * 25;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Spacer(flex: 3,),
            Container(
                width: width,
                alignment: Alignment.center,
                child: Text("You",style: style,)),
            Container(
                width: width,
                alignment: Alignment.center,
                child: Text("Partner",style: style,)),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: personalities?.length??0,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = personalities[index];
            return Row(
              children: [
                Expanded(flex: 3,child: Text(item.title,style: titleStyle,),),
                Container(
                    alignment: Alignment.center,
                    width: width,
                    child: Column(
                      children: [
                        Icon(item.yourIcon,size: iconSize,color: color,),
                        SizedBox(height: 10,),
                        item.yourSubtitle==null?SizedBox.shrink():Text(item.yourSubtitle,style: subtitleStyle,)
                      ],
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: color,width: 0.15))
                    ),
                    width: width,
                    child: Column(
                      children: [
                        Icon(item.partnerIcon,size: iconSize,color: color,),
                        SizedBox(height: 10,),
                        item.partnerSubtitle==null?SizedBox.shrink():Text(item.partnerSubtitle,style: subtitleStyle,)
                      ],
                    )),
              ],
            );
          },
        )
      ],
    );
  }
}
