import UIKit
import SnapKit


enum CalculatorKey: String, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case clear = "AC"
    case equal = "="
}



class ViewController: UIViewController {
    
    let label = UILabel()
    let verticalStackView = UIStackView()
    let operatorArray: [String] = CalculatorKey.allCases.map { $0.rawValue }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        
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
            if let last = exp.last, isOperatorChar(last) {
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
        if isOperator(title) {
            let current = label.text ?? "0"
            if current == "0" { return }
            if let last = current.last, isOperatorChar(last) {
                return
            }
            label.text = current + title
            return
        }


        // 4. 숫자 처리
        label.text = (label.text ?? "") + title
        noFirstZero()
        
    }
    
    private func resetCalculator() {
        label.text = "0"
    }
    
    private func noFirstZero() {
        guard var text = label.text else { return }
        
        if text.count > 1 && text.first == "0" {
            while text.count > 1 && text.first == "0" {
                text.removeFirst()
            }
        }
        
        label.text = text
    }
    
}


func isOperator(_ s: String) -> Bool {
    return [CalculatorKey.add.rawValue,
            CalculatorKey.subtract.rawValue,
            CalculatorKey.multiply.rawValue,
            CalculatorKey.divide.rawValue].contains(s)
}


func isOperatorChar(_ c: Character) -> Bool {
    return isOperator(String(c))
}

