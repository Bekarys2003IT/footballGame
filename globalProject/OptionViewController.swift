//
//  OptionViewController.swift
//  globalProject
//
//  Created by Bekarys Sandigali on 20.02.2024.
//

import UIKit
import SnapKit

class OptionViewController: UIViewController {
    //    lazy var navigationItem: UINavigationItem = {
    //        var navigationItem = UINavigationItem()
    //        navigationItem.backAction?.image = .init(named: "back")
    //        navigationItem.title = "Options"
    //        return navigationItem
    //    }()
    //
    //   lazy var navigationBar: UINavigationBar = {
    //     let navigationBar = UINavigationBar()
    //       navigationBar.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
    //       navigationBar.setItems(navigationItem?, animated: false)
    //      return navigationBar
    //   }()
    //
    let musicToggle:UISwitch = {
       let toggle = UISwitch()
        toggle.backgroundColor = .white
        toggle.layer.cornerRadius = 16
        toggle.onTintColor = .green
        return toggle
    }()
    let soundToggle:UISwitch = {
        let toggle = UISwitch()
        toggle.backgroundColor = .white
        toggle.layer.cornerRadius = 16
        toggle.onTintColor = .red
       return toggle
    }()
    
    let someView:UIView = {
        let view = UIView()
        view.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    let backIcon:UIButton = {
        let icon = UIButton()
        icon.setImage(UIImage(named: "back"), for: .normal)
        icon.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        return icon
    }()
                      
//    let backImage:UIImageView = {
//            let image = UIImageView()
//            image.image = UIImage(named: "back")
//            return image
//        }()
    lazy var headerLabel : UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = "OPTIONS"
        headerLabel.textColor = .black
        headerLabel.textAlignment = .center
        headerLabel.font = .systemFont(ofSize: 30,weight: .bold)
        
        headerLabel.textAlignment = .center
        return headerLabel
    }()
    let musView:UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let soundView:UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    lazy var musicLabel:UILabel = {
        let musicLabel = UILabel()
        musicLabel.text = "MUSIC"
        musicLabel.textColor = .white
        return musicLabel
    }()
    lazy var soundLabel:UILabel = {
        let soundLabel = UILabel()
        soundLabel.text = "SOUND"
        soundLabel.textColor = .white
        return soundLabel
    }()
    lazy var privacyPolicyButton:UIButton = {
        let privacyPolicyButton = UIButton()
        privacyPolicyButton.setTitle("PRIVACY POLICY", for: .normal)
        privacyPolicyButton.setTitleColor(.black, for: .normal)
        privacyPolicyButton.backgroundColor = .white
        privacyPolicyButton.layer.borderWidth = 2
        privacyPolicyButton.layer.borderColor = .init(red: 13/255, green: 13/255, blue: 13/255, alpha: 1)
        privacyPolicyButton.layer.cornerRadius = 10
        return privacyPolicyButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.hideBackButton()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    func setUI(){

        view.addSubview(someView)
        view.addSubview(musView)
        view.addSubview(soundView)
        view.addSubview(privacyPolicyButton)
        view.addSubview(soundToggle)
        view.addSubview(musicToggle)
        view.addSubview(headerLabel)
        
        someView.addSubview(headerLabel)
        someView.addSubview(backIcon)
        musView.addSubview(musicToggle)
        musView.addSubview(musicLabel)
        soundView.addSubview(soundToggle)
        soundView.addSubview(soundLabel)
        
        
        //constraint
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
            
        musView.snp.makeConstraints { make in
                make.top.equalTo(someView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
                make.height.equalTo(50)
                make.width.equalTo(350)
        }
        musView.layer.cornerRadius = 10
        musView.layer.masksToBounds = true
            
        musicToggle.snp.makeConstraints { make in
                make.top.equalTo(someView.snp.bottom).offset(50)
            make.trailing.equalTo(musView.snp.trailing).inset(20)
                
        }
        musicLabel.snp.makeConstraints { make in
            make.leading.equalTo(musView.snp.leading).inset(20)
            make.top.equalTo(musView.snp.top).inset(15)
        }
        
        soundView.snp.makeConstraints { make in
            make.top.equalTo(musView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(350)
        }
        soundView.layer.cornerRadius = 10
        soundView.layer.masksToBounds = true
        soundToggle.snp.makeConstraints { make in
                make.top.equalTo(musView.snp.bottom).offset(40)
                make.trailing.equalTo(soundView.snp.trailing).inset(20)
                
        }
        soundLabel.snp.makeConstraints { make in
            make.leading.equalTo(soundView.snp.leading).inset(20)
            make.top.equalTo(soundView.snp.top).inset(15)
        }
            

        musicLabel.snp.makeConstraints { make in
            make.leading.equalTo(musView.snp.leading).inset(20)
            make.top.equalTo(musView.snp.top).inset(15)
        }
        privacyPolicyButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(350)
        }
    }
    @objc func backTap(){
        navigationController?.pushViewController(PlayViewController(), animated: true)
    }
        
        
}

