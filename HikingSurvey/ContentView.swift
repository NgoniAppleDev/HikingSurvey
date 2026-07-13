//
//  ContentView.swift
//  HikingSurvey
//
//  Created by Ngoni Katsidzira  on 13/7/2026.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var textFieldIsFocused: Bool
    @State private var responses: [Response] = []
    @State private var responseText = ""
    var scorer = Scorer()
    
    var body: some View {
        VStack {
            Text("Opinions on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title.bold())
                .padding(.top, 24)
            
            ScrollView(showsIndicators: false) {
                ChartView(responses: responses)
                
                ForEach(responses) { response in
                    ResponseView(response: response)
                }
            }
            
            HStack {
                TextField("What do you think about hiking?", text: $responseText, axis: .vertical)
                    .focused($textFieldIsFocused)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5)
                
                Button("Done") {
                    guard !responseText.isTrimmedEmpty else { return }
                    
                    withAnimation {
                        saveResponse(text: responseText.trimmedString)
                    }
                    
                    responseText = ""
                    textFieldIsFocused = false
                }
                .buttonStyle(.glassProminent)
                .disabled(responseText.isTrimmedEmpty)
                .padding(.horizontal, 4)
            }
            .padding(.bottom, 8)
        }
        .onTapGesture {
            textFieldIsFocused = false
        }
        .onAppear {
            for response in Response.sampleResponses {
                saveResponse(text: response)
            }
        }
        .padding(.horizontal)
        .background(
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
        )
    }
    
    func saveResponse(text: String) {
        let score = scorer.score(text)
        let response = Response(text: text, score: score)
        responses.insert(response, at: 0)
    }
}

#Preview {
    ContentView()
}
