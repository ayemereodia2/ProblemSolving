import UIKit

//Date
//Date is time since reference date of january 01, 2001

let now = Date()

print(now.timeIntervalSinceReferenceDate)

print(now.description(with: Locale(identifier: "en-US")))
