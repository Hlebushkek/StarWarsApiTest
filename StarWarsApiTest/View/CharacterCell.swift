//
//  CharacterCell.swift
//  StarWarsApiTest
//
//  Created by Gleb Sobolevsky on 08.04.2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
        
    func updateCharacter(name: String) {
        nameLabel.text = name
    }
}
