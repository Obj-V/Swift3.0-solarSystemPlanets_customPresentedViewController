//
//  popupViewAnimationController.swift
//  solarSystemPlanets_customPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 12/25/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class popupViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 4.0
    var isPresenting = true
    var originalFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let animatedVC = isPresenting ? toVC! : fromVC!
        
        let initialFrame = isPresenting ? originalFrame : animatedVC.view.frame
        let finalFrame = isPresenting ? animatedVC.view.frame : originalFrame
        
        let scaleX = isPresenting ? (initialFrame.width)/(finalFrame.width) : (finalFrame.width)/(initialFrame.width)
        let scaleY = isPresenting ? (initialFrame.height)/(finalFrame.height) : (finalFrame.height)/(initialFrame.height)
        let scaleTransform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        
        if isPresenting {
            animatedVC.view.transform = scaleTransform
            animatedVC.view.center = CGPoint(x: (initialFrame.midX), y: (initialFrame.midY))
            containerView.addSubview((animatedVC.view)!)
        }
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: [], animations: {
            animatedVC.view.transform = self.isPresenting ? CGAffineTransform.identity : scaleTransform
            animatedVC.view.frame = finalFrame
            }) { (_) in
                transitionContext.completeTransition(true)
        }
    }
}
