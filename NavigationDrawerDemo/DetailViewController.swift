

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRemainingNavItems()
//        self.navigationItem.setHidesBackButton(true, animated: false)
        // Do any additional setup after loading the view.
    }
    func setupRemainingNavItems() {
//        self.navigationController?.setNavigationBarHidden(false, animated: true)

        let button = UIButton(type: .custom)
        button.setImage(UIImage (named: "close"), for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        button.addTarget(self, action: #selector(tapbutton), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)

        self.navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc func tapbutton(){
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
