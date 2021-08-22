//
//  Prefectures.swift
//  Kadai9-MVVM
//
//  Created by 今村京平 on 2021/08/22.
//

import RxSwift
import RxRelay

protocol PrefecturesModel {
    var prefecture: Observable<String> { get }
    func select(index: Int)
}

final class Prefectures: PrefecturesModel {

    enum Prefectures: Int {
        case tokyo = 0
        case kanagawa = 1
        case saitama = 2
        case tiba = 3

        var name: String {
            switch self {
            case .tokyo: return "東京都"
            case .kanagawa: return "神奈川県"
            case .saitama: return "埼玉県"
            case .tiba: return "千葉県"
            }
        }
    }

    private let prefectureRelay = PublishRelay<String>()

    var prefecture: Observable<String> {
        prefectureRelay.asObservable()
    }

    func select(index: Int) {
        guard let prefecture = Prefectures(rawValue: index) else { return }
        let prefectureString = prefecture.name
        prefectureRelay.accept(prefectureString)
    }
}
