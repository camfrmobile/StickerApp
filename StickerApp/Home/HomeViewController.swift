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
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    var menus: [Menu] = getMenus()
    
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
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        menuCollectionView.showsVerticalScrollIndicator = false
        menuCollectionView.showsHorizontalScrollIndicator = false
        
        menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCollectionViewCell")
        
        menuCollectionView.backgroundColor = .clear
        
        if let collectionViewFlowLayout = menuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewFlowLayout.scrollDirection = .horizontal
        }
        
        menuCollectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)

    }
    
    @IBAction func actionNextMenu(_ sender: UIButton) {
        var index = 0
        for i in 0..<menus.count {
            if menus[i].isActive {
                menus[i].isActive = false
                index = i + 1
            }
        }
        
        if index == menus.count {
            index = 0
        }
        
        menus[index].isActive = true
        
        menuCollectionView.reloadData()
        
        menuCollectionView.setContentOffset(CGPoint(x: -24 + (100 + 10) * index, y: 0), animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        
        cell.menu = menus[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        for i in 0..<menus.count {
            menus[i].isActive = (i==indexPath.row)
        }
        collectionView.reloadData()
        
        menuCollectionView.setContentOffset(CGPoint(x: -24 + (100 + 10) * indexPath.row, y: 0), animated: true)
    }
    
}
