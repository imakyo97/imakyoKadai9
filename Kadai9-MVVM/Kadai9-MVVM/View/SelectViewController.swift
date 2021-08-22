//
//  SelectViewController.swift
//  Kadai9-MVVM
//
//  Created by 今村京平 on 2021/08/22.
//

import UIKit
import RxSwift
import RxCocoa

final class SelectViewController: UIViewController {

    static func instantiate(selectPrefecture: @escaping (String) -> Void) -> SelectViewController {
        UIStoryboard(name: "Select", bundle: nil)
            .instantiateInitialViewController(creator: { coder in
            SelectViewController(coder: coder, selectPrefecture: selectPrefecture)
        })!
    }

    init?(coder: NSCoder, selectPrefecture: @escaping (String) -> Void) {
        self.selectPrefecture = selectPrefecture
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet private weak var cancelButton: UIBarButtonItem!

    @IBOutlet private weak var tokyoButton: UIButton!
    @IBOutlet private weak var kanagawaButton: UIButton!
    @IBOutlet private weak var saitamaButton: UIButton!
    @IBOutlet private weak var tibaButton: UIButton!

    private let viewModel: SelectViewModelType = SelectViewModel()
    private let disposeBag = DisposeBag()

    private let selectPrefecture: (String) -> Void

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    private func setupBinding() {
        cancelButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.viewModel.inputs.didTapCancelButton()
            })
            .disposed(by: disposeBag)

        tokyoButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.viewModel.inputs.didTapPrefecturesButton(index: 0)
            })
            .disposed(by: disposeBag)

        kanagawaButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.viewModel.inputs.didTapPrefecturesButton(index: 1)
            })
            .disposed(by: disposeBag)

        saitamaButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.viewModel.inputs.didTapPrefecturesButton(index: 2)
            })
            .disposed(by: disposeBag)

        tibaButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.viewModel.inputs.didTapPrefecturesButton(index: 3)
            })
            .disposed(by: disposeBag)

        viewModel.outputs.event
            .drive(onNext: { [weak self] event in
                switch event {
                case .selectedPrefecture(let prefecture):
                    self?.selectPrefecture(prefecture)
                case .dismiss:
                    self?.dismiss(animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)
    }
}
