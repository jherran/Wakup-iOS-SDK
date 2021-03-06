//
//  SearchResultCell.swift
//  Wakup
//
//  Created by Guillermo Gutiérrez on 8/1/16.
//  Copyright © 2016 Yellow Pineapple. All rights reserved.
//

import Foundation

open class SearchResultCell: UITableViewCell {
    open dynamic var titleTextColor: UIColor?  { didSet { textLabel?.textColor = titleTextColor } }
    open dynamic var titleFont: UIFont? { didSet { textLabel?.font = titleFont } }
    open dynamic var detailTextColor: UIColor? { didSet { detailTextLabel?.textColor = detailTextColor } }
    open dynamic var detailFont: UIFont? { didSet { detailTextLabel?.font = detailFont } }
    
    open dynamic var iconColor: UIColor? { didSet { updateIcon() } }
    
    var iconIdentifier: String? { didSet { updateIcon() } }
    
    func updateIcon() {
        let iconFrame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView?.image = iconIdentifier.map { CodeIcon(iconIdentifier: $0).getImage(iconFrame, color: self.iconColor) }
    }
}
