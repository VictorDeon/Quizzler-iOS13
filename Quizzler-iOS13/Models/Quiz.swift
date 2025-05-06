struct Quiz {
    var currentQuestion: Int = 0
    var score: Int = 0
    let questions: Array<Question> = [
        Question(
            "A slug's blood is green.",
            answer: true
        ),
        Question(
            "Approximately one quarter of human bones are in the feet.",
            answer: true
        ),
        Question(
            "The total surface area of two human lungs is approximately 70 square metres.",
            answer: true
        ),
        Question(
            "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
            answer: true
        ),
        Question(
            "In London, UK, if you happen to die in the House of Parliament, you are technically " +
            "entitled to a state funeral, because the building is considered too sacred a place.",
            answer: false
        ),
        Question(
            "It is illegal to pee in the Ocean in Portugal.",
            answer: true
        ),
        Question(
            "You can lead a cow down stairs but not up stairs.",
            answer: false
        ),
        Question(
            "Google was originally called 'Backrub'.",
            answer: true
        ),
        Question(
            "Buzz Aldrin's mother's maiden name was 'Moon'.",
            answer: true
        ),
        Question(
            "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
            answer: false
        ),
        Question(
            "No piece of square dry paper can be folded in half more than 7 times.",
            answer: false
        ),
        Question(
            "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.",
            answer: true
        )
    ]
    
    mutating func check(answer: String) -> Bool {
        let correctAnswer: String = String(self.questions[self.currentQuestion].answer).capitalized

        if (answer == correctAnswer) {
            print("Você Acertou!")
            score += 1
            return true
        } else {
            print("Você Errou!")
            return false
        }
    }
    
    func getQuestionText() -> String {
        return questions[currentQuestion].title
    }
    
    func getProgress() -> Float {
        return Float(currentQuestion + 1) / Float(questions.count)
    }
    
    func getScore() -> String {
        return "\(score)/\(questions.count)"
    }
    
    // O self é immutable, então se quisermos modificar o valor de um atributo
    // dentro do struct precisamos inserir o mutating antes do método.
    mutating func nextQuestion() {
        if (currentQuestion + 1 < questions.count) {
            currentQuestion += 1
        } else {
            print("Quiz finalizou, voltando ao inicio.")
            currentQuestion = 0
            score = 0
        }
    }
}
