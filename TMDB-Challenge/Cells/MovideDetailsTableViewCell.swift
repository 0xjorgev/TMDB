//
//  MovideDetailsTableViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import SafariServices

class MovideDetailsTableViewCell: UITableViewCell, SFSafariViewControllerDelegate {
    
    var poster:UIImageView?
    
    var title:UILabel?
    
    var originalTitle:UILabel?
    
    var votesCount:UILabel?
    
    var movie:Movie?{
        
        didSet{
            
            title?.text = movie?.title ?? ""
            
            originalTitle?.text = movie?.originalTitle ?? ""
            
            votesCount?.text = "Avg vote:\(movie?.voteAverage ?? 0.0) Votes:\(movie?.voteCount ?? 0)"
            
            poster?.image = UIImage(named: "no-image-v")
            
            poster?.moa.url = "\(IMG_URL)\(movie?.posterPath ?? "")"
            
            poster?.moa.onSuccess = { image in
                return image
            }
            
        }
    }
    
    var trailer:UIButton?
    
    var video:Trailer?
    
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
        super.setSelected(false, animated: false)
        
        // Configure the view for the selected state
    }
    
    func createViews(){
        
        self.backgroundColor = .black
        
        let emptyImage = UIImage(named: "no-image")
        
        poster = UIImageView(image: emptyImage)
        
        poster?.contentMode = .scaleAspectFit
        
        self.addSubview(poster!)
        
        
        title = UILabel()
        
        title?.font = UIFont.systemFont(ofSize: 26.0)
        
        title?.textColor = UIColor.white
        
        title?.numberOfLines = 3
        
        self.addSubview(title!)
        
        
        originalTitle = UILabel()
        
        originalTitle?.font = UIFont.italicSystemFont(ofSize: 14.0)
        
        originalTitle?.textColor = UIColor.lightGray
        
        originalTitle?.numberOfLines = 3
        
        self.addSubview(originalTitle!)
        
        
        votesCount = UILabel()
        
        votesCount?.font = UIFont.systemFont(ofSize: 12.0)
        
        votesCount?.textColor = Colors.mainColor
        
        votesCount?.numberOfLines = 1
        
        self.addSubview(votesCount!)
        
        
        trailer = UIButton(type: .custom)
        
        trailer?.setTitle("  Watch Trailer  ", for: .normal)
        
        trailer?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        
        trailer?.titleLabel?.textColor = Colors.mainColor
        
        trailer?.addTarget(self, action: #selector(watchTrailer), for: .touchUpInside)
        
        trailer?.layer.borderWidth = 2.0
        
        trailer?.layer.borderColor = UIColor.white.cgColor
        
        trailer?.isHidden = true
        
        self.addSubview(trailer!)
        
        
        self.accessoryType = .none
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        let imageHeight:CGFloat = CGFloat(105.0)
        
        let scaleFactor:CGFloat = CGFloat(0.7118)
        
        
        poster?.autoPinEdge(.top, to: .top, of: self, withOffset: 18.0)
        
        poster?.autoPinEdge(.left, to: .left, of: self, withOffset: 8.0)
        
        poster?.autoSetDimension(.height, toSize: imageHeight)
        
        poster?.autoSetDimension(.width, toSize: (imageHeight * scaleFactor))
        
        
        title?.autoPinEdge(.top, to: .top, of: self, withOffset: 10.0)
        
        title?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        originalTitle?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 5.0)
        
        originalTitle?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        originalTitle?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        votesCount?.autoPinEdge(.top, to: .bottom, of: originalTitle!, withOffset: 25.0)
        
        votesCount?.autoPinEdge(.left, to: .right, of: poster!, withOffset: 12.0)
        
        votesCount?.autoPinEdge(.right, to: .right, of: self, withOffset: -5.0)
        
        
        trailer?.autoPinEdge(.top, to: .top, of: self, withOffset: 75.0)
        
        trailer?.autoPinEdge(.right, to: .right, of: self, withOffset: -24.0)
        
        trailer?.autoSetDimension(.width, toSize: 120.0)
        
        trailer?.autoSetDimension(.height, toSize: 35.0)
        
    }
    
    func getData(){
        
        Service.shared.getMovieTrailer(id: "\(self.movie?.id ?? 0)" ) { (res,err) in
            if res != nil {
                
                self.video = res?.result?.filter{ $0.site == "youtube" }.first
                
//                OperationQueue.main.addOperation {
//                    self.trailer?.isHidden = false
//                }
            }
        }
        
    }
    
    @objc func watchTrailer(sender:UIButton){
        
//        print("tap tap tap")
//
//        let url = "https://youtu.be/\(self.video?.key ?? "")"
//
//        if let url = URL(string: url) {
//
//            let vc = SFSafariViewController(url: url)
//
//            vc.delegate = self
//
//            self.present(vc, animated: true)
//        }
        
    }
    
}
