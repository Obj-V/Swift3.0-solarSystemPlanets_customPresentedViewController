//
//  PlanetDetailViewController.swift
//  solarSystemPlanets_customPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 12/4/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    @IBOutlet weak var planetView: PlanetView!
    @IBOutlet weak var planetDetailTextView: UITextView!
    
    var originalFrame:CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self
    }
}

extension PlanetDetailViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transitionAnimator = popupViewAnimationController()
        transitionAnimator.isPresenting = true
        transitionAnimator.originalFrame = self.originalFrame
        return transitionAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let transitionAnimator = popupViewAnimationController()
        transitionAnimator.isPresenting = false
        transitionAnimator.originalFrame = self.originalFrame
        return transitionAnimator
    }
}
