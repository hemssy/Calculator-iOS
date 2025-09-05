# CalculatorApp
## [Lv5] Swift로 계산기 앱 만들기

### 요구사항

모든 버튼들을 원형으로 만들기.

- **💡 과제 힌트**
    - `HorizontalStackView` 의 높이 = 80
    - `VerticalStackView` 의 가로 = 350
    - `VerticalStackView` 의 `Spacing = 10`
    - 그렇기 때문에 `VerticalStackView` 에 들어가는 모든 버튼은 가로 길이가 (350 - 10 * 3) / 4 = 80 이 됨.
    - 즉 모든 버튼은 정사각형이 됨.
    - 버튼을 원형으로 만들기 위해서는 정사각형 버튼을 만들고, `cornerRadius` 를 한 변 길이의 절반으로 설정하면 됩니다.


### 레벨업 내용

이전 레벨에서 이미 `HorizontalStackView` 의 높이 80, `VerticalStackView` 의 가로 350, `VerticalStacView` 의 `Spacing=10` 을 잡아놓았다.

과제 힌트처럼, `VerticalStackView` 에 들어가는 모든 버튼은 가로 길이가 (350 - 10 * 3) / 4 = 80 이 된다.

`cornerRadius` 를 한 변 길이의 절반인 40으로 설정하면 원형이 된다!

### 실행화면

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-05 at 10 32 58" src="https://github.com/user-attachments/assets/9bf0a9dd-6050-4ed7-9172-d0cb8393e84c" />
