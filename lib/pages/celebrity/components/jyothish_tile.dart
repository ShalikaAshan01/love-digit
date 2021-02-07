import 'package:flutter/material.dart';

class JyothishTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const JyothishTile({Key key,@required this.icon,@required this.title,@required this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon,color: color,size: 36,),
        title: Text(title,style: TextStyle(color: color,fontWeight: FontWeight.w600),),
        subtitle: Text(subtitle,style: TextStyle(color: color)),
      ),
    );
  }
}
