//
//  PlanetDetailViewController.swift
//  solarSystemPlanets_customPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 12/4/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    @IBOutlet weak var planetViewContainer: UIView!
    @IBOutlet weak var planetDetailTextView: UITextView!
    
    var planetView : PlanetView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPlanetView()
    }
    
    private func loadPlanetView() {
        let bundle = Bundle(for: type(of: PlanetView()))
        let nib = UINib(nibName: String(describing: type(of: PlanetView())), bundle: bundle)
        if let planetXibView = nib.instantiate(withOwner: self, options: nil)[0] as? PlanetView {
            self.planetView = planetXibView
            self.planetView?.frame = self.planetViewContainer.bounds
            self.planetView?.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
            self.planetViewContainer.addSubview(self.planetView!)
        }
    }
}
