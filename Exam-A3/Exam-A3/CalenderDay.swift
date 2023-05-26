import SwiftUI
struct CalenderDay: View {
    var dayOfAWeek: String
    var number: String
    var month: String
    var body: some View {
        VStack(alignment: .center) {
            Text(dayOfAWeek)
                .font(.headline)
                .fontWeight(.light)
                .foregroundColor(ColorPalette.text)
                .padding(.bottom)
            HStack(alignment: .center) {
                Text(number)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(ColorPalette.text)
                Text(month)
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(ColorPalette.text)
            }
        }
    }
}
