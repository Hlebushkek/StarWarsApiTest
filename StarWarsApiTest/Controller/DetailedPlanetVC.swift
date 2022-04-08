//
//  DetailedPlanetVC.swift
//  StarWarsApiTest
//
//  Created by Gleb Sobolevsky on 08.04.2022.
//

import UIKit

class DetailedPlanetVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rotationLabel: UILabel!
    @IBOutlet weak var orbitLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    func setupPlanet(planet: Planet) {
        nameLabel.text = planet.name
        rotationLabel.text = planet.rotation_period
        orbitLabel.text = planet.orbital_period
        populationLabel.text = planet.population
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
}
