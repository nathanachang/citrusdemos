import SwiftUI

// MARK: - Button Style Enum
enum CitrusButtonStyle {
    case primary
    case secondary
    case outlined
    case pink
    case gray
}

// MARK: - Button Size Enum
enum CitrusButtonSize {
    case compact
    case medium
    case large
    case full
}

// MARK: - CitrusButton Component
struct CitrusButton: View {
    // MARK: - Properties
    private let title: String
    private let action: () -> Void
    private let style: CitrusButtonStyle
    private let size: CitrusButtonSize
    private let icon: String?
    private let isDisabled: Bool
    
    // MARK: - Constants
    private let primaryColor = Color(hex: "#9747ff")
    private let secondaryColor = Color(hex: "#c77dff")
    private let pinkColor = Color(hex: "#ffbeff")
    private let grayColor = Color(hex: "#d4d4dc")
    
    // MARK: - Initializer
    init(
        title: String,
        style: CitrusButtonStyle = .primary,
        size: CitrusButtonSize = .medium,
        icon: String? = "scissors",
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.icon = icon
        self.isDisabled = isDisabled
        self.action = action
    }
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                // Icon
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: iconSize))
                }
                
                // Button text
                Text(title)
                    .font(.system(size: fontSize, weight: .medium))
                    .lineLimit(1)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: buttonWidth)
            .frame(height: buttonHeight)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        }
        .disabled(isDisabled)
    }
    
    // MARK: - Computed Properties
    private var backgroundColor: Color {
        if isDisabled {
            return grayColor
        }
        
        switch style {
        case .primary:
            return primaryColor
        case .secondary:
            return secondaryColor
        case .outlined:
            return Color.clear
        case .pink:
            return pinkColor
        case .gray:
            return grayColor
        }
    }
    
    private var foregroundColor: Color {
        if isDisabled {
            return .white
        }
        
        switch style {
        case .primary, .secondary, .gray:
            return .white
        case .outlined:
            return .black
        case .pink:
            return .black
        }
    }
    
    private var borderColor: Color {
        switch style {
        case .outlined:
            return Color.gray.opacity(0.3)
        default:
            return Color.clear
        }
    }
    
    private var borderWidth: CGFloat {
        switch style {
        case .outlined:
            return 1
        default:
            return 0
        }
    }
    
    private var fontSize: CGFloat {
        switch size {
        case .compact:
            return 14
        case .medium, .large, .full:
            return 16
        }
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .compact:
            return 14
        case .medium, .large, .full:
            return 16
        }
    }
    
    private var buttonHeight: CGFloat {
        switch size {
        case .compact:
            return 40
        case .medium, .large, .full:
            return 48
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .compact:
            return 12
        case .medium:
            return 16
        case .large, .full:
            return 20
        }
    }
    
    private var verticalPadding: CGFloat {
        return 12
    }
    
    private var cornerRadius: CGFloat {
        return 8
    }
    
    private var buttonWidth: CGFloat? {
        switch size {
        case .compact:
            return 80
        case .medium:
            return 160
        case .large:
            return 300
        case .full:
            return .infinity
        }
    }
}

// MARK: - Preview
struct CitrusButton_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 30) {
                Group {
                    Text("Primary Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", size: .compact) {}
                        CitrusButton(title: "[Text]", size: .medium) {}
                        CitrusButton(title: "[Text]", size: .large) {}
                    }
                    
                    CitrusButton(title: "[Text]", size: .full) {}
                }
                
                Group {
                    Text("Secondary Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", style: .secondary, size: .compact) {}
                        CitrusButton(title: "[Text]", style: .secondary, size: .medium) {}
                        CitrusButton(title: "[Text]", style: .secondary, size: .large) {}
                    }
                    
                    CitrusButton(title: "[Text]", style: .secondary, size: .full) {}
                }
                
                Group {
                    Text("Outlined Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", style: .outlined, size: .compact) {}
                        CitrusButton(title: "[Text]", style: .outlined, size: .medium) {}
                        CitrusButton(title: "[Text]", style: .outlined, size: .large) {}
                    }
                    
                    CitrusButton(title: "[Text]", style: .outlined, size: .full) {}
                }
                
                Group {
                    Text("Pink Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", style: .pink, size: .compact) {}
                        CitrusButton(title: "[Text]", style: .pink, size: .medium) {}
                        CitrusButton(title: "[Text]", style: .pink, size: .large) {}
                    }
                    
                    CitrusButton(title: "[Text]", style: .pink, size: .full) {}
                }
                
                Group {
                    Text("Gray Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", style: .gray, size: .compact) {}
                        CitrusButton(title: "[Text]", style: .gray, size: .medium) {}
                        CitrusButton(title: "[Text]", style: .gray, size: .large) {}
                    }
                    
                    CitrusButton(title: "[Text]", style: .gray, size: .full) {}
                }
                
                Group {
                    Text("Disabled Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", size: .compact, isDisabled: true) {}
                        CitrusButton(title: "[Text]", size: .medium, isDisabled: true) {}
                        CitrusButton(title: "[Text]", size: .large, isDisabled: true) {}
                    }
                    
                    CitrusButton(title: "[Text]", size: .full, isDisabled: true) {}
                }
            }
            .padding()
        }
    }
}
