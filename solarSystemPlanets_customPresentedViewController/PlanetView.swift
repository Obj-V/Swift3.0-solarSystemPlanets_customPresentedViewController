//
//  PlanetView.swift
//  solarSystemPlanets_customPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 12/5/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit
@IBDesignable
class PlanetView: UIView {

    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let myview = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        myview.frame = bounds
        addSubview(myview)
    }

}
