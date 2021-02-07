import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_template/components/components.dart';
import 'package:flutter_template/models/celebrity.dart';
import 'package:flutter_template/pages/celebrity/celebrity_view.dart';
import 'package:flutter_template/ui/build_icon.dart';
import 'package:flutter_template/ui/favourable_match.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final celebrity = Celebrity();
    final screenSize = MediaQuery.of(context).size;
    final aspectRatio = screenSize.aspectRatio;
    final imageHeight = screenSize.height * 0.6;
    final imageWidth = imageHeight * aspectRatio;
    final duration = Duration(seconds: 1);

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: imageWidth,
                height: imageHeight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: duration,
                          reverseTransitionDuration: duration,
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            final curveAnimation = CurvedAnimation(
                                parent: animation, curve: Interval(0, 0.5));
                            return FadeTransition(
                                opacity: curveAnimation,
                                child: CelebrityView(
                                  duration: duration,
                                ));
                          },
                        ));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Hero(
                          tag: celebrity.id,
                          child: SizedBox.expand(
                              child: Material(
                            elevation: 10,
                            borderRadius:
                                BorderRadius.circular(circularBorderRadius),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(circularBorderRadius),
                                child: Image.asset(
                                  celebrity.image,
                                  fit: BoxFit.cover,
                                )),
                          ))),
                      Positioned(
                        left: SizeConfig.blockSizeHorizontal * 3,
                        top: SizeConfig.blockSizeHorizontal * 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                                tag: "name-${celebrity.id}",
                                child: Text(
                                  celebrity.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          fontSize: 18, color: Colors.white),
                                )),
                            Hero(
                                tag: "type-${celebrity.id}",
                                child: Text(
                                  celebrity.type,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                      Positioned(
                        right: SizeConfig.blockSizeHorizontal * 3,
                        top: SizeConfig.blockSizeHorizontal * 4,
                        child: BuildIcon(
                          icon: MaterialCommunityIcons.dots_horizontal,
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                        bottom: imageHeight * 0.1,
                        child: FavourableMatch(
                          celebrity: celebrity,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
