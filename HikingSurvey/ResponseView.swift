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
        HStack {
            Text(response.text)
                .padding(.trailing)
            
            Spacer()
            
            Image(systemName: response.sentiment.icon)
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(response.sentiment.sentimentColor.gradient)
                )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
        )
    }
}

#Preview {
    ResponseView(
        response: .init(text: "I enjoy hiking very much!", score: 1.0)
    )
}
