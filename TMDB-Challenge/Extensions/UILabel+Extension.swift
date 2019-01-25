//
//  UILabel+Extension.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/25/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func addAttributedTitle(title:String?, year:String?) {
        
        let titleStr = "\(title ?? "") "
        
        let yearStr = "(\(year?.prefix(4) ?? ""))"
        
        let attributedString =  NSMutableAttributedString()
        
        let titleStyle = NSMutableParagraphStyle()
        
        let yearStyle = NSMutableParagraphStyle()
        
        let titleFont:UIFont = UIFont.systemFont(ofSize: 26.0)
        
        let yearFont:UIFont = UIFont.italicSystemFont(ofSize: 18.0)
        
        let attrTitle = [NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: UIColor.white, .paragraphStyle:titleStyle]
        
        let attrYear = [NSAttributedString.Key.font: yearFont, .paragraphStyle:yearStyle, NSAttributedString.Key.foregroundColor: UIColor.gray]
        
        attributedString.append(NSAttributedString(string: titleStr, attributes: attrTitle))
        
        attributedString.append(NSAttributedString(string: yearStr, attributes: attrYear))
        
        self.attributedText = attributedString
    }
    
    func addAttributedNavigationTitle(title:String?) {
        
        let titleStr = "\(title ?? "") "
        
        let attributedString =  NSMutableAttributedString()
        
        let titleStyle = NSMutableParagraphStyle()
        
        let titleFont:UIFont = UIFont.boldSystemFont(ofSize: 18.0)
        
        let attrTitle = [NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: Colors.mainColor, .paragraphStyle:titleStyle]
        
        attributedString.append(NSAttributedString(string: titleStr, attributes: attrTitle))
        
        self.attributedText = attributedString
    }
}
