# CalculatorApp
## [Lv3] Swift로 계산기 앱 만들기

### 요구사항

`UIStackView` 을 사용해서 세로 스택 뷰 생성하세요.

- **`verticalStackView` 속성**
    - `axis = .vertical`
    - `backgroundColor = .black`
    - `spacing = 10`
    - `distribution = .fillEqually`
- **`verticalStackView AutoLayout`**
    - width = 350
    - top = label 의 bottom 으로 부터 60 떨어지도록 설정
    - centerX = superView 와 같도록 설정

### 레벨업 내용

<img width="279" height="171" alt="스크린샷 2025-09-04 오전 10 43 37" src="https://github.com/user-attachments/assets/3583ad64-3738-4dcc-9b57-3355b57134f5" />


이런 구조가 나오도록 코드를 수정했다.

이전 레벨과 마찬가지로 class 상단에 ```let verticalStackView = UIStackView()``` 을 선언하면서 시작했고,

```configureUI()```에 버티컬스택뷰 속성이랑 오토레이아웃 설정 추가시켰다. 

버튼 한줄을 버튼 네줄로 만들어서 키패드를 완성해야되는데, 이전 레벨에서 만든 ```makeButton()```을 재사용하고싶었다.

4X4 구조가 나오도록 2차원 배열을 만들고, ```row```를 한줄씩 꺼내서 기존에 만들었던 ```makeButton``` 함수로 갔다오는 구조를 그렸다.

### 트러블슈팅

⚠️ ```verticalStackView.addSubview(row)``` 를 했을 때 ```row```가 한줄로 뭉쳐보인다.

구글서치를 통해, ```addSubview```가 아니라 ```addArrangedSubview``` 를 사용해서 해결했다.

> **[addSubview 와 addArrangedSubview에 대한 글을 블로그에 정리해봤다.](https://velog.io/@hemssy/posts)**


### 실행화면

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-04 at 10 24 52" src="https://github.com/user-attachments/assets/6c124c8e-8782-4d5d-86cf-5f89f99d58d6" />
