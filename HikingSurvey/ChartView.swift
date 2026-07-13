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
    
    private var sortedResponses: [Response] {
        responses.sorted { $0.score < $1.score }
    }
    
    var body: some View {
        Chart(sortedResponses) { response in
            SectorMark(
                angle: .value("Type", 1),
                innerRadius: .ratio(0.75)
            )
                .foregroundStyle(by: .value("sentiment", response.sentiment))
        }
        .chartForegroundStyleScale([
            Sentiment.positive: Sentiment.positive.sentimentColor,
            Sentiment.negative: Sentiment.negative.sentimentColor,
            Sentiment.moderate: Sentiment.moderate.sentimentColor,
        ])
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    
                    Image(systemName: "figure.hiking")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: frame.height * 0.4)
                        .foregroundStyle(Color(.secondaryLabel))
                        .position(x: frame.midX, y: frame.midY)
                }
            }
        }
        .chartLegend(position: .trailing, alignment: .center)
        .frame(height: 200)
        .padding()
    }
}

#Preview {
    ContentView()
}
