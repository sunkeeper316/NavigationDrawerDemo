

import Foundation


import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties
//    private var transitionDriver: PresentTransitionDriver?
    
    // MARK: - Methods
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: .to) as! BaseViewController
        let fromVC = transitionContext.viewController(forKey: .from)
//        let fromVC = transitionContext.viewController(forKey: .from)
//        toVC?.view.layer.mask = nil
        print(toVC.view.bounds.width)
//        toVC.menuview =
        toVC.navigationBar.frame.origin = CGPoint(x: 0, y: 20)
        toVC.view.frame.origin = CGPoint(x: (toVC.view.bounds.width), y: 0)
//        toVC?.view.frame = CGRect(x: -(toVC?.view.bounds.width)!, y: 44, width: (fromVC?.view.frame.width)!, height: (fromVC?.view.frame.height)! - 44)
//        print(fromVC?.navigationController?.navigationBar.frame.size.height)
        transitionContext.containerView.addSubview((toVC.view!))
        UIView.animate(withDuration: 0.5) {
            print("animate")
//            toVC?.view.alpha = 0
//            print(toVC?.view.alpha)
//            print(toVC?.view)
            toVC.view.transform = CGAffineTransform(translationX: -toVC.view.bounds.width, y: 0)
        } completion: { (finished) in
//            toVC?.view.alpha = 1
            
            transitionContext.completeTransition(true)
        }
    }
    
    
    
    func animationEnded(_ transitionCompleted: Bool) {
//        transitionDriver = nil
    }
}
