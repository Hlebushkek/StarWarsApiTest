//
//  ViewController.swift
//  StarWarsApiTest
//
//  Created by Gleb Sobolevsky on 08.04.2022.
//

import UIKit

class CharactersVC: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var characters: [Character] = []
    var filteredCharacters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        
        setupSearchBar()
        getAllCharacters()
    }
    
    func getAllCharacters() {
        let dispatchQueue = DispatchQueue(label: "CHARACTERS_REQUEST")
        let dispatchGroup  = DispatchGroup()
        
        dispatchQueue.async {
            for i in 1...9 {
                dispatchGroup.enter()
                NetworkService.shared.getCharactersByPage(page: i, onSuccess: { (data) in
                    self.characters.append(contentsOf: data.results)
                    dispatchGroup.leave()
                }, onError: { (errorMessaage) in
                    debugPrint(errorMessaage)
                })
                dispatchGroup.wait(timeout: .distantFuture)
            }
            
            DispatchQueue.main.async {
                self.filteredCharacters = self.characters
                
                self.activityIndicator.stopAnimating()

                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
    }

}

extension CharactersVC: UISearchBarDelegate {
    func setupSearchBar() {
        searchBar.searchTextField.textColor = .white
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        f
    }
}

extension CharactersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as? CharacterCell else { return UITableViewCell() }
        
        cell.updateCharacter(name: characters[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailedVC = storyboard?.instantiateViewController(withIdentifier: "detailedCharacterVC") as? DetailedCharacterVC else { return }
        
        presentDetail(detailedVC)
        detailedVC.setupCharacter(character: characters[indexPath.row])
    }
}

