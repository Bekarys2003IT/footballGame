//
//  NameViewController.swift
//  globalProject
//
//  Created by Bekarys Sandigali on 24.02.2024.
//

import UIKit
import SnapKit
class NameViewController: UIViewController {
    lazy var playerNames = ["Lucio", "Ronaldo", "Holland", "Donnarumma","Lewandowski","Mbappe","Messi","Neymar","Vinicius","Leao"]
    let playerImages = ["Lucio", "Ronaldo", "Holland", "Donnarumma","Lewandowski","Mbappe","Messi","Neymar","Vinicius","Leao"]
    
    var players:[(name: String, imageName: String)] = [("Lucio","Lucio"),("Ronaldo","Ronaldo"),("Holland","Holland"),("Donnarumma","Donnarumma"),("Lewandowski","Lewandowski"),("Mbappe","Mbappe"),("Messi","Messi"),("Neymar","Neymar"),("Vinicius","Vinicius"),("Leao","Leao")]
    var currentCorrectPlayer: (name: String, imageName: String)?
    var cashAmount:Int = 150
    var lightButtonPressCount: Int = 0
    let maxLightButtonPressCount: Int = 3
    var bombButtonPressed: Bool = false
    var correctGuessesCount = 0
    let someView:UIView = {
        let view = UIView()
        view.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    lazy var countLabel:UILabel = {
        let label = UILabel()
        label.text = "\(correctGuessesCount)/10"
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
        label.text = "Lucio"
        label.font = .italicSystemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 5
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var playerImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vinicius")
        return image
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
    let firstCardButton:UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(firstButtonTouch), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    let secondCardButton:UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(secondButtonTouch), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    let thirdCardButton:UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(thirdButtonTouch), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    let fourthCardButton:UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(fourthButtonTouch), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
        override func viewDidLoad() {
            super.viewDidLoad()
            self.hideBackButton()
            view.backgroundColor = .white
            setUI()
            setupGame()
            // Do any additional setup after loading the view.
        }
        func setUI(){
            view.addSubview(someView)
            someView.addSubview(countLabel)
            someView.addSubview(backIcon)
            view.addSubview(blackView)
            view.addSubview(bombButton)
            view.addSubview(lightButton)
            view.addSubview(greenView)
            greenView.addSubview(cashLabel)
            greenView.addSubview(moneyImage)
            view.addSubview(totalView)
            blackView.addSubview(blackLabel)
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
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.centerX.equalToSuperview()
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
        func setupGame() {
            var shuffledForButtons = players.shuffled()

               // Randomly select the correct player from shuffled players
               guard let randomCorrectPlayerIndex = shuffledForButtons.indices.randomElement() else { return }
               let correctPlayer = shuffledForButtons[randomCorrectPlayerIndex]

               // Update the label with the correct player's name
               blackLabel.text = correctPlayer.name
               currentCorrectPlayer = correctPlayer

               // Randomly select one of the buttons to assign the correct player to
               let correctButtonIndex = Int.random(in: 0..<4) // There are 4 buttons

               // Swap the correct player into the randomly chosen button's position
               shuffledForButtons.swapAt(randomCorrectPlayerIndex, correctButtonIndex)

               // Assign players to buttons
               let buttons = [firstCardButton, secondCardButton, thirdCardButton, fourthCardButton]
               for (index, button) in buttons.enumerated() {
                   let player = shuffledForButtons[index]
                   button.setImage(UIImage(named: player.imageName), for: .normal)
                   button.accessibilityIdentifier = player.name
                   button.backgroundColor = UIColor(red: 37/255, green: 41/255, blue: 44/255, alpha: 1) // Reset to default color
               }
        }
    @objc func buttonPressed(sender: UIButton) {
        guard let correctPlayer = currentCorrectPlayer else { return }
            
            // Compare the pressed button's identifier to the current correct player
            if sender.accessibilityIdentifier == correctPlayer.name {
                // Correct guess
                sender.backgroundColor = .green
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    // Revert button color back to default after a delay
                    sender.backgroundColor = UIColor(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
                    
                    // Increment the correct guesses count and update the label
                    self.correctGuessesCount += 1
                    self.countLabel.text = "\(self.correctGuessesCount)/10"
                    
                    // Check if the player has won the game
                    if self.correctGuessesCount >= 10 {
                        let alert = UIAlertController(title: "Congratulations!", message: "You've correctly guessed all the players!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                            // Reset the game or perform other actions as needed
                        }))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        // Setup the next round only if the game is not won
                        self.setupGame()
                    }
                }
            } else {
                // Incorrect guess
                sender.backgroundColor = .red
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    // Revert button color back to default after a delay
                    sender.backgroundColor = UIColor(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
                    
                    // Reset the correct guesses count and update the label
                    self.correctGuessesCount = 0
                    self.countLabel.text = "\(self.correctGuessesCount)/10"
                    
                    // Show an alert indicating the incorrect guess
                    let alert = UIAlertController(title: "Incorrect", message: "That was not the correct player. Try again!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        // Reset the game setup here after the alert is dismissed
                        self.setupGame()
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
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

            fourthCardButton.tintColor = .white
            
        }
        @objc func secondButtonTouch(){

            fourthCardButton.tintColor = .white
            
        }
        @objc func thirdButtonTouch(){

            fourthCardButton.tintColor = .white
            
        }
        @objc func fourthButtonTouch(){
            firstCardButton.tintColor = .white
            
        }
        
        
    }

