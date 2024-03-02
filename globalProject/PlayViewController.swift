import UIKit
import SnapKit
class PlayViewController: UIViewController {
    
    let icon:UIButton = {
        let image = UIButton()
        image.setImage(UIImage(named: "settings"), for: .normal)
        image.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        image.contentMode = .scaleAspectFit
        return image
    }()
    let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "PAWA"
            label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
            label.textAlignment = .center
            return label
        }()
    let titleLabel2: UILabel = {
            let label = UILabel()
            label.text = "QUIZ"
            label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
            label.textAlignment = .center
            return label
        }()
        
        let subtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Ready to put your football knowledge to the test now?"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16,weight: .semibold)
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        
        let playButton: UIButton = {
            let button = UIButton()
            button.setTitle("PLAY", for: .normal)
            button.addTarget(self, action: #selector(play), for: .touchUpInside)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 22 // Half of the height to make it a pill shape
            return button
        }()
        
        let pricesButton: UIButton = {
            let button = UIButton()
            button.setTitle("PRICES", for: .normal)
            button.backgroundColor = .clear
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 22 // Half of the height to make it a pill shape
            return button
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 156/255, green: 232/255, blue: 2/252, alpha: 1)
        setUI()
        self.hideBackButton()
        // Do any additional setup after loading the view.
    }
    func setUI(){
        view.addSubview(icon)
        view.addSubview(titleLabel)
        view.addSubview(titleLabel2)
        view.addSubview(subtitleLabel)
        view.addSubview(playButton)
        view.addSubview(pricesButton)
        
        //constraints
        icon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(60)
            make.height.width.equalTo(30)
        }
        titleLabel.snp.makeConstraints { make in
                    make.top.equalTo(icon.snp.bottom).offset(100)
                    make.centerX.equalToSuperview()
                }
        titleLabel2.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(1)
            make.centerX.equalToSuperview()
        }
                
                subtitleLabel.snp.makeConstraints { make in
                    make.top.equalTo(titleLabel2.snp.bottom).offset(40)
                    make.centerX.equalToSuperview()
                    make.left.right.equalToSuperview().inset(20)
                }
                
                playButton.snp.makeConstraints { make in
                    make.top.equalTo(subtitleLabel.snp.bottom).offset(40)
                    make.centerX.equalToSuperview()
                    make.height.equalTo(50)
                    make.left.right.equalToSuperview().inset(50)
                }
                
                pricesButton.snp.makeConstraints { make in
                    make.top.equalTo(playButton.snp.bottom).offset(20)
                    make.centerX.equalToSuperview()
                    make.height.equalTo(50)
                    make.left.right.equalToSuperview().inset(50)
                }
    }
    @objc func play(){
        navigationController?.pushViewController(TrialsViewController(), animated: true)
    }
    @objc func openSettings(){
        navigationController?.pushViewController(OptionViewController(), animated: true)
                
    }
    
}
extension UIViewController {
    func hideBackButton() {
        self.navigationItem.hidesBackButton = true
    }
}
