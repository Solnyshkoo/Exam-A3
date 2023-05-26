import Foundation
import SwiftUI

class ColorPalette {
    @Environment(\.colorScheme) var colorScheme
    static var mainBackground: Color {
        Color(
            UIColor { colorScheme in
                switch colorScheme.userInterfaceStyle {
                case .dark:
                    return UIColor(.black)
                default:
                    return UIColor(.white)
                }
            }
        )
    }

    static var text: Color {
        Color(
            UIColor { colorScheme in
                switch colorScheme.userInterfaceStyle {
                case .dark:
                    return UIColor(.white)
                default:
                    return UIColor(.black)
                }
            }
        )

    }
}
