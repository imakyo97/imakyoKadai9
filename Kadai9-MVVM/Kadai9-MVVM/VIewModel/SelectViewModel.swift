//
//  SelectViewModel.swift
//  Kadai9-MVVM
//
//  Created by 今村京平 on 2021/08/22.
//

import RxSwift
import RxCocoa

protocol SelectViewModelInput {
    func didTapPrefecturesButton(index: Int)
    func didTapCancelButton()
}

protocol SelectViewModelOutput {
    var event: Driver<SelectViewModel.Event> { get }
}

protocol SelectViewModelType {
    var inputs: SelectViewModelInput { get }
    var outputs: SelectViewModelOutput { get }
}

final class SelectViewModel: SelectViewModelInput, SelectViewModelOutput {

    enum Event {
        case selectedPrefecture(String)
        case dismiss
    }

    private let eventRelay = PublishRelay<Event>()
    private let model: PrefecturesModel = Prefectures()
    private let disposeBag = DisposeBag()

    var event: Driver<Event> {
        eventRelay.asDriver(onErrorDriveWith: .empty())
    }

    init() {
        setupBinding()
    }

    private func setupBinding() {
        model.prefecture
            .map(Event.selectedPrefecture)
            .bind(to: eventRelay)
            .disposed(by: disposeBag)
    }

    func didTapPrefecturesButton(index: Int) {
        model.select(index: index)
        eventRelay.accept(.dismiss)
    }

    func didTapCancelButton() {
        eventRelay.accept(.dismiss)
        }
}

extension SelectViewModel: SelectViewModelType {
    var inputs: SelectViewModelInput {
        return self
    }

    var outputs: SelectViewModelOutput {
        return self
    }
}
