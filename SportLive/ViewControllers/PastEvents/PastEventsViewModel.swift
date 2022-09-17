//
//  PastEventsViewModel.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 17/09/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol PastEventsViewModelDelegate {
    func eventsDidLoad()
}

class PastEventsViewModel {
    private let disposeBag = DisposeBag()
    var pastEventViewModels: [PastEventViewModel]
    var eventsDelegate:PastEventsViewModelDelegate!
    
    let numberOfSections: Int = 1
    var numberOfRowsInSection: Int {
        return pastEventViewModels.count
    }
    
    init() {
        self.pastEventViewModels = [PastEventViewModel]()
    }
}

extension PastEventsViewModel {
    func loadPastEvents() {
        let resource = Resource<[PastEventModel]>(url: URL(string: "https://us-central1-dazn-sandbox.cloudfunctions.net/getEvents")!)
        
        URLSession.load(resource: resource)
            .subscribe(onNext: { events in
                self.pastEventViewModels = events.map { event in
                    return PastEventViewModel(event: event)
                }
                
                DispatchQueue.main.async {
                    self.eventsDelegate.eventsDidLoad()
                }
            })
            .disposed(by: disposeBag)
    }
    
    func getEventForRowAt(_ index: Int) -> PastEventViewModel {
        return pastEventViewModels[index]
    }
}
