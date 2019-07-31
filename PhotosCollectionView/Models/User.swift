//
//  User.swift
//  PhotosCollectionView
//
//  Created by MyAList on 7/16/19.
//  Copyright © 2019 amrfawaz. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    let id: Int?
    let name: String?
    let image: URL?
    
    
    init(json: JSON) {
        id = json["id"].int
        name = json["login"].string
        image = json["avatar_url"].url
    }
}
