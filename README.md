# CalculatorApp
## [Lv6] Swift로 계산기 앱 만들기

### 요구사항

버튼을 클릭하면 라벨에 표시되도록 합니다.

- 이제 기본 텍스트는 “12345” 가 아닌 “0” 이 되도록 합니다.
- 기본으로 라벨에 노출되어있던 텍스트 오른쪽에 버튼을 클릭하면 그 버튼의 값이 추가되도록 합니다.
    - 예를들어 설명하면
        1. 맨처음 기본값 `0` 
        2. 그 다음 `1` 클릭했음 → 표시되는 값은 `01` 
        3. 그 다음 `2` 클릭했음 → 표시되는 값은 `012` 
        4. 그 다음 `+` 클릭했음 → 표시되는 값은 `012+` 
        5. 그 다음 `3` 클릭했음 → 표시되는 값은 `012+3` 
- 하지만 `012` 라는 값은 이상합니다. 맨 앞자리가 `0` 인 숫자라면, 0을 지우고 표현하도록 합니다.
    - 예를들면, `012` → `12` 가 되어야 합니다.
     
### 레벨업 내용

일단 ```configureUI()```에서 기본 텍스트를 0으로 바꿔준다.

```swift
label.text = "0" 
```

이제 버튼 클릭 이벤트를 추가해야한다.
```button.addTarget(self, action: #selector(내가 만들어야되는 메서드), for: .touchDown)``` 메서드를 사용했다.

> ❗️개념 복습
> - `#selector()` 내부에 버튼 클릭 시 어떤 로직을 수행할 건지 담긴 메서드 작성.
> - `for:` 버튼의 어떤 이벤트에 로직을 수행할 것인지.
> - `touchDown` : 사용자가 버튼을 터치하는 순간 발생.
> - `touchUpInside`: 사용자가 버튼을 터치한 후 손가락을 떼는 순간 발생.

```makeButton``` 메서드안에 리턴 직전에 추가해준다.

```swift
    private func makeButton(titleValue: String, action: Selector, backgroundColor: UIColor) -> UIButton {
        let b = UIButton(type: .system)
        b.b에 대한 속성..
        }
        b.addTarget(self, action: action, for: .touchUpInside)
        return b
    }
```

```addTarget()```을 했으니 메서드 바로 아래에 ```@objc``` 키워드를 붙여서 ```buttonClicked()``` 메서드도 만들었다. 

```swift
    @objc private func buttonClicked(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        label.text = (label.text ?? "") + title
        label.text = text
    }
```

맨앞자리의 0을 정리하는 메서드는 어디에 넣어야할까? 

버튼이 클릭될 때 바로 동작해야되니까 ```buttonClicked()``` 메서드 마지막에 ```noFirstZero()```를 호출하게하고, ```buttonClicked()``` 메서드 밑에 ```noFirstZero()```를 정의해줬다.

```swift
    @objc private func buttonClicked(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        label.text = (label.text ?? "") + title
        
        // 맨앞자리0 정리하는 메서드 호출
        noFirstZero()
    }
    
    private func noFirstZero() {
        guard var text = label.text else { return }
        
        if text.count > 1 && text.first == "0" {
            while text.count > 1 && text.first == "0" {
                text.removeFirst()
            }
        }
        
        label.text = text //noFirstZero()는 무조건 실행되니까 여기서 써도됨
    }
```

### 실행화면

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-05 at 12 48 36" src="https://github.com/user-attachments/assets/2cc17949-02cc-4f76-845c-f9b15d22474c" />
