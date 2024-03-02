//
//  TrueFalseViewController.swift
//  globalProject
//
//  Created by Bekarys Sandigali on 24.02.2024.
//

import UIKit
import SnapKit
class TrueFalseViewController: UIViewController {
    lazy var playerNames:[String:String] = [
        "Lucio":"is a Brazilian footballer born on 8 May 1978 in Pernambuco. He was known for his charisma and strength on the pitch, and also occupied the position of centre-back.",
        "Ronaldo":" is a Portuguese footballer, born on 5 February 1985 on the island of Madeira. He is considered one of the best footballers in history and is known for his speed, skill and goal instinct.",
        "Holland":"is a Norwegian footballer, born on 21 July 2000 in Liederhaugen. He is one of the brightest young stars in the world of football and is known for his physicality, speed and incredible goalscoring ability.",
        "Donnarumma":" is an Italian footballer, born on 25 February 1999 in Castiglione del Lago. He is one of the most talented goalkeepers in the world and is known for his reflexes, confidence and ability to make great saves.",
        "Lewandowski":"is a Polish footballer, born on 21 August 1988 in Warsaw. He is considered one of the best strikers in the world and is known for his goal-scoring skills, aerial ability and ability to finish off attacks.",
        "Mbappe":" is a French footballer born on 20 December 1998 in Bondi. He is one of the brightest young talents in the world of football and is known for his quickness, agility and ability to score goals.",
        "Messi":"is an Argentine footballer, born on 24 June 1987 in Rosario. He is considered one of the greatest footballers of all time and is known for his incredible technique, ball skills and ability to create chances.",
        "Neymar":" is a Brazilian footballer, born on 5 February 1992 in Mogi das Cruzis. He is one of the most technical and creative players in the world and is known for his feinting, ability to create chances and goal scoring ability.",
        "Vinicius":"is a Brazilian footballer born on 12 July 2000 in São Gonçalo, Rio de Janeiro. He is one of the most promising young players and is known for his speed, agility and attacking potential.",
        "Leao":"is a Portuguese footballer, born on 10 June 1999 in Almada. He is known for his physicality, strength and speed, as well as his ability to score goals and cause problems for defenders."]
    var correctGuessesCount = 0
    var currentKey:String?
    var currentValue:String?
    let someView:UIView = {
        let view = UIView()
        view.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    lazy var countLabel:UILabel = {
        let label = UILabel()
        label.text = "\(self.correctGuessesCount)/10"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    let backIcon:UIButton = {
        let icon = UIButton()
        icon.setImage(UIImage(named: "back"), for: .normal)
        icon.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        return icon
    }()
    
    let blackView:UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    let blackLabel:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25,weight: .bold)
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    let infoLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .italicSystemFont(ofSize: 15)
        label.numberOfLines = 5
        label.lineBreakMode = .byWordWrapping
        return label
        
    }()
    let totalView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let firstCardButton:UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitle("True", for: .normal)
        button.backgroundColor = .init(red: 156/255, green: 232/255, blue: 2/255, alpha: 1)
        button.addTarget(self, action: #selector(buttonsPress), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    let secondCardButton:UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitle("False", for: .normal)
        button.backgroundColor = .init(red: 255/255, green: 121/255, blue: 0/255, alpha: 1)
        button.addTarget(self, action: #selector(buttonsPress), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideBackButton()
        view.backgroundColor = .white
        setUI()
        set()
    }
    func setUI(){
        view.addSubview(someView)
        someView.addSubview(countLabel)
        someView.addSubview(backIcon)
        view.addSubview(blackView)
        view.addSubview(totalView)
        blackView.addSubview(blackLabel)
        blackView.addSubview(infoLabel)
        totalView.addSubview(firstCardButton)
        totalView.addSubview(secondCardButton)
        //constraint
        someView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(450)
        }
        countLabel.snp.makeConstraints { make in
            make.bottom.equalTo(someView).inset(10)
            make.centerX.equalToSuperview()
        }
        backIcon.snp.makeConstraints { make in
            make.bottom.equalTo(someView).inset(5)
            make.leading.equalTo(someView.snp.leading).inset(35)
            make.height.width.equalTo(40)
        }
        blackView.snp.makeConstraints { make in
            make.top.equalTo(someView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(520)
            make.width.equalTo(350)
            
        }
        blackLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(blackLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            
        }
        totalView.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(350)
        }
        firstCardButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(160)
        }
        secondCardButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.top.trailing.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(160)
        }
        firstCardButton.tag = 1
        secondCardButton.tag = 2
        
    }
    @objc func backTap(){
        navigationController?.pushViewController(TrialsViewController(), animated: true)
    }
    func set(){
       
        guard let randomKey = playerNames.keys.randomElement() else { return }
        guard let randomValue = playerNames.values.randomElement() else { return }
        currentKey = randomKey
        currentValue = randomValue
        blackLabel.text = randomKey
        infoLabel.numberOfLines = 5
        infoLabel.lineBreakMode = .byWordWrapping // Wrap by words
        infoLabel.text = playerNames[currentKey ?? ""] // Set the initial text
        view.layoutIfNeeded()

        
    }
    @objc func buttonsPress(sender:UIButton){
        guard let key = blackLabel.text, let value = infoLabel.text else { return }

            // Check if the labels' texts match the current key-value pair
            let isMatchCorrect = (key == currentKey && value == currentValue)

            if sender.tag == 1 && isMatchCorrect {
                // Correct key-value pair and "True" button pressed
                
                self.correctGuessesCount += 1
                self.countLabel.text = "\(self.correctGuessesCount)/10"
                set()
            } else if sender.tag == 2 && !isMatchCorrect {
                // Incorrect key-value pair and "False" button pressed
                self.correctGuessesCount += 1
                self.countLabel.text = "\(self.correctGuessesCount)/10"
                set()
            } else {
            let alert = UIAlertController(title: "Incorrect", message: "Starting over!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                // Logic to restart the game or load the next question
            }))
            // Present the alert; assuming 'self' is a UIViewController
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
            // Incorrect guess, reset count and show alert
                self.correctGuessesCount = 0
                self.countLabel.text = "\(self.correctGuessesCount)/10"
                set()
                
        }
        if self.correctGuessesCount == 10 {
                // Game is won, show an alert
                let alert = UIAlertController(title: "Congratulations!", message: "You've correctly guessed all the players!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }
        self.set() 
    }
}
