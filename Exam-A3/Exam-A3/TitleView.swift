import SwiftUI
struct TitleView: View {
    
    var year: Int
    var weekNumber: Int
    var body: some View {
        VStack(alignment: .leading) {
            Text(String(year))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(ColorPalette.text)
            Text("Week number: " + String(weekNumber))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(ColorPalette.text)
        }
        
    }
}
