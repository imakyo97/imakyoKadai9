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
        selectPrefecture(prefectureName: "東京都", sender: sender)
    }

    @IBAction private func kanagawaBtn(_ sender: Any) {
        selectPrefecture(prefectureName: "神奈川県", sender: sender)
    }

    @IBAction private func saitamaBtn(_ sender: Any) {
        selectPrefecture(prefectureName: "埼玉県", sender: sender)
    }

    @IBAction private func tibaBtn(_ sender: Any) {
        selectPrefecture(prefectureName: "千葉県", sender: sender)
    }

    private func selectPrefecture(prefectureName: String, sender: Any) {
        selectedPrefectureName = prefectureName
        performSegue(withIdentifier: "exit", sender: sender)
    }
}
