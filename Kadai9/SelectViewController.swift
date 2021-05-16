//
//  SelectViewController.swift
//  Kadai9
//
//  Created by 今村京平 on 2021/05/16.
//

import UIKit

class SelectViewController: UIViewController {
    
    public var place = ""
    @IBAction private func tokyoBtn(_ sender: Any) {
        place = "東京都"
        performSegue(withIdentifier: "exit", sender: sender)
    }
    @IBAction private func kanagawaBtn(_ sender: Any) {
        place = "神奈川県"
        performSegue(withIdentifier: "exit", sender: sender)
    }
    @IBAction private func saitamaBtn(_ sender: Any) {
        place = "埼玉県"
        performSegue(withIdentifier: "exit", sender: sender)
    }
    @IBAction private func tibaBtn(_ sender: Any) {
        place = "千葉県"
        performSegue(withIdentifier: "exit", sender: sender)
    }
}



