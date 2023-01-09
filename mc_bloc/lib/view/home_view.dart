import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(), child: const HomeViewBody());
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab = context
        .select<HomeCubit, HomeTab>((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeTabButton(
                  value: HomeTab.page1,
                  selectedValue: selectedTab,
                  iconData: Icons.list_rounded),
              HomeTabButton(
                  value: HomeTab.page2,
                  selectedValue: selectedTab,
                  iconData: Icons.list_rounded),
            ],
          ),
        ),
        body: IndexedStack(
          index: selectedTab.index,
          children: const [Page1(), Page2()],
        ));
  }
}

class HomeTabButton extends StatelessWidget {
  const HomeTabButton(
      {Key? key,
      required this.value,
      required this.selectedValue,
      required this.iconData})
      : super(key: key);
  final HomeTab value;
  final HomeTab selectedValue;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<HomeCubit>().setTab(value);
        },
        icon: Icon(
          iconData,
          size: 32,
          color: selectedValue != value ? null : Colors.red,
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${HomeTab.page1}'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${HomeTab.page2}'),
      ),
    );
  }
}

void name() {
  final state1 = HomeState();
  final state2 = HomeState();
}

enum HomeTab { page1, page2 }

@immutable
class HomeState extends Equatable {
  final HomeTab tab;

  const HomeState({this.tab = HomeTab.page1});

  @override
  // TODO: implement props
  List<Object?> get props => [tab];
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setTab(HomeTab tab) => emit(HomeState(tab: tab));
}
