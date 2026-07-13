//
//  ChartView.swift
//  HikingSurvey
//
//  Created by Ngoni Katsidzira  on 13/7/2026.
//

import SwiftUI
import Charts

struct ChartView: View {
    var responses: [Response]
    
    init(responses: [Response]) {
        self.responses = responses.sorted { $0.score < $1.score }
    }
    
    var body: some View {
        Chart(responses) { response in
            SectorMark(angle: .value("Type", 1))
                .foregroundStyle(by: .value("sentiment", response.sentiment))
        }
        .chartForegroundStyleScale([
            Sentiment.positive: Sentiment.positive.sentimentColor,
            Sentiment.negative: Sentiment.negative.sentimentColor,
            Sentiment.moderate: Sentiment.moderate.sentimentColor,
        ])
        .chartLegend(position: .trailing, alignment: .center)
        .frame(height: 200)
        .padding()
    }
}

#Preview {
    ContentView()
}
