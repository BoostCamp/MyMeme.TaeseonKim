//
//  MemeEditingViewControllerTextField.swift
//  MyMeme.TaeseonKim
//
//  Created by 홍길동 on 2017. 1. 28..
//  Copyright © 2017년 TaeseonKim. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditingViewController: UITextFieldDelegate {
    
    func setTextFiledAttribute(textfield: UITextField, defaultText: String) {
        textfield.delegate = self
        textfield.defaultTextAttributes = Meme.memeTextAttributes
        textfield.textAlignment = .center
        textfield.text = defaultText
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == topTextfield && textField.text == "TOP" {
            textField.text = ""
        } else if textField == bottomTextfield && textField.text == "BOTTOM" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
