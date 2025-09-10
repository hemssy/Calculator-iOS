# CalculatorApp
## [Lv2] Swift로 계산기 앱 만들기

### 요구사항

`UIStackView` 을 사용해서 4개의 버튼을 모아 가로 스택뷰를 생성하세요.

- **`UIButton` 속성**
    - `font = .boldSystemFont(ofSize: 30)`
    - `backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)`
    - `height = 80`
    - `width = 80`
    - `layer.cornerRadius = 4`
- **`horizontalStackView` 속성**
    - `axis = .horizontal`
    - `backgroundColor = .black`
    - `spacing = 10`
    - `distribution = .fillEqually`
- **`horizontalStackView AutoLayout`**
    - `height = 80`


> 과제힌트: `func makeHorizontalStackView(_ views: [UIView]) → UIStackView` 와 같은 형태로 `horizontalStackView` 를 생성하는 메서드를 정의해두면 좋습니다. Lv2에서는 첫줄만 만들지만 똑같은 스택뷰 4줄이 필요하기 때문이죠.

### 레벨업 내용

과제조건을 보니까 ```horizontalStackView``` 안에 ```UIButton```이 들어가는 것 같다. 수평 스택뷰 안에 버튼 4개를 만들어서 넣어줘야된다.

Lv1에서 라벨을 프로퍼티로 선언해준 것처럼 ```horizontalStackView``` 를 클래스 상단에 선언해준다. 

```swift
    let label = UILabel()
    let horizontalStackView = UIStackView()
```

버튼도 이렇게 선언하면 될까? 버튼은 여러개를 만들거니까 프로퍼티 하나로 선언해서 끝날 수는 없다. 

💡 **과제힌트를 보면, makeHorizontalStackView 함수를 만들어서 [UIView]를 넘겨주고 있다.**

버튼에 들어갈 텍스트를 하나의 배열로 만들고, ```makebutton``` 함수에서 만들어진 하나의 버튼을 다시 ```buttons``` 배열에 하나씩 넣는 방법을 사용할 것이다.

```swift
        // === 버튼 4개 만들기 ===
        let titles = ["7", "8", "9", "+"]
        let buttons = titles.map { makeButton(title: $0) }
```

```makeButton``` 함수(여기에 과제조건에서 주어진 버튼 속성이 들어간다.) 를 호출해서 ```UIButton``` 객체 ```b```를 만들고, ```b```를 모아서 ```buttons```를 만든다.

```swift
    private func makeButton(title: String) -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle(title, for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 30)
        b.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        b.layer.cornerRadius = 8
        return b
    }
```

```swift
        // === 버튼 4개 만들기 ===
        let titles = ["7", "8", "9", "+"]
        let buttons = titles.map { makeButton(title: $0) }
```

이 ```buttons```는 다시 ```makeHorizontalStackView``` 함수(여기에 과제조건에서 주어진 스택뷰 속성이 들어간다.) 로 전달돼서 가로로 나열된 ```row```에 합류하게 된다.
오토레이아웃은 ```addSubview```가 호출된 이후에 등장하게 된다!

```swift
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
```

```swift
        // === 스택뷰 생성 ===
        let row = makeHorizontalStackView(buttons) // row는 가로한줄! 스택뷰만들기함수로 생성된 객체 stackView를 row에 담는다.
        view.addSubview(row)
        
        row.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(80)
        }
```
### 트러블슈팅

버튼 폰트속성을 설정하다가

```b.font = .boldSystemFont(ofSize: 30)``` 라인에서

⚠️ ```'font' is unavailable in iOS: Specify an attributed title with a custom font``` 에러가 났다.

```UIButton```에는 ```font```라는 프로퍼티가 없기 때문에 발생한 에러이다.
버튼에 표시되는 텍스트 스타일은 ```titleLabel```이라는 프로퍼티를 통해서 지정할 수 있다고 한다!

```b.titleLabel?.font = .boldSystemFont(ofSize: 30)``` 로 수정해서 해결했다.

### 실행화면

<img width="200" height="600" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-03 at 14 54 09" src="https://github.com/user-attachments/assets/6427ce6e-b366-436f-ac46-5362f30c5671" />


