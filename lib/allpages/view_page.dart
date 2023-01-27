import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../provider/info_provider.dart';
import 'details_page.dart';


class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<InfoDataProvider>(
        builder: (context,infoDataProvider,child) {
          return Scaffold(
            appBar: AppBar(title: Text('View Page'),),
            body: Column(
              children: [
                SizedBox(height: 10,),
                SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: infoDataProvider.info.length,
                      itemBuilder: (context, index){
                        final contact = infoDataProvider.info[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.green,
                                child: ListTile(
                                  onTap: (){
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => DetailsPage()));
                                  },
                                  contentPadding: EdgeInsets.all(15),
                                  leading: CircleAvatar(child: Text('${infoDataProvider.info[index].id}',style: TextStyle(color: Colors.green),),backgroundColor: Colors.white,),
                                  subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${infoDataProvider.info[index].name}',style: TextStyle(color: Colors.white)),
                                        Text('${infoDataProvider.info[index].email}',style: TextStyle(color: Colors.white)),
                                      ]),
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  child: InkWell(
                                      onTap: (){
                                        infoDataProvider.deleteData(infoDataProvider.info[index]);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 10, right: 10),
                                        child: Icon(Icons.clear,color: Colors.white,),
                                      )
                                  )
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}