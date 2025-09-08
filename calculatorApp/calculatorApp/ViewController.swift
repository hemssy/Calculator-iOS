import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let verticalStackView = UIStackView()
    private let operatorSet: Set<String> = ["+", "-", "*", "/", "AC", "="]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        // === 라벨 ===
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(100)
        }
        
        // === 세로 스택뷰 ===
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.top.equalTo(label.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
        // === 버튼 ===
        let gridTitles: [[String]] = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
        ]
        
        for rowTitles in gridTitles {
            let buttons = rowTitles.map { title in
                let bg = operatorSet.contains(title) ? .systemOrange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                return makeButton(titleValue: title, action: #selector(buttonClicked(_:)), backgroundColor: bg)
            }
            let row = makeHorizontalStackView(buttons)
            row.snp.makeConstraints { make in
                make.height.equalTo(80)
            }
            verticalStackView.addArrangedSubview(row)
        }
    }
    
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
    
    private func makeButton(titleValue: String, action: Selector, backgroundColor: UIColor) -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle(titleValue, for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 30)
        b.backgroundColor = backgroundColor
        b.layer.cornerRadius = 40
        b.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        b.addTarget(self, action: action, for: .touchUpInside)
        return b
    }
    
    
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

