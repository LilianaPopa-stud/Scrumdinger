//
//  TrailingIconLabelStyle.swift
//  scrumdinger
//
//  Created by Liliana Popa on 29.01.2024.
//
import SwiftUI

struct TrailingIconLabelStyle: LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
}


extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self {Self() }
}
