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
    
    var meme: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        if let memeImage = meme?.memedImage {
            memedImage.image = memeImage
        }
    }
    
    // tableViewController나 collectionViewController를 클릭하였을때 detail veiw에 대한 viewcontroller입니다.
    // memedImage를 IBOutlet을 통해 연결 하였고, viwwillAppear이 실행 되었을때, tabBarController는 숨겨 지고 만약 이미지가 meme.memedImage가 memeImage에 할당 될 수 있다면 memedImage의 이미지는 memeImage 변수 memeImage로 다시 할당하게 된다.
    
}
