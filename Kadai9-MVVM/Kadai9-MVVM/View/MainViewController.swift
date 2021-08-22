//
//  MainViewController.swift
//  Kadai9-MVVM
//
//  Created by 今村京平 on 2021/08/22.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    @IBOutlet private weak var prefectureLabel: UILabel!
    @IBOutlet private weak var inputButton: UIButton!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    private func setupBinding() {
        inputButton.rx.tap
            .bind(onNext: { [weak self] in
                let selectViewController = SelectViewController
                    .instantiate(selectPrefecture: { [weak self] in
                        self?.prefectureLabel.text = $0
                })
                let navigationController = UINavigationController(rootViewController: selectViewController)
                self?.present(navigationController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}
