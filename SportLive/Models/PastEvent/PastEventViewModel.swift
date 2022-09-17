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
    
    var image: Observable<UIImage> {
        guard let url = URL(string: event.imageUrl) else {
            return Observable<UIImage>.just(UIImage(systemName: "photo.artframe")!)
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return Observable<UIImage>.just(UIImage(systemName: "photo.artframe")!)
        }
        
        return Observable<UIImage>.just(UIImage(data: data)!)
    }
}
