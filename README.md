# CalculatorApp
## [Lv4] Swift로 계산기 앱 만들기

### 요구사항

연산 버튼 (+, -, *, /, AC, =) 은 색상을 orange 로 설정한다.

> 💡 **과제힌트**
> 
> 버튼을 만드는 func makeButton 이라는 메서드가 있었고 인자로 titleValue: String, action: Selector, backgroundColor: UIColor 를 받을 수 있으면 편했겠죠.


### 레벨업 내용

연산자 버튼만 주황색으로 바꿔야한다. 연산자인지 숫자인지 구분할 수 있어야 색을 다르게 줄 수 있기 때문에 클래스 상단에 프로퍼티로 연산자 set을 추가한다.

```swift
private let operatorSet: Set<String> = ["+", "-", "*", "/", "AC", "="]
```

배경색은 버튼을 만들 때 정해지기 때문에 ```makeButton``` 메서드를 수정해야된다. 기존의 ```makeButton```은 ```title```만 받고있는데, 과제힌트를 보면 ```action```, ```backgroundColor```를 추가로 받으라고한다. 일단 action은 이번 레벨과 상관없어보이니 ```nil```로 두고 ```backgroundColor```를 ```bg```로 받아준다.

```swift
private func makeButton(titleValue: String,
                        action: Selector? = nil,
                        backgroundColor: UIColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)) -> UIButton {
    let b = UIButton(type: .system)
    b.setTitle(titleValue, for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = .boldSystemFont(ofSize: 30)
    b.backgroundColor = backgroundColor
    b.layer.cornerRadius = 4

    b.snp.makeConstraints { make in
        make.width.height.equalTo(80)
    }
    return b
}
```

```gridTitles```를 돌면서 버튼을 만드는 부분을 수정한다. 연산자이면 주황색, 숫자면 기존 버튼색깔인 회색(```UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)```)으로 처리해서 스택뷰에 넣어준다.

```swift
let buttons = rowTitles.map { title in
    let bg = operatorSet.contains(title) ? .systemOrange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
    return makeButton(titleValue: title, backgroundColor: bg)
}
```


### 실행화면

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-04 at 12 55 04" src="https://github.com/user-attachments/assets/fd8729f0-1543-434d-b9fa-db84191f92f5" />
