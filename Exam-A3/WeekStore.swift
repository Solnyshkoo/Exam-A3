import SwiftUI

struct WeekValue: Identifiable {
    var id: Int
    var date : [Date]
}

class WeekStore : ObservableObject {
    @Published var allWeeks : [WeekValue] = []
    @Published var currentWeek: [Date] = []
    @Published var currentDate : Date = Date()

    init() {
        appendAll()
    }
    
    func appendAll() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var firstDay = formatter.date(from: "2023/01/01")!
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "yyyy/MM/dd"
        let endDate = formatter2.date(from: "2024/01/01")!
        var index = 0
        while firstDay <= endDate {
            index += 1
            fetchCurrentWeek(today: firstDay, index: index)
            firstDay = Calendar.current.date(byAdding: .day, value: 7, to: firstDay)!
        }
    }

    func dateToString(date: Date,format: String)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func isToday(date:Date)->Bool{
           let calendar = Calendar.current
           return calendar.isDate(currentDate, inSameDayAs: date)
       }

    func fetchCurrentWeek(today: Date, index: Int) {
        currentWeek.removeAll()
        var calendar = Calendar(identifier: .gregorian)
    
        calendar.firstWeekday = 7
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!
        
        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek){
                currentWeek.append(weekday)
            }
        }
        allWeeks.append(WeekValue(id: index, date: currentWeek))
    }

}
