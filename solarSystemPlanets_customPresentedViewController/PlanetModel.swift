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
        
        return [PlanetModel(name: "Mercury", imageName: "mercury", description: "Mercury is the closest planet to our Sun, the smallest of the eight planets, and one of the most extreme worlds in our Solar Systems. Named after the Roman messenger of the gods, the planet is one of a handful that can be viewed without the aid of a telescope. As such, it has played an active role in the mythological and astrological systems of many cultures."),
                PlanetModel(name: "Venus", imageName: "venus", description: "As the morning star, the evening star, and the brightest natural object in the sky (after the Moon), human beings have been aware of Venus since time immemorial. Even though it would be many thousands of years before it was recognized as being a planet, its has been a part of human culture since the beginning of recorded history."),
                PlanetModel(name: "Earth", imageName: "earth", description: "In addition to being the birthplace of humanity and the cradle of human civilization, Earth is the only known planet in our Solar System that is capable of sustaining life. As a terrestrial planet, Earth is located within the Inner Solar System between between Venus and Mars (which are also terrestrial planets). This place Earth in a prime location with regards to our Sun’s Habitable Zone."),
                PlanetModel(name: "Mars", imageName: "mars", description: "Mars, otherwise known as the “Red Planet”, is the fourth planet of our Solar System and the second smallest (after Mercury). Named after the Roman God of war, its nickname comes from its reddish appearance, which has to do with the amount of iron oxide prevalent on its surface. Every couple of years, when Mars is at opposition to Earth (i.e. when the planet is closest to us), it is most visible in the night sky."),
                PlanetModel(name: "Jupiter", imageName: "jupiter", description: "Ever since the invention of the telescope four hundred years ago, astronomers have been fascinated by the gas giant known as Jupiter. Between its constant, swirling clouds, its many, many moons, and its Giant Red Spot, there are many things about this planet that are both delightful and fascinating."),
                PlanetModel(name: "Saturn", imageName: "saturn", description: "The farthest planet from the Sun that can be observed with the naked eye, the existence of Saturn has been known for thousands of years. And much like all celestial bodies that can be observed with the aid of instruments – i.e. Mercury, Venus, Mars, Jupiter and the Moon – it has played an important role in the mythology and astrological systems of many cultures."),
                PlanetModel(name: "Uranus", imageName: "uranus", description: "Uranus, which takes its name from the Greek God of the sky, is a gas giant and the seventh planet from our Sun. It is also the third largest planet in our Solar System, ranking behind Jupiter and Saturn. Like its fellow gas giants, it has many moons, a ring system, and is primarily composed of gases that are believed to surround a solid core."),
                PlanetModel(name: "Neptune", imageName: "neptune", description: "Neptune is the eight planet from our Sun, one of the four gas giants, and one of the four outer planets in our Solar System. Since the “demotion” of Pluto by the IAU to the status of a dwarf planet – and/or Plutoid and Kuiper Belt Object (KBO) – Neptune is now considered to be the farthest planet in our Solar System."),
                PlanetModel(name: "Pluto", imageName: "pluto", description: "After being officially discovered by Clyde Tombaugh in 1930, Pluto spent close to a century being thought of as the ninth planet of our Solar System. In 2006, it was reclassified as a “dwarf planet” due to the discovery of other Trans-Neptunian Objects (TNOs) of comparable size. However, that does not change its significance in our galaxy. In addition to being the largest TNO, it is the largest and second-most massive dwarf planet of our Solar System.")
        ]
    }

}
