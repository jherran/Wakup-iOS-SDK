//
//  ContextMenuItem+CodeImage.swift
//  Wuakup
//
//  Created by Guillermo Gutiérrez on 18/02/15.
//  Copyright (c) 2015 Yellow Pineapple. All rights reserved.
//

import Foundation

extension ContextMenuItem {
    convenience init(codeImage: CodeImage, size: CGSize, highlightedImage: CodeImage? = .none, titleText: String? = .none) {
        let frame = CGRect(origin: CGPoint.zero, size: size)
        
        let itemView = UIImageView(image: codeImage.getImage(frame))
        itemView.frame = frame
        
        var highlightedView: UIImageView?
        if let highlightedImage = highlightedImage {
            highlightedView = UIImageView(image: highlightedImage.getImage(frame))
            highlightedView!.frame = frame
        }
        
        self.init(itemView: itemView, highlightedItemView: highlightedView, titleText: titleText)
    }
    
    convenience init(codeIcon: CodeIcon, color: UIColor, size: CGSize, highlightedColor: UIColor? = .none, titleText: String? = .none) {
        let codeImage = codeIcon.getCodeImage(forColor: color)
        let highlightedImage = highlightedColor.map{ codeIcon.getCodeImage(forColor: $0) }
        self.init(codeImage: codeImage, size: size, highlightedImage: highlightedImage, titleText: titleText)
    }
    
    convenience init(iconIdentifier: String, color: UIColor, size: CGSize, highlightedColor: UIColor? = .none, titleText: String? = .none) {
        let codeIcon = CodeIcon(iconIdentifier: iconIdentifier)
        self.init(codeIcon: codeIcon, color: color, size: size, highlightedColor: highlightedColor, titleText: titleText)
    }
    
    class func withCustomView(_ iconIdentifier: String, titleText: String? = .none) -> ContextMenuItem {
        let view = loadViewFromNib("ContextItemView") as! ContextItemView
        view.iconIdentifier = iconIdentifier
        
        let highlightedView = loadViewFromNib("ContextItemView") as! ContextItemView
        highlightedView.iconIdentifier = iconIdentifier
        highlightedView.highlighted = true
        
        let menuItem = ContextMenuItem(itemView: view, highlightedItemView: highlightedView, titleText: titleText)
        menuItem.identifier = iconIdentifier
        return menuItem
    }
}
