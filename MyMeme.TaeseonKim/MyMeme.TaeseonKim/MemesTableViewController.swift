//
//  MemesTableViewController.swift
//  MyMeme.TaeseonKim
//
//  Created by 홍길동 on 2017. 1. 28..
//  Copyright © 2017년 TaeseonKim. All rights reserved.
//

import Foundation
import UIKit

class MemesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = false
        
        tableView!.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Meme.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! MemeTableViewCell
        
        let meme = Meme.makeMemeAppdelegate().memes[indexPath.row]
        
        cell.memeImage.image = meme.memedImage
        cell.memeTopText.text = meme.top
        cell.memeBottomText.text = meme.bottom
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Meme.makeMemeAppdelegate().memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedMeme = Meme.makeMemeAppdelegate().memes[fromIndex]
        Meme.makeMemeAppdelegate().memes.remove(at: fromIndex)
        Meme.makeMemeAppdelegate().memes.insert(movedMeme, at: toIndex)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVeiwController = storyboard?.instantiateViewController(withIdentifier: "MemedImage") as! MemedImaged
        detailVeiwController.meme = Meme.makeMemeAppdelegate().memes[indexPath.row]
        navigationController?.pushViewController(detailVeiwController, animated: true)
    }
}
