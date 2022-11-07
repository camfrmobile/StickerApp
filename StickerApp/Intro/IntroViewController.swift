//
//  IntroViewController.swift
//  StickerApp
//
//  Created by Trần Văn Cam on 07/11/2022.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var widthButtonConstraint: NSLayoutConstraint!
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 25
    }

    @IBAction func actionNextButton(_ sender: UIButton) {
        index += 1
        switch index {
        case 1:
            setupIntro1()
        case 2:
            setupIntro2()
        case 3:
            setupIntro3()
        default:
            let homeVC = HomeViewController()
            present(homeVC, animated: true)
        }
    }
    
    func setupIntro1() {
        view.backgroundColor = #colorLiteral(red: 0.4186902642, green: 0.09940036386, blue: 0.9996766448, alpha: 1)
        introImageView.image = UIImage(named: "intro_1")
        titleLabel.text = "Fun Stickers, 50.000+ Stickers"
        //nextButton.widthAnchor.constraint(equalToConstant: 104).isActive = true
        widthButtonConstraint.constant = 104
    }
    func setupIntro2() {
        view.backgroundColor = #colorLiteral(red: 0.9889518619, green: 0.8661288619, blue: 0.068666704, alpha: 1)
        introImageView.image = UIImage(named: "intro_2")
        titleLabel.text = "Create your favourite stickers"
        //nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        widthButtonConstraint.constant = 207
    }
    func setupIntro3() {
        view.backgroundColor = #colorLiteral(red: 0.9996364713, green: 0.2497695088, blue: 0.6706078053, alpha: 1)
        introImageView.image = UIImage(named: "intro_3")
        titleLabel.text = "prank your friends in iMessags"
        //nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        widthButtonConstraint.constant = 311
    }
}
