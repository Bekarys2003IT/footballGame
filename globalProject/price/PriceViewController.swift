//
//  PriceViewController.swift
//  globalProject
//
//  Created by Bekarys Sandigali on 24.02.2024.
//

import UIKit

class PriceViewController: UIViewController {
    
    let someView:UIView = {
        let view = UIView()
        view.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    lazy var headerLabel : UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = "PRICES"
        headerLabel.textColor = .black
        headerLabel.textAlignment = .center
        headerLabel.font = .systemFont(ofSize: 30,weight: .bold)
        
        headerLabel.textAlignment = .center
        return headerLabel
    }()
    let backIcon:UIButton = {
        let icon = UIButton()
        icon.setImage(UIImage(named: "back"), for: .normal)
        icon.addTarget(self, action: #selector(backsTap), for: .touchUpInside)
        return icon
    }()
    lazy var blackView :UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    let infoLabel:UILabel = {
        let label = UILabel()
        label.text = "INFORMATION"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    let activLabel:UILabel = {
        let label = UILabel()
        label.text = "Actively answer questions to earn more money"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14,weight: .regular)
        return label
    }()
    let priceBomb:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "priceBomb")
        return image
    }()
    let priceLamp:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "priceLamp")
        return image
    }()
    let dailyLabel:UILabel = {
        let label = UILabel()
        label.text = "DAILY BONUS"
        label.textColor = .init(red: 127/255, green: 27/255, blue: 236/255, alpha: 1)
        label.font = .systemFont(ofSize: 22, weight: .black)
        return label
    }()
    lazy var wheelImageView:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fortune")
        return image
    }()
    let spinButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(spinButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideBackButton()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setUI()
        
        
    }
    
    func setUI(){
        view.addSubview(someView)
        someView.addSubview(headerLabel)
        someView.addSubview(backIcon)
        view.addSubview(blackView)
        blackView.addSubview(infoLabel)
        blackView.addSubview(activLabel)
        view.addSubview(priceBomb)
        view.addSubview(priceLamp)
        view.addSubview(dailyLabel)
        view.addSubview(wheelImageView)
        view.addSubview(spinButton)
        
        
        //constraints
        someView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(450)
        }
        headerLabel.snp.makeConstraints { make in
            make.bottom.equalTo(someView).inset(5)
            make.centerX.equalToSuperview()
        }
        backIcon.snp.makeConstraints { make in
            make.bottom.equalTo(someView).inset(5)
            make.leading.equalTo(someView.snp.leading).inset(35)
            make.height.width.equalTo(40)
        }
        blackView.snp.makeConstraints { make in
            make.top.equalTo(someView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(350)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(15)
            
        }
        activLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(15)
            make.leading.equalTo(15)
        }
        priceBomb.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(80)
        }
        priceLamp.snp.makeConstraints { make in
            make.top.equalTo(priceBomb.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(80)
        }
        dailyLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLamp.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        wheelImageView.snp.makeConstraints { make in
            make.top.equalTo(dailyLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(250)
            make.width.equalTo(300)
        }
        spinButton.snp.makeConstraints { make in
            make.centerX.equalTo(wheelImageView.snp.centerX)
            make.centerY.equalTo(wheelImageView.snp.centerY)
        }
        
        
        
    }
    @objc func spinButtonPressed(_ sender: UIButton) {
        // Define an array of prizes
            let prizes = ["1 LAMP", "2 LAMPS", "1 BOMB", "3 LAMPS", "1 TRUMP", "3 LAMPS"]

            // Generate a random index
            let randomIndex = Int(arc4random_uniform(UInt32(prizes.count)))
            let prize = prizes[randomIndex]

            // Create the alert controller
            let alert = UIAlertController(title: "Congratulations!", message: "You've won \(prize)!", preferredStyle: .alert)

            // Add an action to the alert
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            // Present the alert
            DispatchQueue.main.async { [weak self] in
                self?.present(alert, animated: true, completion: nil)
            }
    }
    @objc func backsTap(){
        navigationController?.pushViewController(PlayViewController(), animated: true)
    }
    
}
