import UIKit

import Foundation

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRemainingNavItems()
        // Do any additional setup after loading the view.
    }
    
    func setupRemainingNavItems() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "your-icon"))
//        titleImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        titleImageView.contentMode = .scaleAspectFit
//        titleImageView.clipsToBounds = true
//        navigationItem.titleView = titleImageView

        let button = UIButton(type: .custom)
        button.setImage(UIImage (named: "apple26"), for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        button.addTarget(self, action: #selector(tapbutton), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)

        self.navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc func tapbutton(){
    //    self.navigationController?.popViewController(animated: true)
        if let cv = storyboard?.instantiateViewController(identifier: "Menu"){
            present(cv, animated: true, completion: nil)
        }
//        print("tap")
    }
    
}

