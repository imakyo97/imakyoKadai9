//
//  ViewController.swift
//  Kadai9
//
//  Created by 今村京平 on 2021/05/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var placeLabel: UILabel!
    
    @IBAction private func exit(segue: UIStoryboardSegue) {
    }
    @IBAction private func selectPlace (segue: UIStoryboardSegue) {
        
        guard let selectVC = segue.source as? SelectViewController else { return }
        placeLabel.text = selectVC.selectedPrefectureName
    }
}

