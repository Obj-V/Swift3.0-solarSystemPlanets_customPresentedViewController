//
//  PlanetModel.swift
//  solarSystemPlanets_customPresentedViewController
//
//  Created by Virata Yindeeyoungyeon on 12/24/16.
//  Copyright © 2016 ObjV. All rights reserved.
//

import UIKit

struct PlanetModel {
    
    let name : String
    let imageName : String
    let description : String
    
    static func allPlanets() -> [PlanetModel] {
        
        return [PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf"),
                PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf"),
                PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf"),
                PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf"),
                PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf"),
                PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf"),
                PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf"),
                PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf"),
                PlanetModel(name: "Test", imageName: "galaxy", description: "asdfasdfasdfadfsf")
        ]
    }

}
