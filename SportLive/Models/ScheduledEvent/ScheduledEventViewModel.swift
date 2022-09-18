//
//  ScheduledEventViewModel.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 18/09/2022.
//

import Foundation
import RxSwift
import RxCocoa

struct ScheduledEventViewModel {
    let scheduledEvent: ScheduledEventModel
}


extension ScheduledEventViewModel {
    var title: Observable<String> {
        return Observable<String>.just(scheduledEvent.title)
    }
    
    var subtitle: Observable<String> {
        return Observable<String>.just(scheduledEvent.subtitle)
    }
    
    var date: Observable<String> {
        return Observable<String>.just(scheduledEvent.date)
    }
    
    var imageUrl: Observable<String> {
        return Observable<String>.just(scheduledEvent.imageUrl)
    }
}
