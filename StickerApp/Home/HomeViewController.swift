//
//  HomeViewController.swift
//  StickerApp
//
//  Created by Trần Văn Cam on 07/11/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var cricleView: UIView!
    @IBOutlet weak var nextMenuButton: UIButton!
    @IBOutlet weak var firstCenterView: UIView!
    @IBOutlet weak var secondCenterView: UIView!
    @IBOutlet weak var addNewButton: UIButton!
    @IBOutlet weak var activeLeftView: UIView!
    @IBOutlet weak var activeRightView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {
        cricleView.clipsToBounds = true
        cricleView.layer.cornerRadius = cricleView.bounds.width / 2
        nextMenuButton.clipsToBounds = true
        nextMenuButton.layer.cornerRadius = 18
        
        firstCenterView.clipsToBounds = true
        firstCenterView.layer.cornerRadius = 40
        secondCenterView.clipsToBounds = true
        secondCenterView.layer.cornerRadius = 40
        addNewButton.clipsToBounds = true
        addNewButton.layer.cornerRadius = addNewButton.bounds.width / 2
        activeLeftView.clipsToBounds = true
        activeLeftView.layer.cornerRadius = 2.5
        activeRightView.clipsToBounds = true
        activeRightView.layer.cornerRadius = 2.5
    }
}
