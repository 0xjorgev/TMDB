//
//  MovieTableViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/24/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import PureLayout
import moa

class MovieTableViewCell: UITableViewCell {
    
    var poster:UIImageView?
    
    var title:UILabel?
    
    var originalTitle:UILabel?
    
    var language:UILabel?
    
    var extra:UILabel?
    
    //var type:UILabel?
    
    struct CellData {
        
        let movie:Movie?
    }
    
    var cellData: CellData? {
        
        didSet{
            
            let titleStr = "\(cellData?.movie?.title ?? "") "
            
            let yearStr = "(\(cellData?.movie?.releaseDate?.prefix(4) ?? ""))"
            
            let attributedString =  NSMutableAttributedString()
            
            let titleStyle = NSMutableParagraphStyle()
            
            let yearStyle = NSMutableParagraphStyle()
            
            let titleFont:UIFont = UIFont.boldSystemFont(ofSize: 24.0)
            
            let yearFont:UIFont = UIFont.italicSystemFont(ofSize: 24.0)
            
            let attrTitle = [NSAttributedString.Key.font: titleFont, NSAttributedString.Key.foregroundColor: UIColor.black, .paragraphStyle:titleStyle]
            
            let attrYear = [NSAttributedString.Key.font: yearFont, .paragraphStyle:yearStyle, NSAttributedString.Key.foregroundColor: UIColor.black]
            
            attributedString.append(NSAttributedString(string: titleStr, attributes: attrTitle))
            
            attributedString.append(NSAttributedString(string: yearStr, attributes: attrYear))
            
            title?.attributedText = attributedString
            
            
            //title?.text = "\(cellData?.movie?.title ?? "") (\(cellData?.movie?.releaseDate?.prefix(4) ?? ""))"
            
            language?.text = cellData?.movie?.originalLanguage ?? ""
            
            originalTitle?.text = cellData?.movie?.originalTitle ?? ""
            
            extra?.text = "\(cellData?.movie?.voteCount ?? 0) / \(cellData?.movie?.popularity ?? 0.0)"
            
           // status?.text = showCellData?.show?.status ?? ""
            
           // type?.text = showCellData?.show?.type ?? ""
            
            poster?.image = UIImage(named: "no-image")
            
            poster?.moa.url = "https://image.tmdb.org/t/p/w400/\(cellData?.movie?.posterPath ?? "")"
            
            poster?.moa.onSuccess = { image in
                return image
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func createViews(){
        
        let emptyImage = UIImage(named: "no-image")
        
        poster = UIImageView(image: emptyImage)
        
        poster?.contentMode = .scaleAspectFit
        
        self.addSubview(poster!)
        
        
        title = UILabel()
        
        //TODO: ADD attribute Strings for release year
        
        title?.numberOfLines = 3
        
        self.addSubview(title!)
        
        
        originalTitle = UILabel()
        
        originalTitle?.font = UIFont.italicSystemFont(ofSize: 14.0)
        
        originalTitle?.textColor = .black
        
        originalTitle?.numberOfLines = 3
        
        self.addSubview(originalTitle!)
        
        
        language = UILabel()
        
        language?.font = UIFont.systemFont(ofSize: 18.0)
        
        language?.textColor = .black
        
        self.addSubview(language!)
        
        
        extra = UILabel()
        
        extra?.font = UIFont.systemFont(ofSize: 11.0)
        
        extra?.textColor = .black
        
        extra?.textAlignment = .center
        
        self.addSubview(extra!)
        
        //3    28    37    
//        status = UILabel()
//
//        status?.font = UIFont.systemFont(ofSize: 12.0)
//
//        status?.textColor = .black
//
//        self.addSubview(status!)
        
        
//        type = UILabel()
//
//        type?.font = UIFont.systemFont(ofSize: 12.0)
//
//        type?.textColor = .black
//
//        self.addSubview(type!)
        
        
        self.accessoryType = .disclosureIndicator
        
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        let imageHeight:CGFloat = CGFloat(120.0)
        
        let scaleFactor:CGFloat = CGFloat(0.7118)
        
        poster?.autoPinEdge(.top, to: .top, of: self, withOffset: 12.0)
        
        poster?.autoPinEdge(.left, to: .left, of: self, withOffset: 5.0)
        
        poster?.autoSetDimension(.height, toSize: imageHeight)
        
        poster?.autoSetDimension(.width, toSize: (imageHeight * scaleFactor))
        
        
        title?.autoPinEdge(.top, to: .top, of: self, withOffset: 5.0)
        
        title?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        
        originalTitle?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 5.0)
        
        originalTitle?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        originalTitle?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        
        language?.autoPinEdge(.top, to: .bottom, of: originalTitle!, withOffset: 5.0)
        
        language?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        language?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        language?.autoSetDimension(.height, toSize: 35.0)
        
        
        
        extra?.autoPinEdge(.top, to: .bottom, of: poster!, withOffset: 5.0)
        
        extra?.autoPinEdge(.left, to: .left, of: self, withOffset: 5.0)
        
        //extra?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        extra?.autoSetDimension(.height, toSize: 18.0)
        
        extra?.autoSetDimension(.width, toSize: (imageHeight * scaleFactor))
        
        //language?.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -5.0)
        
//        status?.autoPinEdge(.top, to: .bottom, of: language!, withOffset: 5.0)
//        status?.autoPinEdge(.left, to: .left, of: self, withOffset: 85.0)
//        status?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        //status?.autoSetDimension(.height, toSize: 35.0)
        
//        type?.autoPinEdge(.top, to: .bottom, of: status!, withOffset: 5.0)
//        type?.autoPinEdge(.left, to: .left, of: self, withOffset: 85.0)
//        type?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        //type?.autoSetDimension(.height, toSize: 15.0)
        
        
    }
    
}
