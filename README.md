# CalculatorApp
## [Lv7] Swift로 계산기 앱 만들기

### 요구사항

AC 버튼을 클릭하면 모든 값을 지우고 “0” 으로 초기화 되도록 구현합니다.

### 레벨업 내용

버튼을 클릭할 때 수행되는 동작이기 때문에 `buttonClicked` 메서드에 if문을 추가했다.

```swift
        if title == "AC" {
            리셋함수()
            return
        }
```

`buttonClickked` 메서드 블럭 밑에 추가한 리셋함수 `resetCalculator()`는 `label.text`를 다시 기본값 0으로 바꾼다.

```swift
    private func resetCalculator() {
        label.text = "0"
    }
```


### 실행화면

AC버튼을 눌렀을 때 텍스트가 초기화됨

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-08 at 10 52 19" src="https://github.com/user-attachments/assets/a7b8ca77-f279-4d53-8871-2f2f7d4413ed" />
