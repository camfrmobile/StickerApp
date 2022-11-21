//
//  Menu.swift
//  StickerApp
//
//  Created by Trần Văn Cam on 21/11/2022.
//

import Foundation

struct Menu {
    var title: String
    var width: CGFloat
    var color: String
    var isActive: Bool
    
    init(title: String, width: CGFloat, color: String, isActive: Bool = false) {
        self.title = title
        self.width = width
        self.color = color
        self.isActive = isActive
    }
}

func getMenus() -> [Menu] {
    let menu1 = Menu(title: "Cartoon", width: 83, color: "#6B19FF", isActive: true)
    let menu2 = Menu(title: "Emoji", width: 68, color: "#FF40AB")
    let menu3 = Menu(title: "Emotions", width: 91, color: "#2842FF")
    let menu4 = Menu(title: "Charaters", width: 93, color: "#FCDD0F")
    let menu5 = Menu(title: "Sports", width: 73, color: "#1CD34A")
    return [menu1, menu2, menu3, menu4, menu5]
}
