abstract class News_State {}

class initStat extends News_State {}

class loading extends News_State {}

class isloaded extends News_State {
 final List art;

  isloaded({required this.art});
}

class Error extends News_State {}
