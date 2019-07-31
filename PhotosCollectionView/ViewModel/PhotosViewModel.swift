//
//  PhotosViewModel.swift
//  PhotosCollectionView
//
//  Created by MyAList on 7/16/19.
//  Copyright © 2019 amrfawaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PhotosViewModel {
    
    var users = [User]()
    func getUsers(complition: @escaping () -> Void) {
        
        
        let userService = UserServices()
        userService.getUsers { [weak self] jsonArray in
            
            
            let usersList = jsonArray.compactMap({ (json: JSON) -> User? in
                return User(json: json)
            })
            self?.users = usersList
            complition()
            
            
            //                    for item in array {
            //                        let user = User(json: item)
            //                        self.users.append(user)
            //                    }

        }
        
        
    }
    
    
    
    
    
}
