var students: [String: Int] = ["Perizat": 100, "Ainel": 92, "Saniya": 78,"Nurtleu": 45,"Dana": 78
]

let scores = Array(students.values)

let total = scores.reduce(0, +)
let average = Double(total) / Double(scores.count)
let highest = scores.max() ?? 0
let lowest = scores.min() ?? 0

print("Average Score: \(average)")
print("Highest Score: \(highest)")
print("Lowest Score: \(lowest)")
print("\nStudent Results:")

for (name, score) in students {
    if Double(score) >= average {
        print("\(name): \(score) → Above or equal to average")
    } else {
        print("\(name): \(score) → Below average")
    }
}