//
//  URLSesssion+Extension.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 17/09/2022.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLSession {
    static func load<T>(resource: Resource<T>) -> Observable<T> {
        return Observable.just(resource.url)
            .flatMap { url in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { data in
                return try JSONDecoder().decode(T.self, from: data)
            }
    }
}
