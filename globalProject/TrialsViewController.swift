//
//  TrialsViewController.swift
//  globalProject
//
//  Created by Bekarys Sandigali on 22.02.2024.
//

import UIKit
import SnapKit

class TrialsViewController: UIViewController {
    
    let someView:UIView = {
        let view = UIView()
        view.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    lazy var headerLabel : UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = "TRIALS"
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
    let firstView:UIView = {
        let view=UIView()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    let firstImage:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "trial1")
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    let firstButton:UIButton = {
       let button = UIButton()
        button.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        button.frame = CGRect(x: 50, y: 100, width: 90, height: 130)
        button.setCornerRadius(trailingRadius: 16, bottomTrailingRadius: 16)
        button.addTarget(self, action: #selector(bioTap), for: .touchUpInside)
        return button
    }()
    let firstIcon:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "forward")
        image.tintColor = .black
        return image
    }()
    let firstLabel:UILabel = {
       let label = UILabel()
        label.text = "WHOSE BIOGRAPHY?"
        label.textColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let secondView:UIView = {
        let view=UIView()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    let secondImage:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "trial2")
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    let secondButton:UIButton = {
       let button = UIButton()
        button.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        button.frame = CGRect(x: 50, y: 100, width: 90, height: 130)
        button.setCornerRadius(trailingRadius: 16, bottomTrailingRadius: 16)
        button.addTarget(self, action: #selector(photoTap), for: .touchUpInside)
        return button
    }()
    let secondIcon:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "forward")
        image.tintColor = .black
        return image
    }()
    let secondLabel:UILabel = {
       let label = UILabel()
        label.text = "WHO'S IN THE PHOTO"
        label.textColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    let thirdView:UIView = {
        let view=UIView()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    let thirdImage:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "trial3")
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    let thirdButton:UIButton = {
       let button = UIButton()
        button.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        button.frame = CGRect(x: 50, y: 100, width: 90, height: 130)
        button.addTarget(self, action: #selector(nameTap), for: .touchUpInside)
        button.setCornerRadius(trailingRadius: 16, bottomTrailingRadius: 16)
        return button
    }()
    let thirdIcon:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "forward")
        image.tintColor = .black
        return image
    }()
    let thirdLabel:UILabel = {
       let label = UILabel()
        label.text = "WHOSE NAME?"
        label.textColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    let fourthView:UIView = {
        let view=UIView()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    let fourthImage:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "trial4")
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    let fourthButton:UIButton = {
       let button = UIButton()
        button.backgroundColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        button.frame = CGRect(x: 50, y: 100, width: 90, height: 130)
        button.addTarget(self, action: #selector(trueTap), for: .touchUpInside)
        button.setCornerRadius(trailingRadius: 16, bottomTrailingRadius: 16)
        return button
    }()
    let fourthIcon:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "forward")
        image.tintColor = .black
        return image
    }()
    let fourthLabel:UILabel = {
       let label = UILabel()
        label.text = "TRUE/FALSE"
        label.textColor = .init(red:156/255, green: 232/255, blue: 2/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        self.hideBackButton()
    }
    
    func setUI(){
        view.addSubview(someView)
        someView.addSubview(headerLabel)
        someView.addSubview(backIcon)
        view.addSubview(firstView)
        firstView.addSubview(firstImage)
        firstView.addSubview(firstButton)
        firstButton.addSubview(firstIcon)
        firstImage.addSubview(firstLabel)
        view.addSubview(secondView)
        secondView.addSubview(secondImage)
        secondView.addSubview(secondButton)
        secondButton.addSubview(secondIcon)
        secondImage.addSubview(secondLabel)
        view.addSubview(thirdView)
        thirdView.addSubview(thirdImage)
        thirdView.addSubview(thirdButton)
        thirdButton.addSubview(thirdIcon)
        thirdImage.addSubview(thirdLabel)
        view.addSubview(fourthView)
        fourthView.addSubview(fourthImage)
        fourthView.addSubview(fourthButton)
        fourthButton.addSubview(fourthIcon)
        fourthImage.addSubview(fourthLabel)
        
        
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
        firstView.snp.makeConstraints { make in
            make.top.equalTo(someView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.leading.equalTo(30)
            make.trailing.equalTo(10)
            make.height.equalTo(130)
            make.width.equalTo(400)
        }
        firstImage.snp.makeConstraints { make in
            make.edges.equalTo(firstView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 90))
        }
        firstButton.snp.makeConstraints { make in
            make.edges.equalTo(firstView).inset(UIEdgeInsets(top: 0, left: 250, bottom: 0, right:30 ))
        }
        firstIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(40)
            
        }
        firstLabel.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(15)
        }
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.leading.equalTo(30)
            make.trailing.equalTo(10)
            make.height.equalTo(130)
            make.width.equalTo(400)
        }
        secondImage.snp.makeConstraints { make in
            make.edges.equalTo(secondView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 90))
        }
        secondButton.snp.makeConstraints { make in
            make.edges.equalTo(secondView).inset(UIEdgeInsets(top: 0, left: 250, bottom: 0, right:30 ))
        }
        secondIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(40)
            
        }
        secondLabel.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(15)
        }
        thirdView.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.leading.equalTo(30)
            make.trailing.equalTo(10)
            make.height.equalTo(130)
            make.width.equalTo(400)
        }
        thirdImage.snp.makeConstraints { make in
            make.edges.equalTo(thirdView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 90))
        }
        thirdButton.snp.makeConstraints { make in
            make.edges.equalTo(thirdView).inset(UIEdgeInsets(top: 0, left: 250, bottom: 0, right:30 ))
        }
        thirdIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(40)
            
        }
        thirdLabel.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(15)
        }
        fourthView.snp.makeConstraints { make in
            make.top.equalTo(thirdView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.leading.equalTo(30)
            make.trailing.equalTo(10)
            make.height.equalTo(130)
            make.width.equalTo(400)
        }
        fourthImage.snp.makeConstraints { make in
            make.edges.equalTo(fourthView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 90))
        }
        fourthButton.snp.makeConstraints { make in
            make.edges.equalTo(fourthView).inset(UIEdgeInsets(top: 0, left: 250, bottom: 0, right:30 ))
        }
        fourthIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(40)
            
        }
        fourthLabel.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(15)
        }
        
        
    }
    @objc func backsTap(){
       navigationController?.pushViewController(PlayViewController(), animated: true)
    }
    @objc func bioTap(){
        navigationController?.pushViewController(AnswerViewController(), animated: true)
    }
    @objc func photoTap(){
        navigationController?.pushViewController(PhotoViewController(), animated: true)
    }
    @objc func nameTap(){
        navigationController?.pushViewController(NameViewController(), animated: true)
    }
    @objc func trueTap(){
        navigationController?.pushViewController(TrueFalseViewController(), animated: true)
    }
    
}
extension UIButton {
    func setCornerRadius(trailingRadius: CGFloat, bottomTrailingRadius: CGFloat) {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX - trailingRadius, y: bounds.minY))
        path.addArc(withCenter: CGPoint(x: bounds.maxX - trailingRadius, y: bounds.minY + trailingRadius),
                    radius: trailingRadius,
                    startAngle: CGFloat(-Double.pi / 2),
                    endAngle: 0,
                    clockwise: true)
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY - bottomTrailingRadius))
        path.addArc(withCenter: CGPoint(x: bounds.maxX - bottomTrailingRadius, y: bounds.maxY - bottomTrailingRadius),
                    radius: bottomTrailingRadius,
                    startAngle: 0,
                    endAngle: CGFloat(Double.pi / 2),
                    clockwise: true)
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.close()
        
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
    
}


