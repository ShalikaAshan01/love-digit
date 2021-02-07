import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_template/components/components.dart';
import 'package:flutter_template/models/celebrity.dart';

import 'components/build_icon_animation.dart';
import 'components/celebrity_content.dart';
import 'components/celebrity_image_header.dart';

class CelebrityView extends StatefulWidget {
  final Duration duration;
  const CelebrityView({Key key,@required  this.duration}) : super(key: key);
  @override
  _CelebrityViewState createState() => _CelebrityViewState();
}

class _CelebrityViewState extends State<CelebrityView> with TickerProviderStateMixin {
  double imageHeight = SizeConfig.screenHeight  * 1.1;
  // final animationDuration = Duration(milliseconds: 1000);
  final celebrity = Celebrity();
  final scrollController = ScrollController();
  bool showAppBarIcons = false;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this
    );
    //wait til hero animation finished
    Future.delayed(widget.duration).then((value) {
      if(mounted)
        setState(() {
          showAppBarIcons = true;
        });
      animationController.forward().orCancel;
      scrollController.animateTo(SizeConfig.blockSizeVertical * 30, duration: Duration(seconds: 1), curve: Curves.ease);
      scrollController.addListener(scrollListener);

    });
  }
  scrollListener() {
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      if(mounted){
        navigateBack();
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = SizeConfig.safeBlockVertical * 8;
    double horizontalPadding = SizeConfig.safeBlockHorizontal * 1.3;
    return WillPopScope(
      onWillPop: () async {
        await navigateBack();
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            buildBody(),
            Positioned(
              top: topPadding,
              left: horizontalPadding,
              child: BuildIconAnimation(animationController: animationController, icon: MaterialCommunityIcons.chevron_down,
                onPressed: ()=>navigateBack(),
              ),
            ),
            Positioned(
              top: topPadding,
              right: horizontalPadding,
              child: BuildIconAnimation(animationController: animationController,right: true, icon: MaterialCommunityIcons.dots_horizontal,
              onPressed: (){},
              ),
            ),

            // buildRightIcon(context,
            //     iconData: MaterialCommunityIcons.dots_horizontal,
            //     onPressed: (){
            //   _controller.forward();
            //   print("forward.....");
            //     }
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
      return CustomScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
              pinned: false,
              floating: true,
            delegate:CelebrityImageHeader(0, imageHeight,showAppBarIcons),
          ),
          SliverFillRemaining(
              child: CelebrityContent()),
        ],
    );
  }
  Future<void> navigateBack()async{
    await animationController.reverse();
    Navigator.pop(context);;
  }
}
