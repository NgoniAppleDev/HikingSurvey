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
            
            ScrollView {
                ForEach(responses) { response in
                    ResponseView(response: response)
                }
            }
            
            HStack {
                TextField("What do you think about hiking?", text: $responseText, axis: .vertical)
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
        .onAppear {
            for response in Response.sampleResponses {
                saveResponse(text: response)
            }
        }
        .padding(.horizontal)
        .background(Color(white: 0.94))
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
