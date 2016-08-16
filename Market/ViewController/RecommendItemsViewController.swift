//
//  RecommendItemsViewController.swift
//  Market
//
//  Created by tomoka-moriwaki on 2016/08/16.
//  Copyright © 2016年 tomoka-moriwaki. All rights reserved.
//

import UIKit

class RecommendItemsViewController: UITableViewController {
    
    
    // Item.swiftで作成したStructに値を代入
    let items: [Item] = [
        Item(id: 1, name: "おたま", desc: "おたまです", price: 100, imageURL: NSURL(string: "http://example.com")!),
        Item(id: 2, name: "しゃもじ", desc: "しゃもじです", price: 200, imageURL: NSURL(string: "http://example.com")!),
        Item(id: 3, name: "菜箸", desc: "菜箸です", price: 300, imageURL: NSURL(string: "http://example.com")!), // ! = not nil
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    //　sectionの中に何個のrowがあるか
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("RecommendItemCell", forIndexPath: indexPath) as? RecommendItemCell else {
                fatalError("Invalid Cell")
            }// idのCellを取得
            
        //Configure the cell...
        
        let item = items[indexPath.row]
        cell.update(withItem: item)
            
        return cell
    }
}