import Foundation

var res = 0

let fileContent = try! String(contentsOfFile: "./input3", encoding: .utf8)

let pattern = #"mul\((\d+),(\d+)\)"#

let regex = try! NSRegularExpression(pattern: pattern)
let matches = regex.matches(in: fileContent, range: NSRange(fileContent.startIndex..., in: fileContent))

matches.forEach { match in
    let first = Int(fileContent[Range(match.range(at: 1), in: fileContent)!])!
    let second = Int(fileContent[Range(match.range(at: 2), in: fileContent)!])!
    res += first * second
}

print(res)