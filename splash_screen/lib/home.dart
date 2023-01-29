import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   Provider.of<EmployeeInfoData>(context,listen: false).setList();
    return Consumer<EmployeeInfoData>(
      builder: (context,infoEmployeeData,child){
        return Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:TextField(
            
                      controller: searchController,
                       onChanged: (value){
                        infoEmployeeData.searchData(value);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search here',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        suffixIcon:infoEmployeeData.isSearh?IconButton(onPressed: (){
                          searchController.text = '';
                           infoEmployeeData.searchData('');
                        },icon: Icon(Icons.close, color: Colors.black,),):Container(),
                        prefixIcon: Icon(
                          Icons.search,color: Colors.grey,
                          size: 25,
                        ),
                      
                      ),
                    ),
                  ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: infoEmployeeData.list.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        tileColor: index.isOdd ? Colors.orange: Colors.green,
                        leading: CircleAvatar(child: Text(infoEmployeeData.list[index].id.toString())),
                        title: Text(infoEmployeeData.list[index].name),
                        subtitle: Text(infoEmployeeData.list[index].salary.toString()),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
      } 
    );
  }
}