import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let horizontalStackView = UIStackView()

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
        
        // === 버튼 4개 만들기 ===
        let titles = ["7", "8", "9", "+"]
        let buttons = titles.map { makeButton(title: $0) }
        
        // === 스택뷰 생성 ===
        let row = makeHorizontalStackView(buttons) // row는 가로한줄! 스택뷰만들기함수로 생성된 객체 stackView를 row에 담는다.
        view.addSubview(row)
        
        row.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(80)
        }
    }
    
    // 과제힌트: [UIView] → UIStackView
    // [UIView] 배열을 받아서 UIStackView 안에 넣어서 가로로 나열한 뒤에 그 스택뷰를 리턴한다.
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
    
    // 버튼 생성 함수
    private func makeButton(title: String) -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle(title, for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 30)
        b.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        b.layer.cornerRadius = 8
        return b
    }
}

