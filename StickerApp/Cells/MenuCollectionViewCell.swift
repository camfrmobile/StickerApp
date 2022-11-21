//
//  MenuCollectionViewCell.swift
//  StickerApp
//
//  Created by Trần Văn Cam on 21/11/2022.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 2
        return view
    } ()
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    } ()
    
    var menu: Menu? {
        didSet {
            if let menu = menu {
                menuLabel.text = menu.title
                if menu.isActive {
                    containerView.layer.borderColor = hexStringToCGColor(menu.color)
                    containerView.backgroundColor = hexStringToUIColor(menu.color)
                    menuLabel.textColor = .white
                } else {
                    containerView.layer.borderColor = hexStringToCGColor("#AAABBB")
                    containerView.backgroundColor = .white
                    menuLabel.textColor = hexStringToUIColor("#AAABBB")
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        containerView.addSubview(menuLabel)
        
        containerView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        
        menuLabel.frame = CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hexStringToCGColor (_ hex: String) -> CGColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return CGColor.init(gray: 1, alpha: 1)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return CGColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func hexStringToUIColor (_ hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
