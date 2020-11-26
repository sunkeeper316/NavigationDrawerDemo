import UIKit

import Foundation

class MenuView : UIView , UITableViewDataSource , UITableViewDelegate{
    
    var tableView : UITableView!
    var didSelectHandle : ((MunuItem) -> Void)?
    var menuItems = [MunuItem]()
    
//    var menuItems = ["test1","test2","test2","test2","test2","test2","test2","test2","test2","test2","test2","test2","test2","test2","test2","test2"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func awakeFromNib() {
        print("awakeFromNib")
        tableView = UITableView(frame: self.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
    }
    override func didAddSubview(_ subview: UIView) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.itemName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        didSelectHandle?(menuItem)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

