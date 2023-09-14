import 'package:facts_and_achievements_in_sports/src/presentation/plug_page/plug_cubit.dart';
import 'package:facts_and_achievements_in_sports/src/presentation/plug_page/plug_state.dart';
import 'package:facts_and_achievements_in_sports/src/repositories/fact_repository/fact_repository_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/fact_repository/fact_entities/fact_data.dart';
import 'fact_detailed_page.dart';

class PlugPage extends StatelessWidget {
  late ScrollController _controller;

  PlugCubit? _cubit;

  PlugPage(){
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlugCubit>(
      create: (_) => PlugCubit(FactRepositoryImp()),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 249, 1),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Facts and Achievements in sports'),
        ),
        body: BlocBuilder<PlugCubit, PlugState>(builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, PlugState state) {
    _cubit = context.read<PlugCubit>();

    if (state is PlugInitState) {
      return Center(
          child: SimpleDialog(backgroundColor: Colors.white, children: <Widget>[
            Column(children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text('Please, wait')
            ])
          ]));
    }
    if (state is PlugLoadedState){
      return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              _buildPlugPage(context, state.factsList),
              SizedBox(height: 5),
            ],
          )
      )
        ;

    }
    return SizedBox.shrink();
  }

  Widget _buildPlugPage (BuildContext context, List<FactData> _factsList){
    return
      ListView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _factsList.length,
          itemBuilder: (BuildContext context, int factIndex){
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),

                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset("assets/images/№${factIndex + 1}.jpg", height: 60, width: 60, fit: BoxFit.cover, )),
              title: Text(_factsList[factIndex].title),
              subtitle: Text(_factsList[factIndex].content, overflow: TextOverflow.ellipsis),
              trailing: Icon(Icons.navigate_next_rounded),
              onTap: (){ Navigator.push(
                context, MaterialPageRoute(
                  builder: (_) => FactDetailedPage(_factsList[factIndex]))
              );
                },

            ),
          );
          });
  }
}