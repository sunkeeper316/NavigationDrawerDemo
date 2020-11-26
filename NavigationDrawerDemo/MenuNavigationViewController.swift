

import UIKit

class MenuNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MenuNavigationViewController viewDidLoad")
        setleftBarButtonItem()
        // Do any additional setup after loading the view.
    }
    
    func setleftBarButtonItem(){
        self.setNavigationBarHidden(false, animated: true)
        let button = UIButton(type: .custom)
        button.setImage(UIImage (named: "apple26"), for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        button.addTarget(self, action: #selector(tapbutton), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        for v in self.viewControllers {
            v.navigationItem.setHidesBackButton(true, animated: false)
            v.navigationItem.leftBarButtonItem = barButtonItem
            
        }
//        self.navigationItem.leftBarButtonItem = barButtonItem
        
    }
    @objc func tapbutton(){
        
    //    self.navigationController?.popViewController(animated: true)
        if let vc = storyboard?.instantiateViewController(identifier: "Menu"){
            present(vc, animated: true, completion: nil)
            
        }
//        print("tap")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
