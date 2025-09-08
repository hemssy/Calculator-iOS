# CalculatorApp
## [Lv8] Swift로 계산기 앱 만들기

### 요구사항

등호 (`=`) 버튼을 클릭하면 연산이 수행되도록 구현합니다.

- `1+2+3` 을 입력 후, `=` 을 클릭하면 결과값인 `6` 이 출력되도록 해주세요.
- `123*456` 을 입력 후, `=` 을 클릭하면 결과값인 `56088` 이 출력되도록 해주세요.

> 💡 과제힌트: 연산에 필요한 메서드를 제공해드리겠습니다. 아래의 메서드를 활용해주세요.
    
```swift
/// 수식 문자열을 넣으면 계산해주는 메서드.
///
/// 예를 들어 expression 에 "1+2+3" 이 들어오면 6 을 리턴한다.
/// 잘못된 형식의 수식을 넣으면 앱이 크래시 난다. ex) "1+2++"
    func calculate(expression: String) -> Int? {
    	    let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
```
    
> 주석의 설명대로, 잘못된 형식의 수식을 넣으면 동작하지 않습니다. 예를들어 `1+2++` 라는 수식은 잘못된 수식입니다.
    
### 레벨업 내용

과제힌트로 받은 `calculate()` 메서드를 `Calculator.swift` 로 분리했다.
```swift
func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression) //인스턴스
    if let result = expression.expressionValue(with: nil, context: nil) as? Int {
        return result // 결과값이 Int로 변환 가능하면 반환한다.
    } else {
        return nil // 결과값이 Int로 변환 불가능하면 nil을 반환한다.
    }
}
```

NSExpression은 계산기 등의 연산에 자주 사용되며 문자열을 받아 계산식으로 자동 변환해주는 함수이다. 넘겨받은 문자열을 통째로 읽어서 알아서 연산해주는 클래스라고 보면 된다. 

`calculate` 메서드는 숫자와 연산기호로 이루어진 문자열 `label.text`를 매개변수로 넘겨받아서 NSExpression 클래스를 이용해 계산한 뒤, 그 결과가 `Int`로 변환 가능할 때 결과값을 반환하고 아니면 nil을 반환하는 메서드인 것이다. 

`buttonClicked` 메서드에서는 `if title = “=”`구문을 추가해서  `exp`에 `label.text`를 담고 `calculate()`로 갔다온 결과값을 `result`에 다시 담는 로직을 만들었다.

```swift
    @objc private func buttonClicked(_ sender: UIButton) {
        
        guard let title = sender.currentTitle else { return }
        
        if title == "AC" {
            resetCalculator()
            return
        }
        
        if title == "=" {
            var exp = label.text ?? "0"
            
            if let result = calculate(expression: exp) {
                label.text = "\(result)"
            } else {
                label.text = "0"
            }
            return
        }
        
        label.text = (label.text ?? "") + title
        noFirstZero()
        
    }
```

### 실행화면

