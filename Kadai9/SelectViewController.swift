//
//  SelectViewController.swift
//  Kadai9
//
//  Created by 今村京平 on 2021/05/16.
//

import UIKit

class SelectViewController: UIViewController {
    
    private(set) var selectedPrefectureName: String?
    @IBAction private func tokyoBtn(_ sender: Any) {
        selectedPrefecture(prefectureName: "東京都", sender: sender)
    }
    @IBAction private func kanagawaBtn(_ sender: Any) {
        selectedPrefecture(prefectureName: "神奈川県", sender: sender)
    }
    @IBAction private func saitamaBtn(_ sender: Any) {
        selectedPrefecture(prefectureName: "埼玉県", sender: sender)
    }
    @IBAction private func tibaBtn(_ sender: Any) {
        selectedPrefecture(prefectureName: "千葉県", sender: sender)
    }
    private func selectedPrefecture(prefectureName: String, sender: Any) {
        selectedPrefectureName = prefectureName
        performSegue(withIdentifier: "exit", sender: sender)
    }
}



