import 'package:flutter/material.dart';
import 'package:flutter_template/components/common.dart';
import 'package:flutter_template/components/components.dart';
import 'package:flutter_template/models/celebrity.dart';

class CelebrityImageHeader extends SliverPersistentHeaderDelegate{
  final double minExtent;
  final double maxExtent;
  final celebrity = Celebrity();
  AnimationController scaleAnimationController;
  final bool showAppBarIcons;
  CelebrityImageHeader(this.minExtent, this.maxExtent, this.showAppBarIcons);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Hero(
            tag: Celebrity().id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(circularBorderRadius),
              child: Image.asset(
                Celebrity().image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.deepPurple[400]],
              stops: [0.75, 0.95],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        Positioned(
          left: SizeConfig.blockSizeHorizontal *2,
          top: SizeConfig.blockSizeVertical * 20,
          child: buildText(context),
        ),
        Positioned(
          bottom: -1.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(circularBorderRadius),topLeft: Radius.circular(circularBorderRadius)),
                color: Theme.of(context).backgroundColor
            ),
          ),
        ),
      ],
    );
  }

  Widget buildText(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
            tag: "name-${celebrity.id}",
            child: Text(celebrity.name,style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),)),
        Hero(
            tag: "type-${celebrity.id}",
            child: Text(celebrity.type,style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w300,color: Colors.white),)),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
