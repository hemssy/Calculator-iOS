import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 50, weight:  .bold)
    
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(200)
        }
        
    }


}

