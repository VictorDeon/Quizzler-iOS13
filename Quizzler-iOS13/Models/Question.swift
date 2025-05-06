import Foundation

struct Question {
    let title: String
    let answer: Bool
    
    init(_ title: String, answer: Bool) {
        self.title = title
        self.answer = answer
    }
}
