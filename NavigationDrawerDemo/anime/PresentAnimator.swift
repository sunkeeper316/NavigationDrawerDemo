

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
        let toVC = transitionContext.viewController(forKey: .to)
        let fromVC = transitionContext.viewController(forKey: .from)
//        let fromVC = transitionContext.viewController(forKey: .from)
//        toVC?.view.layer.mask = nil
        toVC?.view.frame.origin = CGPoint(x: -(toVC?.view.bounds.width)!, y: 64)
//        toVC?.view.frame = CGRect(x: -(toVC?.view.bounds.width)!, y: 44, width: (fromVC?.view.frame.width)!, height: (fromVC?.view.frame.height)! - 44)
//        print(fromVC?.navigationController?.navigationBar.frame.size.height)
        transitionContext.containerView.addSubview((toVC?.view!)!)
        UIView.animate(withDuration: 0.5) {
            print("animate")
//            toVC?.view.alpha = 0
//            print(toVC?.view.alpha)
//            print(toVC?.view)
            toVC?.view.transform = CGAffineTransform(translationX: 200, y: 0)
        } completion: { (finished) in
//            toVC?.view.alpha = 1
            
            transitionContext.completeTransition(true)
        }
    }
    
    
    
    func animationEnded(_ transitionCompleted: Bool) {
//        transitionDriver = nil
    }
}
