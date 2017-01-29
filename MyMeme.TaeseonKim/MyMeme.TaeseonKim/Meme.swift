//
//  Meme.swift
//  MyMeme.TaeseonKim
//
//  Created by 홍길동 on 2017. 1. 28..
//  Copyright © 2017년 TaeseonKim. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    var top: String
    var bottom: String
    var image: UIImage
    var memedImage: UIImage
    
    static let memeTextAttributes:[String: Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: -1.0
    ]
    
    static func count() -> Int {
        return makeMemeAppdelegate().memes.count
    }
    
    static func makeMemeAppdelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    // meme 구조체를 만들어서 해당 구조체를 쉽게 불러 오도록 했다.
    // static method를 만들어서 반복적으로 호출 되어야 하는 녀석들한 한 곳에 모아놨다.
    
}
