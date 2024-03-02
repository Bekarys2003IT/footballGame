//
//  AnswerViewController.swift
//  globalProject
//
//  Created by Bekarys Sandigali on 22.02.2024.
//

import UIKit
import SnapKit
class AnswerViewController: UIViewController {
    var cashAmount:Int = 150
    var lightButtonPressCount: Int = 0
    let maxLightButtonPressCount: Int = 3
    var bombButtonPressed: Bool = false
    var correctPlayerName: String?
    var currentCount = 0
    var players = ["Lucio", "Ronaldo", "Haaland", "Donnarumma", "Vinicius", "Messi", "Mbappe", "Neymar", "Leao", "Lewandowski"]
    let information = ["Lucio is a Brazilian footballer born on 8 May 1978 in Pernambuco. He was known for his charisma and strength on the pitch, and also occupied the position of centre-back.","Cristiano Ronaldo is a Portuguese footballer, born on 5 February 1985 on the island of Madeira. He is considered one of the best footballers in history and is known for his speed, skill and goal instinct.","Erling Haaland is a Norwegian footballer, born on 21 July 2000 in Liederhaugen. He is one of the brightest young stars in the world of football and is known for his physicality, speed and incredible goalscoring ability.","Gianluigi Donnarumma is an Italian footballer, born on 25 February 1999 in Castiglione del Lago. He is one of the most talented goalkeepers in the world and is known for his reflexes, confidence and ability to make great saves.","Vinicius Júnior is a Brazilian footballer born on 12 July 2000 in São Gonçalo, Rio de Janeiro. He is one of the most promising young players and is known for his speed, agility and attacking potential.","Lionel Messi is an Argentine footballer, born on 24 June 1987 in Rosario. He is considered one of the greatest footballers of all time and is known for his incredible technique, ball skills and ability to create chances.","Kylian Mbappe is a French footballer born on 20 December 1998 in Bondi. He is one of the brightest young talents in the world of football and is known for his quickness, agility and ability to score goals.","Neymar Júnior is a Brazilian footballer, born on 5 February 1992 in Mogi das Cruzis. He is one of the most technical and creative players in the world and is known for his feinting, ability to create chances and goal scoring ability.","Rafael Leao is a Portuguese footballer, born on 10 June 1999 in Almada. He is known for his physicality, strength and speed, as well as his ability to score goals and cause problems for defenders.","Robert Lewandowski is a Polish footballer, born on 21 August 1988 in Warsaw. He is considered one of the best strikers in the world and is known for his goal-scoring skills, aerial ability and ability to finish off attacks."]
    let someView:UIView = {
        let view = UIView()
        view.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    lazy var countLabel:UILabel = {
        let label = UILabel()
        label.text = "\(currentCount)/10"
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
    lazy var blackLabel:UILabel = {
       let label = UILabel()
        label.text = "\(information.randomElement())"
        label.font = .italicSystemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 5
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var  bombButton:UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "bomb"), for: .normal)
        button.addTarget(self, action: #selector(bombFunc), for: .touchUpInside)
        return button
    }()
    lazy var  lightButton:UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "light"), for: .normal)
        button.addTarget(self, action: #selector(lightFunc), for: .touchUpInside)
        return button
    }()
    let greenView:UIView = {
       let view = UIView()
        view.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    lazy var cashLabel:UILabel = {
       let label = UILabel()
        label.text = "\(cashAmount)"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    let moneyImage:UIImageView = {
       let image = UIImageView()
        image.image = .init(named: "cash")
        return image
    }()
    let totalView:UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var firstCardButton:UIButton = {
       let button = UIButton()
        button.setTitle("\(players.randomElement())", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(firstButtonTouch), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    lazy var secondCardButton:UIButton = {
        let button = UIButton()
        button.setTitle("\(players.randomElement())", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(secondButtonTouch), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    lazy var thirdCardButton:UIButton = {
        let button = UIButton()
        button.setTitle("\(players.randomElement())", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(thirdButtonTouch), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    lazy var fourthCardButton:UIButton = {
        let button = UIButton()
        button.setTitle("\(players.randomElement())", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(fourthButtonTouch), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUI()
        updateGameContent()
        self.hideBackButton()
    }
    
    func setUI(){
        view.addSubview(someView)
        someView.addSubview(countLabel)
        someView.addSubview(backIcon)
        view.addSubview(blackView)
        blackView.addSubview(blackLabel)
        view.addSubview(bombButton)
        view.addSubview(lightButton)
        view.addSubview(greenView)
        greenView.addSubview(cashLabel)
        greenView.addSubview(moneyImage)
        view.addSubview(totalView)
        totalView.addSubview(firstCardButton)
        totalView.addSubview(secondCardButton)
        totalView.addSubview(thirdCardButton)
        totalView.addSubview(fourthCardButton)
        
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
            make.height.equalTo(250)
            make.width.equalTo(350)
            
        }
        blackLabel.snp.makeConstraints { make in
            make.edges.equalTo(blackView).inset(UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40))
        }
        bombButton.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        lightButton.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.bottom).offset(20)
            make.leading.equalTo(bombButton.snp.trailing).offset(20)
        }
        greenView.snp.makeConstraints { make in
            make.top.equalTo(blackView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset (20)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        cashLabel.snp.makeConstraints { make in
            make.leading.equalTo(greenView.snp.leading).offset(10)
            make.top.equalTo(greenView.snp.top).offset(10)
        }
        moneyImage.snp.makeConstraints { make in
            make.top.equalTo(greenView.snp.top)
            make.trailing.equalTo(greenView.snp.trailing).offset(-15)
        }
        totalView.snp.makeConstraints { make in
            make.top.equalTo(bombButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(190)
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
        thirdCardButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(160)
        }
        fourthCardButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(160)
        }
        
    }
    
    
    
    @objc func backTap(){
        navigationController?.pushViewController(TrialsViewController(), animated: true)
    }
    @objc func bombFunc(){
        guard !bombButtonPressed else { return }
               
        let cardButtons: [UIButton] = [firstCardButton, secondCardButton, thirdCardButton, fourthCardButton]
            guard cardButtons.contains(where: { $0.superview != nil }) else { return }
            
                   cashAmount -= 20
                   cashLabel.text = "\(cashAmount)"
                   
                   let buttons: [UIButton] = [secondCardButton, thirdCardButton, fourthCardButton]
                   let buttonsToRemove = buttons.shuffled().prefix(2) // Randomly select 2 buttons to remove
                   for buttonToRemove in buttonsToRemove {
                       buttonToRemove.removeFromSuperview()
                   }
                   
                   bombButtonPressed = true
               
    }
    
    @objc func lightFunc(){
        guard lightButtonPressCount < maxLightButtonPressCount else { return }
        let cardButtons: [UIButton] = [firstCardButton, secondCardButton, thirdCardButton, fourthCardButton]
        guard cardButtons.contains(where: { $0.superview != nil }) else { return }
        guard cashAmount >= 10, cashAmount > 120 else { return }
            cashAmount -= 10
            cashLabel.text = "\(cashAmount)"
            let buttons: [UIButton] = [secondCardButton, thirdCardButton, fourthCardButton]
            guard !buttons.isEmpty else {
                return
            }
            
            // Generate a random index
            let randomIndex = Int.random(in: 0..<buttons.count)
            
            // Remove the button at the random index
            let buttonToRemove = buttons[randomIndex]
            buttonToRemove.removeFromSuperview()
    }
    
    @objc func firstButtonTouch(){
        handleButtonTap(firstCardButton)
    }
    @objc func secondButtonTouch(){
        handleButtonTap(secondCardButton)
    }
    @objc func thirdButtonTouch(){
        handleButtonTap(thirdCardButton)
    }
    @objc func fourthButtonTouch(){
        handleButtonTap(fourthCardButton)
    }
    func updateGameContent() {
        // Randomize the information for the new round
        blackLabel.text = information.randomElement()
           
           // Shuffle players
           var shuffledPlayers = players.shuffled()
           
           // Find a player whose name is mentioned in the blackLabel's text
           if let mentionedPlayer = shuffledPlayers.first(where: { blackLabel.text?.contains($0) == true }) {
               correctPlayerName = mentionedPlayer
           } else {
               // If no player's name is mentioned, just pick the first one as the correct answer
               correctPlayerName = shuffledPlayers.first
           }
           
           // Assign shuffled player names to the buttons
           firstCardButton.setTitle(shuffledPlayers[0], for: .normal)
           secondCardButton.setTitle(shuffledPlayers[1], for: .normal)
           thirdCardButton.setTitle(shuffledPlayers[2], for: .normal)
           fourthCardButton.setTitle(shuffledPlayers[3], for: .normal)
           
           // Ensure one randomly selected button matches the blackLabel content
           let correctButtonIndex = Int.random(in: 0...3)
           let buttons = [firstCardButton, secondCardButton, thirdCardButton, fourthCardButton]
           buttons[correctButtonIndex].setTitle(correctPlayerName, for: .normal)
           
           countLabel.text = "\(currentCount)/10"
        }

    @objc func handleButtonTap(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        if blackLabel.text?.contains(title) == true {
            // Correct Answer
            sender.backgroundColor = UIColor(red: 156/255, green: 232/255, blue: 2/255, alpha: 1)
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                sender.backgroundColor = UIColor(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
                
                if self.currentCount == 10 {
                    // Game won
                    self.showWinAlert()
                } else {
                    // Continue game
                    self.currentCount += 1
                    self.countLabel.text = "\(self.currentCount)/10"
                    self.updateGameContent()
                }
            }
        } else {
            // Incorrect Answer
            sender.backgroundColor = UIColor(red: 255/255, green: 121/255, blue: 0/255, alpha: 1)
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                sender.backgroundColor = UIColor(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
                self.showRestartAlert()
            }
        }
    }
    func showWinAlert() {
            let alert = UIAlertController(title: "Congratulations!", message: "You've correctly answered all questions!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default) { _ in
                self.restartGame()
            })
            present(alert, animated: true)
        }
    func showRestartAlert() {
            let alert = UIAlertController(title: "Incorrect", message: "Would you like to restart?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default) { _ in
                self.restartGame()
            })
            present(alert, animated: true)
        }
        
        func restartGame() {
            currentCount = 0
            updateGameContent()
        }
    
}




