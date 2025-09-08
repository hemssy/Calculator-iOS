# CalculatorApp
## [fix/#19] Swift로 계산기 앱 만들기

### 트러블슈팅

과제힌트 주석의 설명대로, 잘못된 형식의 수식을 `NSExpression(format:)`에 넣으면 동작하지 않는다(런타임 예외 발생 가능).

`1++2`, `1+2+` 등 연산자가 연속되거나 연산자로 끝나는 수식을 예외처리해보자!

입력 단계에서 연산자가 연속되면 두 번째 연산자는 무시한다.(1++2 처리)

계산 단계에서 수식의 마지막 문자가 연산자면 한글자를 제거한 후 `NSExpression(format:)`에 넣는다. (1+2+ 처리)
```swift
@objc private func buttonClicked(_ sender: UIButton) {
        
        guard let title = sender.currentTitle else { return }
        
        // 1. AC 처리
        if title == "AC" {
            resetCalculator()
            return
        }
        
        // 2. = 처리
        if title == "=" {
            var exp = label.text ?? "0"
            
            // 끝이 연산자면 하나 제거하기
            if let last = exp.last, "+-*/".contains(last) {
                exp.removeLast()
            }
            
            if let result = calculate(expression: exp) {
                label.text = "\(result)"
            } else {
                label.text = "0"
            }
            return
        }
        
        // 3. 연산자 처리
        if "+-*/".contains(title) {
            var current = label.text ?? "0"

            // 맨 앞이 "0"이면 연산자로 시작하지 않음
            if current == "0" { return }

            // 끝이 이미 연산자면 첫번째것만 남김
            if let last = current.last, "+-*/".contains(last) {
                return
            }

            // 아니면 붙이기
            label.text = current + title
            return
        }

        
        
        // 4. 숫자 처리
        label.text = (label.text ?? "") + title
        noFirstZero()
        
    }
```
