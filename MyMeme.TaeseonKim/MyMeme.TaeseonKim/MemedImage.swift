//
//  MemedImage.swift
//  MyMeme.TaeseonKim
//
//  Created by 홍길동 on 2017. 1. 28..
//  Copyright © 2017년 TaeseonKim. All rights reserved.
//

import Foundation
import UIKit

class MemedImaged: UIViewController {
    @IBOutlet var memedImage: UIImageView!
    
    var meme: Meme? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        if let memeImage = meme?.memedImage {
            memedImage.image = memeImage
        }
    }
}
