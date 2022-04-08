//
//  DetailedCharacterVC.swift
//  StarWarsApiTest
//
//  Created by Gleb Sobolevsky on 08.04.2022.
//

import UIKit

class DetailedCharacterVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var worldLabel: UILabel!
    
    var planet: Planet?
    
    func setupCharacter(character: Character) {
        NetworkService.shared.getPlanet(URL_PLANET: character.homeworld, onSuccess: { (data) in
            self.planet = data
            self.worldLabel.text = self.planet?.name
            self.setupPlanetLabelRedirect()
        }, onError: { (errorMessage) in
            debugPrint(errorMessage)
        })
        
        nameLabel.text = character.name
        heightLabel.text = character.height
        massLabel.text = character.mass
    }
    
    private func setupPlanetLabelRedirect() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        worldLabel.addGestureRecognizer(longPressRecognizer)
        worldLabel.isUserInteractionEnabled = true
    }
    
    @objc private func longPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == .began, let planet = planet {
            guard let detailedVC = storyboard?.instantiateViewController(withIdentifier: "detailedPlanetVC") as? DetailedPlanetVC else { return }
            
            presentDetail(detailedVC)
            detailedVC.setupPlanet(planet: planet)
        }
    }
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
}
