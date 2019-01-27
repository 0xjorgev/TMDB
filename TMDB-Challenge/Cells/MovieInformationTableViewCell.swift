//
//  MovieInformationTableViewCell.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/26/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit

class MovieInformationTableViewCell: UITableViewCell {
    
    var title:UILabel?
    
    var productionTitle:UILabel?
    
    var production:UILabel?
    
    var genreTitle:UILabel?

    var genre:UILabel?

    var releasedTitle:UILabel?

    var released:UILabel?

    var countryTitle:UILabel?

    var country:UILabel?

    var statusTitle:UILabel?

    var status:UILabel?
    
    var websiteTitle:UILabel?
    
    var website:UILabel?
    
    var runtimeTitle:UILabel?
    
    var runtime:UILabel?
    
    var movie:Movie?{
        
        didSet{
            
            productionTitle?.text = "Production"
            
            production?.text = "".reduceArrayToString(arr: movie?.productionCompanies?.map{ return $0.name } ?? []) + " "
            
            genreTitle?.text = "Genre"
            
            genre?.text = movie?.genres?.first?.name ?? " "
            
            releasedTitle?.text = "Release date"
            
            released?.text = movie?.releaseDate ?? " "
            
            countryTitle?.text = "Country"
            
            country?.text = "".reduceArrayToString(arr: movie?.productionCountries?.map{ return $0.name } ?? []) + " "
            
            statusTitle?.text = "Status"
            
            status?.text = movie?.status ?? " "
            
            websiteTitle?.text = "Website"
            
            website?.text = movie?.homepage ?? " "
            
            runtimeTitle?.text = "Runtime"
            
            runtime?.text = "\(movie?.runtime ?? 0) min"
            
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
        
        title?.addCellTitleStyle(text:"Information")
        
        self.addSubview(title!)
        
        
        productionTitle = UILabel()
        
        productionTitle?.addInformationTitleStyle()
        
        self.addSubview(productionTitle!)
        
        
        production = UILabel()
        
        production?.addInformationStyle()
        
        self.addSubview(production!)
        
        
        genreTitle = UILabel()

        genreTitle?.addInformationTitleStyle()

        self.addSubview(genreTitle!)


        genre = UILabel()

        genre?.addInformationStyle()

        self.addSubview(genre!)


        releasedTitle = UILabel()

        releasedTitle?.addInformationTitleStyle()

        self.addSubview(releasedTitle!)


        released = UILabel()

        released?.addInformationStyle()

        self.addSubview(released!)


        countryTitle = UILabel()

        countryTitle?.addInformationTitleStyle()

        self.addSubview(countryTitle!)


        country = UILabel()

        country?.addInformationStyle()

        self.addSubview(country!)


        statusTitle = UILabel()

        statusTitle?.addInformationTitleStyle()

        self.addSubview(statusTitle!)


        status = UILabel()

        status?.addInformationStyle()

        self.addSubview(status!)
        
        
        websiteTitle = UILabel()
        
        websiteTitle?.addInformationTitleStyle()
        
        self.addSubview(websiteTitle!)
        
        
        website = UILabel()
        
        website?.addInformationStyle()
        
        self.addSubview(website!)
        
        
        runtimeTitle = UILabel()
        
        runtimeTitle?.addInformationTitleStyle()
        
        self.addSubview(runtimeTitle!)
        
        
        runtime = UILabel()
        
        runtime?.addInformationStyle()
        
        self.addSubview(runtime!)
        
        
        self.accessoryType = .none
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        let width:CGFloat = 90.0
        
        title?.autoPinEdge(.top, to: .top, of: self, withOffset: 12.0)
        
        title?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        title?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        productionTitle?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 8.0)
        
        productionTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        productionTitle?.autoSetDimension(.width, toSize: width)
        
        
        production?.autoPinEdge(.top, to: .bottom, of: title!, withOffset: 8.0)
        
        production?.autoPinEdge(.left, to: .right, of: productionTitle!, withOffset: 8.0)
        
        production?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        genreTitle?.autoPinEdge(.top, to: .bottom, of: production!, withOffset: 8.0)
        
        genreTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        genreTitle?.autoSetDimension(.width, toSize: width)
        
        
        genre?.autoPinEdge(.top, to: .bottom, of: production!, withOffset: 8.0)
        
        genre?.autoPinEdge(.left, to: .right, of: genreTitle!, withOffset: 8.0)
        
        genre?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        releasedTitle?.autoPinEdge(.top, to: .bottom, of: genre!, withOffset: 8.0)
        
        releasedTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        releasedTitle?.autoSetDimension(.width, toSize: width)
        
        
        released?.autoPinEdge(.top, to: .bottom, of: genre!, withOffset: 8.0)
        
        released?.autoPinEdge(.left, to: .right, of: releasedTitle!, withOffset: 8.0)
        
        released?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        countryTitle?.autoPinEdge(.top, to: .bottom, of: released!, withOffset: 8.0)
        
        countryTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        countryTitle?.autoSetDimension(.width, toSize: width)
        
        
        country?.autoPinEdge(.top, to: .bottom, of: released!, withOffset: 8.0)
        
        country?.autoPinEdge(.left, to: .right, of: countryTitle!, withOffset: 8.0)
        
        country?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        statusTitle?.autoPinEdge(.top, to: .bottom, of: country!, withOffset: 8.0)
        
        statusTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        statusTitle?.autoSetDimension(.width, toSize: width)
        
        
        status?.autoPinEdge(.top, to: .bottom, of: country!, withOffset: 8.0)
        
        status?.autoPinEdge(.left, to: .right, of: statusTitle!, withOffset: 8.0)
        
        status?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        websiteTitle?.autoPinEdge(.top, to: .bottom, of: status!, withOffset: 8.0)
        
        websiteTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        websiteTitle?.autoSetDimension(.width, toSize: width)
        
        
        website?.autoPinEdge(.top, to: .bottom, of: status!, withOffset: 8.0)
        
        website?.autoPinEdge(.left, to: .right, of: websiteTitle!, withOffset: 8.0)
        
        website?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
        
        runtimeTitle?.autoPinEdge(.top, to: .bottom, of: website!, withOffset: 8.0)
        
        runtimeTitle?.autoPinEdge(.left, to: .left, of: self, withOffset: 12.0)
        
        runtimeTitle?.autoSetDimension(.width, toSize: width)
        
        
        runtime?.autoPinEdge(.top, to: .bottom, of: website!, withOffset: 8.0)
        
        runtime?.autoPinEdge(.left, to: .right, of: runtimeTitle!, withOffset: 8.0)
        
        runtime?.autoPinEdge(.right, to: .right, of: self, withOffset: -12.0)
        
    }

}
