//
//  String+Extensions.swift
//  HikingSurvey
//
//  Created by Ngoni Katsidzira  on 13/7/2026.
//

import Foundation

extension String {
    
    var isTrimmedEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var trimmedString: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
