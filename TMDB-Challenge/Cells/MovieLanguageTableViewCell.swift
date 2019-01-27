//
//  MovieLanguageTableViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class MovieLanguageTableViewCell: UITableViewCell {

    var title:UILabel?
    
    var languageTitle:UILabel?
    
    var language:UILabel?
    
    var originalTitle:UILabel?
    
    var original:UILabel?
    
    var movie:Movie?{
        
        didSet{
            
            languageTitle?.text = "Languages"
            
            language?.text = "".reduceArrayToString(arr: movie?.spokenLanguages?.map{ return $0.name } ?? [])
            
            originalTitle?.text = "Original"
            
            original?.text = movie?.originalLanguage
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViews(){
        
        self.backgroundColor = .black
        
        title = UILabel()
        
        title?.addCellTitleStyle(text:"Languages")
        
        self.addSubview(title!)
        
        
        languageTitle = UILabel()
        
        languageTitle?.addInformationTitleStyle()
        
        self.addSubview(languageTitle!)
        
        
        language = UILabel()
        
        language?.addInformationStyle()
        
        self.addSubview(language!)
        
        
        originalTitle = UILabel()
        
        originalTitle?.addInformationTitleStyle()
        
        self.addSubview(originalTitle!)
        
        
        original = UILabel()
        
        original?.addInformationStyle()
        
        self.addSubview(original!)
        
        
        self.accessoryType = .none
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        let width:CGFloat = 90.0
        
        title?.autoPinEdge(.top, to: .top, of: self, withOffset: 12.0)
        
        title?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        languageTitle?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 8.0)
        
        languageTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        languageTitle?.autoSetDimension(.width, toSize: width)
        
        
        language?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 8.0)
        
        language?.autoPinEdge(.left, to: .right, of: languageTitle!, withOffset: 8.0)
        
        language?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        originalTitle?.autoPinEdge(.top, to: .bottom, of: language!, withOffset: 8.0)
        
        originalTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        originalTitle?.autoSetDimension(.width, toSize: width)
        
        
        original?.autoPinEdge(.top, to: .bottom, of: language!, withOffset: 8.0)
        
        original?.autoPinEdge(.left, to: .right, of: originalTitle!, withOffset: 8.0)
        
        original?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
    }

}
