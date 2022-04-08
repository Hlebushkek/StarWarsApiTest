//
//  UIViewControllerExt.swift
//  StarWarsApiTest
//
//  Created by Gleb Sobolevsky on 08.04.2022.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition();
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false)
    }
    
    func dismissDetail() {
        let transition = CATransition();
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
}
