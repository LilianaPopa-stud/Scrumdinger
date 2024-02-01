//
//  ThemeView.swift
//  scrumdinger
//
//  Created by Liliana Popa on 29.01.2024.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .foregroundColor(theme.accentColor)
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
