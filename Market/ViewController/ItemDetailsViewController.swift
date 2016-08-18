import APIKit
import UIKit

class ItemDetailsViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var itemID: Int = 0
    //var item: Item? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print(itemID)
        
        let request = ItemDatilRequest(id: itemID)
        
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.update(withItem: response)
                print(response)
            case .Failure(let error):
                print(error)
            }
        }
        
    }
    func update(withItem item: Item){
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)円"
        descriptionLabel.text = item.desc
        thumbnailImageView.sd_setImageWithURL(item.imageURL)
    }
    
}
