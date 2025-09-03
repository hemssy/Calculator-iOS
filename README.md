# CalculatorApp
## [Lv1] Swift로 계산기 앱 만들기

### 요구사항

`UILabel` 을 사용해서 수식을 표시할 수 있는 라벨을 띄웁니다.

- **속성**
    - `backgroundColor = .black`
    - `textColor = .white`
    - 우선, 텍스트는 `12345` 로 고정
    - 텍스트 오른쪽 정렬
    - Font = 시스템 볼드체, 사이즈 60
- **AutoLayout**
    - leading, trailing = superView 로 부터 30 떨어지도록 세팅
    - top = superView 로 부터 200 떨어지도록 세팅
    - height = 100

### 해결과정

UI 작성을 하기에 앞서, 전체적인 구조 파악을 하고 들어갔다.

> ```viewDidLoad()```는 뷰 컨트롤러의 생명주기 메서드 중 하나이다. 화면이 메모리에 로드되었을 때 딱 한번 실행되는 함수이다. 주로 여기서 UI를 구성하거나 초기 설정을 하고,```configureUI()```를 호출해서 화면꾸미기를 할 것이다.

> ```configureUI()```는 내가 직접 만든 커스텀 메서드이다. UI 설정을 여기에 모아놓아서 ```viewDidLoad()```가 깔끔해질 수 있다.

먼저, 클래스 최상단에 ```label = UILabel()``` 를 선언하고, 밑에 ```configureUI()```를 만들어서 이 안에 과제 요구사항에 나온 속성, 오토레이아웃 설정을 넣는다.

```swift
    let label = UILabel()
```

```swift
    private func configureUI() {
        view.backgroundColor = .black
        
        // === 라벨 ===
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
```
```viewDidLoad()```가 실행됐을 때 ```configureUI()```가 호출되게하면 완성이다.

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
```

### 실행화면

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-03 at 14 46 08" src="https://github.com/user-attachments/assets/99ae827d-aa66-40bd-a498-611e20f54375" />

