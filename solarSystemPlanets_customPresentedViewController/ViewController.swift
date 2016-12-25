//
//  ViewController.swift
//  solarSystemPlanets_customPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 12/4/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        setupScrollView()
    }
}

extension ViewController : UIScrollViewDelegate {
    func setupScrollView() {
        let imageWidth = scrollView.bounds.size.width/3
        let imageHeight = scrollView.bounds.size.height
        let numberOfPlanets = PlanetModel.allPlanets().count
        scrollView.contentSize = CGSize(width: CGFloat(numberOfPlanets) * imageWidth, height: imageHeight);
        scrollView.isScrollEnabled = true
        scrollView.bounces = true
        
        for i in 0..<numberOfPlanets {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i) * imageWidth, y: 0, width: imageWidth, height: imageHeight))
            imageView.image = UIImage(named: "galaxy")
            imageView.tag = i
            imageView.isUserInteractionEnabled = true
            imageView.layer.cornerRadius = 20
            imageView.layer.masksToBounds = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedImageView(_:))))
            scrollView.addSubview(imageView)
        }
    }
    
    func tappedImageView(_ tap:UITapGestureRecognizer) {
        let tappedImg = tap.view as? UIImageView
        print("\(tappedImg?.tag)")
    }
    
}

