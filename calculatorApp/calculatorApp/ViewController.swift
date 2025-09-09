import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let verticalStackView = UIStackView()
    let operatorSet: Set<String> = ["+", "-", "*", "/", "AC", "="]

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
            let current = label.text ?? "0"

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


