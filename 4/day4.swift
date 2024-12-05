import Foundation

var res = 0

let fileContent = try! String(contentsOfFile: "./input4", encoding: .utf8)

let fileTest = """
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
"""

res += fileTest.components(separatedBy: "XMAS").count
res += fileTest.components(separatedBy: "SAMX").count

print("There's \(res) XMAS!")