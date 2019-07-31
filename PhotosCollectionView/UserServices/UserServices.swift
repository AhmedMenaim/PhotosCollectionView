//
//  UserServices.swift
//  PhotosCollectionView
//
//  Created by MyAList on 7/16/19.
//  Copyright © 2019 amrfawaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct UserServices {
    
    
    func getUsers(complition: @escaping ([JSON]) -> Void) {
        
        Alamofire.request("http://api.github.com/users", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                if let array = JSON(value).array {
                    complition(array)
                    
                }
                print(value)
            case .failure(let error):
                print(error)
            }
            
            
            print(response)
        }
    }
}
