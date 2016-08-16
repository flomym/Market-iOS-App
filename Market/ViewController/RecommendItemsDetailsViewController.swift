import APIKit
import UIKit

class RecommendItemsDetailsViewController: UITableViewController {
    
    
    // Item.swiftで作成したStructに値を代入
    var items: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = RecommendItemCell.height
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = RecommendItemsRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.items = response
            case .Failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    //　sectionの中に何個のrowがあるか
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("RecommendItemCell", forIndexPath: indexPath) as? RecommendItemCell else {
            fatalError("Invalid cell")
        }// idのCellを取得
            
        //Configure the cell...
        
        let item = items[indexPath.row]
        cell.update(withItem: item)
            
        return cell
    }
}