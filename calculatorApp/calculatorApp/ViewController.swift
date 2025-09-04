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
        label.text = "12345"
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
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.top.equalTo(label.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
        // === 버튼안에 들어갈 gridTitles ===
        let gridTitles: [[String]] = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3",  "*"],
            ["AC", "0", "=", "/"]
        ]
        
        // rowTitles는 gridTitles의 가로한줄
        for rowTitles in gridTitles {
            let buttons = rowTitles.map { title in
                let bg = operatorSet.contains(title) ? .systemOrange : UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                return makeButton(titleValue: title, backgroundColor: bg)
            }
            let row = makeHorizontalStackView(buttons)
            
            row.snp.makeConstraints { make in
                make.height.equalTo(80)
            }
            
            verticalStackView.addArrangedSubview(row)
        }
    }
    
    // LV2 과제힌트: [UIView] → UIStackView
    // [UIView] 배열을 받아서 UIStackView 안에 넣어서 가로로 나열한 뒤에 그 스택뷰를 리턴한다.
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.backgroundColor = .black
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
    
    // 버튼 생성 함수
    private func makeButton(titleValue: String, action: Selector? = nil, backgroundColor: UIColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)) -> UIButton {
        
        let b = UIButton(type: .system)
        b.setTitle(titleValue, for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 30)
        b.backgroundColor = backgroundColor // 전달받은 배경색 사용
        b.layer.cornerRadius = 4
        
        b.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
    
        return b
    }
}

