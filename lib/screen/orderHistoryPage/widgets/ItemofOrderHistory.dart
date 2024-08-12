import 'package:flutter/cupertino.dart';

class ItemofOrderHistory extends StatelessWidget {
  ItemofOrderHistory({
    super.key,
    required this.title,
    required this.content
  });

  late String title;
  late String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(title,
              style: TextStyle(
                  fontFamily:'Shopee_Bold',
                  fontSize: 19),),
            Text(content,
                style:TextStyle(
                    fontSize: 18,
                    fontFamily: 'Shopee_Medium'
                ))
          ]
      ),
    );
  }
}