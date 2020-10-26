## 2020.10.24
- 이전 내 코드로는 다른 페이지와 동기화가 되지 않아, 강의 코드로 업데이트.

마지막강의에서 즐겨찾기 메뉴에서 즐겨찾기 해제하고 나와도 페이지에 그대로 있는 것.

이게 state Management 문제라는건가? 그냥 페이지  rebuild 하면 될 거 같은데 어려운건가..

일단 한 번 들어보자.

## 2020.10.23
브랜치 tap/favorite

- 처음에 실패함.
main에서 meal_screen 과 tap_screen에 값을 넘겨주어야 두개 다 전부 반영이 되는데,
meal_screen에는 List만 넘겨주어서, 나의 즐겨찾기가 무엇인지 반영이 동기화가 되지 않음.

이래서 main에서 다른 하위 Navigation에 뿌려주는거구만..

## 2020.10.22
강의에서는 각 SwitchListTile에다 onChange함수를 익명함수로 길게 주었지만,
나는 짧게하려고, 함수까지 위젯함수에 포함시킴.
여기서 Index 0,1,2,3은 혼란방지를위해 enum으로 바꿔주면 더 완벽할 듯 하다.^^

## 2020.10.20
Error : _dependOnInheritedWidgetOfExactType<_ModalScopeStatus>() or dependOnInheritedElement() was
called before _CategoryMealsScreenState.initState() completed._

일단, 강의의 에러와 내 에러가 다름. 버전차이인듯 싶다.  176강.

When an inherited widget changes, for example if the value of Theme.of() changes, its dependent widgets are rebuilt. If the dependent widget's reference to the inherited widget is in a constructor or an initState() method, then the rebuilt dependent widget will not reflect the changes in the inherited widget.

__번역 : __예를 들어 테마.of()의 값이 변경되는 등 상속된 위젯이 변경되면 종속 위젯이 재구성된다. 상속된 위젯에 대한 종속 위젯의 참조가 생성자 또는 initState() 방법인 경우 재구성된 종속 위젯은 상속된 위젯의 변경사항을 반영하지 않는다.

강의 설명으로는,, **코드에 context가 포함되어 있어서.
build메서드가 실행되기도 전에 initState()가 실행되는 거라서, context 가 있어서는 안되는것같다.**

ㄴ> 그럼, 에러내용의 상속 머시기는 뭐지,, context가 상위 위젯으로부터 상속되기 때문인건가?


- 강의에서는 didChangeDependencies() 안에서도 if문으로 한번만 실행되게 해야하는데,
  왜 내 코드에서는 잘 될까?? 패치된건가??

## 2020.10.19
- DefaultTabController 바텀 탭 바 bottomtabbar

- bottomnavigationbar ( type : BottomNavugationBarType.shifting )
   현재 있는 Tab의 표시를 강조할 수 있음!

- 각 Tap에서 Appbar Title을 달리 주기 위하여, 타이틀과 페이지를 Map으로 같이 넘김

#### PushNamed  PushReplacementNamed
     화면을 스택에 쌓지 않고, 교체해벌임!

     PopAndPushNamed 와 같은거임?ㅁㅈ

## 2020.10.16
routes에 쓰는것과 onGenerateRoute에 쓰는게 어떤 차이가 있을까?

그냥 route가 더 편해보이긴 하는뎅,,

+onUnKnownRoute를 쓰면 페이지404 처럼 없거나 이상한 페이지 안내 가능~


## 2020.10.15
ClipRRect 위젯으로 모양내기 가능..

부모위젯의 크기에 맞춰서 알아서 잘라주는 줄 알았는데 그건 아니였고, 일일이 잘라야 하는 것이였다..

## 2020.10.13
~~ ___Inkwell 의 클릭 시 퍼져나가는 효과의 색상은 primaryColor/primarySwatch 색상을 따라간다!!___ ~~
        -> splashColor를 설정하는 거구낭..

만약 클릭하려는 위젯의 색상이 __Gradient__가 왼쪽부터 _진하다가 연해진다면_,

Inkwell 효과는 왼쪽부터 _연하다가 진해진다!_

__pushNamed__ 를 사용하여 argument를 전달하면, 하나의 페이지로 동적이게, 여러 페이지처럼 보일 수 있다.!