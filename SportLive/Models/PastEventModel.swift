//
//  PastEventModel.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 17/09/2022.
//

import Foundation


struct PastEventModel: Identifiable, Decodable {
    let id: String
    let title: String
    let subtitle: String
    let date: String
    let imageUrl: String
    let videoUrl: String
}
