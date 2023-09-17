import 'package:facts_and_achievements_in_sports/src/presentation/fact_page/fact_cubit.dart';
import 'package:facts_and_achievements_in_sports/src/presentation/fact_page/fact_state.dart';
import 'package:facts_and_achievements_in_sports/src/repositories/fact_repository/fact_repository_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/fact_repository/fact_entities/fact_data.dart';
import 'fact_detailed_page.dart';

class FactPage extends StatelessWidget {
  late ScrollController _controller;

  FactCubit? _cubit;

  FactPage() {
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactCubit>(
      create: (_) => FactCubit(FactRepositoryImp()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Facts and Achievements in sports'),
        ),
        body: BlocBuilder<FactCubit, FactState>(builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, FactState state) {
    _cubit = context.read<FactCubit>();

    if (state is FactInitState) {
      return Center(
          child: SimpleDialog(
              backgroundColor: Color.fromRGBO(30, 40, 80, 1),
              children: <Widget>[
            Column(children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text('Please, wait', style: TextStyle(color: Colors.white))
            ])
          ]));
    }
    if (state is FactLoadedState) {
      return SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 5),
          _buildPlugPage(context, state.factsList),
          SizedBox(height: 5),
        ],
      ));
    }
    return SizedBox.shrink();
  }

  Widget _buildPlugPage(BuildContext context, List<FactData> _factsList) {
    return ListView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _factsList.length,
        itemBuilder: (BuildContext context, int factIndex) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(

                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                tileColor: Color.fromRGBO(28, 28, 28, 1),
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      "assets/images/№${factIndex + 1}.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    )),
                title: Text(_factsList[factIndex].title,
                    style: TextStyle(color: Colors.white)),
                subtitle: Text(_factsList[factIndex].content,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white60)),
                trailing: Icon(Icons.navigate_next_rounded, color: Colors.white),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              FactDetailedPage(_factsList[factIndex])));
                },
              ),
          );

        });
  }
}
