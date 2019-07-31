//
//  PhotosCollectionViewController.swift
//  PhotosCollectionView
//
//  Created by MyAList on 7/16/19.
//  Copyright © 2019 amrfawaz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class PhotosCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var photoViewModel = PhotosViewModel()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        getUsers()
    }
    


    func getUsers() {
        photoViewModel.getUsers { [weak self] in
            
//            self?.users = users
            self?.collectionView.reloadData()
        }
    }
}




extension PhotosCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoViewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell
        
        photoCell?.loadImage(url: photoViewModel.users[indexPath.item].image!)
        return photoCell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: photoViewModel.users[indexPath.item].name, message: "", preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(doneAction)
        present(alertController, animated: true, completion: nil)
    }
}
