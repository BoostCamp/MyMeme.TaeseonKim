//
//  MemeCollectionViewController.swift
//  MyMeme.TaeseonKim
//
//  Created by 홍길동 on 2017. 1. 28..
//  Copyright © 2017년 TaeseonKim. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Meme.count()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "CollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MemeCollectionViewCell
        
        let meme = Meme.makeMemeAppdelegate().memes[indexPath.row]
        
        cell.memeimage.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemedImage") as! MemedImaged
        detailViewController.meme = Meme.makeMemeAppdelegate().memes[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
