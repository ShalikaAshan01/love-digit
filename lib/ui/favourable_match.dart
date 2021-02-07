import 'package:flutter/material.dart';
import 'package:flutter_template/components/components.dart';
import 'package:flutter_template/models/celebrity.dart';

class FavourableMatch extends StatelessWidget {
  final Celebrity celebrity;

  const FavourableMatch({Key key, @required this.celebrity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = SizeConfig.blockSizeHorizontal * 15;
    return Hero(
      tag: "encouraging-match",
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3.0),
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ]
                  )
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.white),
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    value: celebrity.match/100,
                  ),
                ),
              ),
              Text("${celebrity.match}%",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),)
            ],
          ),
          SizedBox(height: 8,),
          Text(celebrity.matchType,style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),)
        ],
      ),
    );
  }
}
