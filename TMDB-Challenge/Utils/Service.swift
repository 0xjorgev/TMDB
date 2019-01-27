//
//  Service.swift
//  TMDB-Challenge
//
//  Created by Jorge Mendoza on 1/24/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

class Service:NSObject {
    
    static let shared = Service()
    
    let session = URLSession.shared
    
    private func getData<T: Decodable>(url:String?, model:T.Type, handler: @escaping (T? , Error?) -> Void )  {
        
        let url = URLRequest(url: URL(string: url!)!)
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            guard let responseData = data else {
                handler(nil, error)
                return
            }
            
            guard error == nil else {
                handler(nil, error)
                return
            }
            
//            let stringData = String(data: responseData, encoding: String.Encoding.utf8)
//            
//            print("String Data: \(stringData)")
            
            let decoder = JSONDecoder()
            
            do {
                let model = try decoder.decode(T.self, from: responseData)
                handler(model, nil)
            } catch {
                    print("error trying to convert data to JSON")
                print(error)
                handler(nil, error)
            }
            
        })
        
        task.resume()
        
        return handler(nil, nil)
    }
    
    func getUpcomingMovies(page:Int?, completion:@escaping (Upcoming?, Error?) -> Void ){

        let endpoint = "\(BASEURL)/movie/upcoming?api_key=\(API_KEY)&language=en-US&page=\(page ?? 1)"

        getData(url: endpoint, model: Upcoming.self) { (res, error) in
            
            if error == nil {
                completion(res, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func getMovieById(id:String?, completion: @escaping (Movie?, Error?) -> Void ){
        
        let endpoint = "\(BASEURL)/movie/\(id ?? "0")?api_key=\(API_KEY)&language=en-US"
        
        getData(url: endpoint, model: Movie.self) { (res, error) in
            
            if error == nil {
                completion(res, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func getMovieSearch(query:String?, page:Int?, completion: @escaping (Search?, Error?) -> Void ){
        
        let endpoint = "\(BASEURL)/search/movie?api_key=\(API_KEY)&language=en-US&query=\(query ?? "")&page=\(page ?? 1)&include_adult=false"
        
        getData(url: endpoint, model: Search.self) { (res, error) in
            
            if error == nil {
                completion(res, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    
    func getRelatedMovies(id:String?, completion: @escaping (Related?, Error?) -> Void ){

        let endpoint = "\(BASEURL)/movie/\(id ?? "0")/similar?api_key=\(API_KEY)&language=en-US&page=1"
        
        getData(url: endpoint, model: Related.self) { (res, error) in
            
            if error == nil {
                completion(res, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    
    func getMovieTrailer(id:String?, completion: @escaping (Videos?, Error?) -> Void ){
        
        let endpoint = "\(BASEURL)/movie/\(id ?? "0")/videos?api_key=\(API_KEY)&language=en-US"
        
        getData(url: endpoint, model: Videos.self) { (res, error) in
            
            if error == nil {
                completion(res, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
}
