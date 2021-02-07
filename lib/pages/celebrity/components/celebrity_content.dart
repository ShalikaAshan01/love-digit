import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_template/models/personality.dart';
import 'package:flutter_template/pages/celebrity/components/jyothish_tile.dart';
import 'package:flutter_template/pages/celebrity/components/personality_builder.dart';
import 'package:flutter_template/ui/gradient_button.dart';

class CelebrityContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18,color: Theme.of(context).primaryColor);
    final subtitle = style.copyWith(fontSize: 12,fontWeight: FontWeight.normal);
    final padding = 15.0;
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.only(left: padding,right: padding),
          child: buildButtonBar(),
        ),
        SizedBox(height: 25,),
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: Text("Jyothish Astrology",style: style,),
        ),
        JyothishTile(icon: FontAwesome5.moon, title: "Nakshatra", subtitle: "Compromise and tolerance is your way to a sky full stars"),
        JyothishTile(icon: MaterialCommunityIcons.minus_circle_outline, title: "Ascendant", subtitle: "Agreement on practical matters, such as finance and home issues"),
        JyothishTile(icon: MaterialCommunityIcons.circle_outline, title: "Sun", subtitle: "Hang in there with your different views of spiritual life"),
        JyothishTile(icon: MaterialCommunityIcons.gender_female, title: "Venus", subtitle: "Cross the bridge with divergent views on love, hobbies, and interests"),
        buildTitleWithBackground(context: context, padding: padding,title: "Vedic Numerology"),
        JyothishTile(icon: MaterialCommunityIcons.calendar_range_outline, title: "Birth Number", subtitle: "Don't judge the book by its cover. Fair compatibility based on birth dates; will require compromise"),
        JyothishTile(icon: MaterialCommunityIcons.numeric_10_circle_outline, title: "Life Path", subtitle: "Leave no stone unturned! Some alignment on life paths; can work with effort"),
        buildTitleWithBackground(context: context, padding: padding,title: "Personality"),
        SizedBox(height: 25,),
        Padding(
          padding: EdgeInsets.only(left: padding,right: padding),
          child: PersonalityBuilder(personalities: [
            Personality("Birth Chart", MaterialCommunityIcons.inbox_multiple_outline, MaterialCommunityIcons.inbox_multiple_outline),
            Personality("Nakshatra", FontAwesome5Solid.spider, MaterialCommunityIcons.spotlight_beam,yourSubtitle: "Mula",partnerSubtitle: "Uttara"),
            Personality("Ascendant", FontAwesome5Brands.maxcdn, FontAwesome5Brands.mix,yourSubtitle: "Scorpio",partnerSubtitle: "Virgo"),
            Personality("Sun Sign", FontAwesome5Brands.mix, MaterialCommunityIcons.arrow_top_right,yourSubtitle: "Virgo",partnerSubtitle: "Sagittarius"),
            Personality("Birth Number", MaterialCommunityIcons.numeric_8, MaterialCommunityIcons.numeric_2),
            Personality("Life Path", MaterialCommunityIcons.numeric_8, MaterialCommunityIcons.numeric_5),
          ]),
        ),
          Container(
            margin: EdgeInsets.all(padding) ,
            color: Theme.of(context).accentColor.withOpacity(0.3),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(padding),
            child: Text("Please make sure to click on the title and icons for each section for a more detailed explanation of your match details",style: subtitle,textAlign: TextAlign.center,))
      ],
    );
  }
  Widget buildTitleWithBackground({@required BuildContext context,@required double padding,@required String title}){
    final style = Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 15,color: Theme.of(context).primaryColor);
    return Container(
        color: Theme.of(context).accentColor.withOpacity(0.3),
        height: 50,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: padding),
        child: Text(title,style: style));
  }

  Container buildButtonBar() {
    return Container(
          child: Row(
            children: [
              Expanded(child: GradientButton(onPressed: (){},text: "Match Details",)),
              SizedBox(width: 20,),
              Expanded(child: GradientButton(onPressed: (){},text: "Personality",gradient: false,)),
            ],
          ),
        );
  }

}
