//
//  ScheduledEventsViewModel.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 18/09/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol ScheduledEventsProtocol {
    func eventsDidLoad()
}

class ScheduledEventsViewModel {
    var eventsDelegate: ScheduledEventsProtocol!
    private let disposeBag = DisposeBag()
    private var events: [ScheduledEventViewModel]
    
    var numberOfSections: Int = {
        return 1
    }()
    
    var numberOfRowsInSection: Int {
        return events.count
    }
    
    init() {
        self.events = [ScheduledEventViewModel]()
    }
}


extension ScheduledEventsViewModel {
    func loadScheduleEvents() {
        let resourse = Resource<[ScheduledEventModel]>(url: URL(string: "https://us-central1-dazn-sandbox.cloudfunctions.net/getSchedule")!)
        
        URLSession.load(resource: resourse)
            .subscribe(onNext: { events in
                self.events = events.map { e in
                    return ScheduledEventViewModel(scheduledEvent: e)
                }
                
                DispatchQueue.main.async {
                    self.eventsDelegate.eventsDidLoad()
                }
            }).disposed(by: disposeBag)
    }
    
    func getEventForRowAt(_ index: Int) -> ScheduledEventViewModel {
        return events[index]
    }
}
