//
//  PhotoViewController.swift
//  globalProject
//
//  Created by Bekarys Sandigali on 24.02.2024.
//

import UIKit
import SnapKit
class PhotoViewController: UIViewController {
    var cashAmount:Int = 150
    var lightButtonPressCount: Int = 0
    let maxLightButtonPressCount: Int = 3
    var bombButtonPressed: Bool = false
    var correctPlayerName: String?
    let players: [String: String] = [
        "Charlton": "charlton",
        "Cruyff": "cruyff",
        "Maldini": "maldini",
        "Mane": "mane",
        "Muller": "muller",
        "Pele":"pele",
        "Prinz":"prinz",
        "Puskas":"puskas",
        "Ronaldinho":"ronaldinho",
        "Ronaldo":"ronaldo",
        "Yashin":"yashin",
        "Zidane":"zidane"
    ]
    var currentCount = 0
    
    let someView:UIView = {
        let view = UIView()
        view.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    lazy var countLabel:UILabel = {
        let label = UILabel()
        label.text = "\(currentCount)/12"
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
    let playerImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "zidane")
        return image
    }()
    lazy var bombButton:UIButton = {
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
        button.setTitle("Lucio", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(firstButtonTouch), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    let secondCardButton:UIButton = {
        let button = UIButton()
        button.setTitle("Cristiano Ronaldo", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(secondButtonTouch), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    let thirdCardButton:UIButton = {
        let button = UIButton()
        button.setTitle("Eriling Holand", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(red: 37/255, green: 41/255, blue: 44/255, alpha: 1)
        button.addTarget(self, action: #selector(thirdButtonTouch), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    let fourthCardButton:UIButton = {
        let button = UIButton()
        button.setTitle("Vinicius Junior", for: .normal)
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
        
        self.hideBackButton()
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
        blackView.addSubview(playerImage)
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
        playerImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
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
        //        updateImageAndButtonTitles()
        updateContent()
    }
    
    
    @objc func backTap(){
        navigationController?.pushViewController(PlayViewController(), animated: true)
    }
    @objc func bombFunc(){
        guard !bombButtonPressed else { return }
        
        lazy var cardButtons: [UIButton] = [firstCardButton, secondCardButton, thirdCardButton, fourthCardButton]
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
    
    @objc func firstButtonTouch(_ sender:UIButton){
       buttonAction(sender)
        
    }
    
    @objc func secondButtonTouch(_ sender:UIButton){
       buttonAction(sender)
    }
      
    
    @objc func thirdButtonTouch(_ sender:UIButton){
        buttonAction(sender)
        
    }
    @objc func fourthButtonTouch(_ sender:UIButton){
       buttonAction(sender)
    }
    
    func updateCount() {
        let allKeys = Array(players.keys)
           guard let correctPlayer = allKeys.randomElement(), let imageName = players[correctPlayer] else { return }

           playerImage.image = UIImage(named: imageName)
           correctPlayerName = correctPlayer

           var options = allKeys.shuffled().filter { $0 != correctPlayer }
           options = Array(options.prefix(3))
           options.append(correctPlayer)
           options.shuffle()

           for (index, button) in [firstCardButton, secondCardButton, thirdCardButton, fourthCardButton].enumerated() {
               button.setTitle(options[index], for: .normal)
               button.backgroundColor = UIColor(red: 37/255, green: 41/255, blue: 44/255, alpha: 1) // Reset background color
           }
       }
    func resetGame() {
        currentCount = 0
        countLabel.text = "\(currentCount)/12"
        updateContent() // Start the game again
    }
    
    // Function to show an alert for an incorrect answer
    func showRestartAlert() {
        let alert = UIAlertController(title: "Incorrect", message: "That was not the correct answer. Restarting game.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default) { _ in
            self.resetGame()
        })
        present(alert, animated: true)
    }
    func showGameCompletionAlert() {
        let alert = UIAlertController(title: "Congratulations", message: "You have completed the game!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default) { _ in
            self.resetGame()
        })
        present(alert, animated: true)
    }
    func updateContent() {
        let alKeys = Array(players.keys)
        guard let correctKey = alKeys.randomElement(), let correctImageName = players[correctKey] else { return }
        
        playerImage.image = UIImage(named: correctImageName)
        
        var titles = alKeys.shuffled() // Shuffle the keys
        // Ensure the correct key is among the button titles
        if !titles.contains(correctKey) {
            titles.removeLast()
            titles.append(correctKey)
        }
        
        // Assign random titles to buttons
        let buttons = [firstCardButton, secondCardButton, thirdCardButton, fourthCardButton].shuffled()
        for (index, button) in buttons.enumerated() {
            button.setTitle(titles[index], for: .normal)
            // Tag buttons to identify the correct one; 1 for correct, 0 for incorrect
            button.tag = titles[index] == correctKey ? 1 : 0
        }
        let allKeys = Array(players.keys)
        let randomIndex = Int(arc4random_uniform(UInt32(allKeys.count)))
        let selectedPlayer = allKeys[randomIndex]
        
        
        // Set the selected player's image to the UIImageView
        playerImage.image = UIImage(named: players[selectedPlayer] ?? "")
        
        // Shuffle the keys for random button titles
        var shuffledKeys = allKeys.shuffled()
        
        // Ensure the selected player's name is included among the button titles
        if !shuffledKeys.contains(selectedPlayer) {
            shuffledKeys.removeLast()
            shuffledKeys.append(selectedPlayer)
            shuffledKeys.shuffle()
        }
        
        // Assign the shuffled player names to the buttons
        firstCardButton.setTitle(shuffledKeys[0], for: .normal)
        secondCardButton.setTitle(shuffledKeys[1], for: .normal)
        thirdCardButton.setTitle(shuffledKeys[2], for: .normal)
        fourthCardButton.setTitle(shuffledKeys[3], for: .normal)
        
        let playerNames = Array(players.keys)
        guard let randomPlayer = playerNames.randomElement(),
              let imageName = players[randomPlayer] else { return }
        
        /*currentPlayerName = randomPlayer*/ // Update the current player name for comparison in handleButtonPress
        
        // Step 2: Update the image view
        playerImage.image = UIImage(named: imageName)
        
        // Step 3: Update button titles
        var options = playerNames.shuffled().prefix(3) // Get 3 random options
        if !options.contains(randomPlayer) {
            options.removeLast()
            options.append(randomPlayer) // Ensure the correct answer is one of the options
        }
        options.shuffle() // Shuffle again to randomize the position of the correct answer
        
        
        // Step 4: Update the count label
        updateCount()
    }
    @objc func buttonAction(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }

           if title == correctPlayerName {
               // Correct guess
               sender.backgroundColor = .green
               DispatchQueue.main.asyncAfter(deadline: .now()) {
                   sender.backgroundColor = .init(red: 156/255, green: 232/255, blue: 2/255, alpha: 1)
                   self.currentCount += 1
                   self.countLabel.text = "\(self.currentCount)/12"
                   if self.currentCount < 12 {
                       self.updateContent()
                   } else {
                       self.showGameCompletionAlert()
                   }
               }
           } else {
               // Incorrect guess
               sender.backgroundColor = .red
               DispatchQueue.main.asyncAfter(deadline: .now()) {
                   sender.backgroundColor = UIColor(red: 255/255, green: 121/255, blue: 0/255, alpha: 1)
                   self.showRestartAlert()
               }
           }
    }
    
    
}

