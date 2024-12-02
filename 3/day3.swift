import Foundation

var result = 0

let fileContent = try! String(contentsOfFile: "./input3", encoding: .utf8)

let test = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

var todont = fileContent.components(separatedBy: "don't()")

result += countCorrect(todont[0])

todont.forEach { dont in
    var todos = dont.components(separatedBy: "do()")
    todos.removeFirst()
    guard todos.count > 0 else { return }

    todos.forEach { todo in
        result += countCorrect(todo)
    }
}

print(result)

func countCorrect(_ toCheck: String) -> Int {
    var res = 0

    let pattern = #"mul\((\d+),(\d+)\)"#
    let regex = try! NSRegularExpression(pattern: pattern)
    let matches = regex.matches(in: toCheck, range: NSRange(toCheck.startIndex..., in: toCheck))

    matches.forEach { match in
        let first = Int(toCheck[Range(match.range(at: 1), in: toCheck)!])!
        let second = Int(toCheck[Range(match.range(at: 2), in: toCheck)!])!
        res += first * second
    }
    return res
}