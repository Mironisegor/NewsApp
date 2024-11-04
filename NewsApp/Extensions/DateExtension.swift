//
//  DateExtension.swift
//  NewsApp
//
//  Created by Vladimir Fursov on 04.11.2024.
//

import Foundation

extension Date {
    func formatDate() -> String {
        return formatted(.dateTime.hour().minute().day().month().year())
    }
}
