import Foundation

let fileContent = try! String(contentsOfFile: "./input2", encoding: .utf8)
let lines = fileContent.split(separator: "\n")

var safeLines = 0

lines.forEach { line in
    let report = line.split(separator: " ").compactMap { Int($0) }
    guard report.count >= 2 else { return }

    if isSafe(report) {
        safeLines += 1
    } else {
        for i in 0 ..< report.count {
            if isSafe(report, skip: i) {
                safeLines += 1
                break
            }
        }
    }
}

func isSafe(_ report: [Int], skip: Int = -1) -> Bool {
    let isIncrement = report[0] < report[1]

    for i in 0..<report.count {
        if i == skip { continue }

        let diff = abs(report[i] - report[i > 0 ? i - 1 : i + 1])

        if diff > 3 
            || diff < 1 
            || (i > 0 && ((isIncrement && report[i] < report[i - 1]) 
                || (!isIncrement && report[i] > report[i - 1]))) {
            break
        }
        if i == report.count - 1 {
            return true
        }
    }
    return false
}

print("There's \(safeLines) safe lines.")