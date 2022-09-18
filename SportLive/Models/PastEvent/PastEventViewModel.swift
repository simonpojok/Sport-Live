//
//  PastEventViewModel.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 17/09/2022.
//

import Foundation
import RxSwift
import RxCocoa

struct PastEventViewModel {
    let event: PastEventModel
}

extension PastEventViewModel {
    var title: Observable<String> {
        return Observable<String>.just(event.title)
    }
    
    var subtitle: Observable<String> {
        return Observable<String>.just(event.subtitle)
    }
    
    var date: Observable<String> {
        return Observable<String>.just(event.date)
    }
    
    var image: Observable<String> {
        return Observable<String>.just(event.imageUrl)
    }
}
