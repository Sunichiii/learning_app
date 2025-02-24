class AppStates {
  int counter;

  AppStates({required this.counter});
}

class InitStates extends AppStates {
  InitStates() : super(counter: 0);
}


//stateful banaune bhaye 2 ta seperate class banaune
// 2nd class le fisrst class extend garne ani b loc ma 2 ta lai combine garne