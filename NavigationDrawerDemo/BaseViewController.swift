import UIKit

import Foundation

class BaseViewController: UIViewController {
    
    var isdrawerOpen = false
    var menuview : MenuView!
    var navigationBar : UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRemainingNavItems()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.navigationBar.frame.size.height)
        print(UIApplication.shared.statusBarFrame.size.height)
        
        setupMenuview()
    }
    
    func setupRemainingNavItems() {
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "your-icon"))
//        titleImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        titleImageView.contentMode = .scaleAspectFit
//        titleImageView.clipsToBounds = true
//        navigationItem.titleView = titleImageView
        //status bar 高度20
//        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: view.bounds.width, height: 44))
        navigationBar = UINavigationBar()
        let guide = self.view.safeAreaLayoutGuide
        self.view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        
//        ios 11 以下沒有安全區域 用下面
//        NSLayoutConstraint(item: navigationBar!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: navigationBar!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: navigationBar!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
//        let navigationBarLayoutConstraint = NSLayoutConstraint.c
//        NSLayoutConstraint.activate(<#T##constraints: [NSLayoutConstraint]##[NSLayoutConstraint]#>)
        let button = UIButton(type: .custom)
        button.setImage(UIImage (named: "close"), for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        button.addTarget(self, action: #selector(tapbutton), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
//        navigationBar.items?.append(barButtonItem)
        let navigationItem = UINavigationItem(title: "")
        navigationItem.leftBarButtonItem = barButtonItem
        navigationBar.backgroundColor = .darkGray
        navigationBar.setItems([navigationItem], animated: false)
        
//        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    func setupMenuview(){
        let guide = view.safeAreaLayoutGuide
        let layoutFrame = guide.layoutFrame
        print(layoutFrame.origin.y)
        menuview = MenuView(frame: CGRect(x: -200, y: layoutFrame.origin.y + navigationBar.frame.height, width: 200, height: layoutFrame.size.height - navigationBar.frame.height))
        menuview.menuItems.append(MunuItem(itemName: "頁面1", itemStoryboardId: "X1"))
        menuview.menuItems.append(MunuItem(itemName: "頁面2", itemStoryboardId: "X2"))
        menuview.didSelectHandle = { (menuItem) in
            print("didSelectHandle")
            self.tapbutton()
            if let vc = self.storyboard?.instantiateViewController(identifier: menuItem.itemStoryboardId) {
                vc.modalPresentationStyle = .fullScreen
                vc.transitioningDelegate = self
                self.present(vc, animated: true, completion: nil)
            }
            
        }
        view.addSubview(menuview)
    }
    @objc func tapbutton(){
        if isdrawerOpen {
            isdrawerOpen = false
            
            UIView.animate(withDuration: 0.5) {
                self.menuview.transform = CGAffineTransform(translationX: -200, y: 0)
            } completion: { (complete) in
                
            }
        }else{
            isdrawerOpen = true
            UIView.animate(withDuration: 0.5) {
                self.menuview.transform = CGAffineTransform(translationX: 200, y: 0)
            } completion: { (complete) in
                
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

