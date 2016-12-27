//
//  popupViewAnimationController.swift
//  solarSystemPlanets_customPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 12/25/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class popupViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 1.0
    var isPresenting = true
    var originalFrame = CGRect.zero
    var planetViewFrame = CGRect.zero
    var planetImageName = "earth"
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let animatedVC = isPresenting ? toVC! : fromVC!
        containerView.addSubview((toVC?.view)!)
        containerView.bringSubview(toFront: animatedVC.view)
        
        //Dismissing PlanetDetailViewController
        //Add an imageView on top to hide the text when it pops back
        var planetImageView:UIImageView?
        var planetImageViewScale:CGAffineTransform?
        if !isPresenting {
            planetImageView = UIImageView(image: UIImage(named: planetImageName))
            planetImageView?.frame = planetViewFrame
            containerView.insertSubview(planetImageView!, aboveSubview: animatedVC.view)
            planetImageViewScale = CGAffineTransform(scaleX: originalFrame.width/planetViewFrame.width, y:originalFrame.height/planetViewFrame.height)
        }
        
        //Set initial vars for animatedView
        let initialFrame = isPresenting ? originalFrame : animatedVC.view.frame
        let finalFrame = isPresenting ? animatedVC.view.frame : originalFrame
        let scaleX = isPresenting ? (initialFrame.width)/(finalFrame.width) : (finalFrame.width)/(initialFrame.width)
        let scaleY = isPresenting ? (initialFrame.height)/(finalFrame.height) : (finalFrame.height)/(initialFrame.height)
        let scaleTransform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        if isPresenting {
            animatedVC.view.transform = scaleTransform
            animatedVC.view.center = CGPoint(x: (initialFrame.midX), y: (initialFrame.midY))
        } else {
            animatedVC.view.transform = CGAffineTransform.identity
        }
        
        //Animate
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: [], animations: {
            animatedVC.view.transform = self.isPresenting ? CGAffineTransform.identity : scaleTransform
            animatedVC.view.frame = finalFrame
            if !self.isPresenting { //The planetImageView will fit right back in the scrollView after dismissing
                planetImageView?.transform = planetImageViewScale!
                planetImageView?.frame = self.originalFrame
            }
            }) { (_) in
                transitionContext.completeTransition(true)
        }
    }
}
