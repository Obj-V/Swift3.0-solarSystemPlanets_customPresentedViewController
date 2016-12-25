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
    
    var imageViewArray:Array<UIImageView>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        imageViewArray = Array()
        setupScrollView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if imageViewArray != nil {
            adjustScrollViewSubviews()
        }
    }
}

extension ViewController : UIScrollViewDelegate {
    func setupScrollView() {
        let numberOfPlanets = PlanetModel.allPlanets().count
        scrollView.isScrollEnabled = true
        scrollView.bounces = true
        scrollView.backgroundColor = UIColor.black
        scrollView.delegate = self
        
        for i in 0..<numberOfPlanets {
            let imageView = UIImageView(image: UIImage(named: "mercury"))
            imageView.tag = i
            imageView.isUserInteractionEnabled = true
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedImageView(_:))))
            imageViewArray.append(imageView)
            scrollView.addSubview(imageView)
        }
    }
    
    func adjustScrollViewSubviews() {
        let imageWidth = scrollView.bounds.size.width/3
        let imageHeight = scrollView.bounds.size.height
        let numberOfPlanets = PlanetModel.allPlanets().count
        scrollView.contentSize = CGSize(width: CGFloat(numberOfPlanets) * imageWidth, height: imageHeight);
        
        for i in 0..<numberOfPlanets {
            let imgView = imageViewArray[i]
            imgView.frame = CGRect(x: CGFloat(i) * imageWidth, y: 0, width: imageWidth, height: imageHeight)
        }
    }
    
    func tappedImageView(_ tap:UITapGestureRecognizer) {
        let tappedImg = tap.view as? UIImageView
        print("\(tappedImg?.tag)")
        let planetDetailVC = storyboard!.instantiateViewController(withIdentifier: "PlanetDetailViewController") as! PlanetDetailViewController
        planetDetailVC.originalFrame = view.convert((tappedImg?.frame)!, from: scrollView)
        self.present(planetDetailVC, animated: true, completion: nil)
    }
    
    func snapScroll() {
        let imageWidth = scrollView.bounds.size.width/3
        let index:Int = Int((scrollView.contentOffset.x + imageWidth/2) / imageWidth)
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset = CGPoint(x: CGFloat(index)*imageWidth, y: 0)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            snapScroll()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        snapScroll()
    }
}

