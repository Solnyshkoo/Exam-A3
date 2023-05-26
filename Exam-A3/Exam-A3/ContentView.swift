//
//  ContentView.swift
//  Exam-A3
//
//  Created by Ksenia Petrova on 26.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var weeks = WeekStore()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<weeks.allWeeks.count) { indexWeek in
                        VStack {
                      
                            TitleView(
                                year: 2023,
                                weekNumber: indexWeek
                            )
                                .frame(height: 80)
                                .padding(.bottom)
                            ScrollView(.horizontal, showsIndicators: true) {
                                
                                HStack(spacing: 5) {
                                    ForEach(0..<7) { index in
                                        CalenderDay(
                                            dayOfAWeek: weeks.dateToString(
                                                date: weeks.allWeeks[indexWeek].date[index],
                                                format: "EEE"
                                            ),
                                            number:
                                                weeks.dateToString(
                                                    date: weeks.allWeeks[indexWeek].date[index],
                                                    format: "d"
                                                ),
                                            month:
                                                weeks.dateToString(
                                                    date: weeks.allWeeks[indexWeek].date[index],
                                                    format: "MMMM"
                                                )
                                        )
                                            .frame(width: 300, height: 200)
                                            .padding()
                                            .background(weeks.isToday(
                                                date: weeks.allWeeks[indexWeek].date[index])
                                                        ? .red : .blue)
                                            .cornerRadius(15)
                                
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
