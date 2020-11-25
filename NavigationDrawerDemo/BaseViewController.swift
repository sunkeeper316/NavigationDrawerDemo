import UIKit

import Foundation

class BaseViewController: UIViewController {
    
    var isdrawer = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRemainingNavItems()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.navigationBar.frame.size.height)
        print(UIApplication.shared.statusBarFrame.size.height)
        
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
        if let vc = storyboard?.instantiateViewController(identifier: "Menu"){
            vc.modalPresentationStyle = .custom
//            vc.modalTransitionStyle = .crossDissolve
            vc.transitioningDelegate = self
            navigationController?.delegate = self
//            vc.navigationController.navigationDelegate
            if isdrawer {
                isdrawer = false
                navigationController?.popViewController(animated: true)
            }else{
                isdrawer = true
//                show(vc, sender: self)
                navigationController?.pushViewController(vc, animated: true)
//                present(vc, animated: true, completion: nil)
            }
            
        }
//        print("tap")
    }
    
}
extension BaseViewController : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
}
extension BaseViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("presented")
            return PresentAnimator()
        }
        
//        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//            print("dismissed")
//            return PresentAnimator()
//        }
}

