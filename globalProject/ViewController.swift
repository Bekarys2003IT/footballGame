//
//  ViewController.swift
//  globalProject
//
//  Created by Bekarys Sandigali on 19.02.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var image:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pawa")
        return image
    }()
    lazy var progress:UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .init(red: 156/255, green: 232/255, blue: 2/255, alpha: 1)
        progress.setProgress(0.3, animated: true)
        return progress
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    func setUI(){
        view.addSubview(progress)
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(190)
            make.width.equalTo(250)
        }
        progress.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(30)
            make.width.equalTo(250)
            make.height.equalTo(10)
            make.centerX.equalToSuperview()
        }
    }
        override func viewDidAppear(_ animated:Bool){
            super.viewDidAppear(animated)
            
            // Delay for 3 seconds, then transition to the next view controller
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "PlayViewController")
                    self.navigationController?.pushViewController(PlayViewController(), animated: true)
                }
                
    }
    
}
