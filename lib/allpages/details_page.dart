import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsPage extends StatelessWidget {
  static const String routeName = '/details_page';
  String getData;
  DetailsPage(this.getData, {super.key,});

  @override
  Widget build(BuildContext context) {

    var data = getData;
    var item = data.split(',');
    return Scaffold(
      appBar: AppBar(title: Text(item[0],style: const TextStyle(color: Colors.white),)),
      body: Center(
        child: Column(
          children: [
            Image.network(
              item[0],
              width: double.infinity,
              height: 250,
              fit: BoxFit.fill,
            ),
            Container(
                width: double.infinity,
                height: 50,
                color: Colors.grey.withOpacity(0.2),
                child: Center(
                  child: Text(
                    item[0],
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontFamily: 'ro',
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10,vertical: 15),
              child: Text(item[2],textAlign: TextAlign.justify,style: const TextStyle(fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}
