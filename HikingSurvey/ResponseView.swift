//
//  ResponseView.swift
//  HikingSurvey
//
//  Created by Ngoni Katsidzira  on 13/7/2026.
//

import SwiftUI

struct ResponseView: View {
    
    var response: Response
    
    var body: some View {
        Text(response.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
            )
        Text(response.score, format: .number.rounded(increment: 0.1))
    }
}

#Preview {
    ResponseView(
        response: .init(text: "I enjoy hiking very much!", score: 1.0)
    )
}
