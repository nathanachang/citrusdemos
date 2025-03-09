//
//  CitrusButtons.swift
//  CitrusUI
//
//  Created by Paul Minyoo Kim on 3/9/25.
//

import SwiftUI

// MARK: - Button Style Enum
enum CitrusButtonStyle {
    case filled
    case outlined
    case bare
}

// MARK: - Button Size Enum
enum CitrusButtonSize {
    case large
    case medium
    case small
}

// MARK: - CitrusButton Component
struct CitrusButton: View {
    // MARK: - Properties
    private let title: String
    private let action: () -> Void
    private let style: CitrusButtonStyle
    private let size: CitrusButtonSize
    private let isFullWidth: Bool
    private let leadingIcon: String?
    private let trailingIcon: String?
    private let isDisabled: Bool
    
    // MARK: - Constants
    private let accentColor = Color(hex: "#9747ff")
    
    // MARK: - Initializer
    init(
        title: String,
        style: CitrusButtonStyle = .filled,
        size: CitrusButtonSize = .medium,
        isFullWidth: Bool = false,
        leadingIcon: String? = nil,
        trailingIcon: String? = nil,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.isFullWidth = isFullWidth
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isDisabled = isDisabled
        self.action = action
    }
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                // Leading icon
                if let leadingIcon = leadingIcon {
                    Image(systemName: leadingIcon)
                        .font(.system(size: iconSize))
                }
                
                // Button text
                Text(title)
                    .font(.system(size: fontSize, weight: .medium))
                
                // Trailing icon
                if let trailingIcon = trailingIcon {
                    Image(systemName: trailingIcon)
                        .font(.system(size: iconSize))
                }
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.6 : 1.0)
    }
    
    // MARK: - Computed Properties
    private var backgroundColor: Color {
        switch style {
        case .filled:
            return accentColor
        case .outlined, .bare:
            return Color.clear
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .filled:
            return .white
        case .outlined, .bare:
            return accentColor
        }
    }
    
    private var borderColor: Color {
        switch style {
        case .outlined:
            return accentColor
        case .filled, .bare:
            return Color.clear
        }
    }
    
    private var borderWidth: CGFloat {
        switch style {
        case .outlined:
            return 1
        case .filled, .bare:
            return 0
        }
    }
    
    private var fontSize: CGFloat {
        switch size {
        case .large:
            return 16
        case .medium:
            return 14
        case .small:
            return 12
        }
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .large:
            return 18
        case .medium:
            return 16
        case .small:
            return 14
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .large:
            return 24
        case .medium:
            return 16
        case .small:
            return 12
        }
    }
    
    private var verticalPadding: CGFloat {
        switch size {
        case .large:
            return 14
        case .medium:
            return 10
        case .small:
            return 8
        }
    }
    
    private var cornerRadius: CGFloat {
        switch size {
        case .large:
            return 8
        case .medium:
            return 6
        case .small:
            return 4
        }
    }
}

// MARK: - Toggle Button Component
struct CitrusToggleButton: View {
    // MARK: - Properties
    private let title: String
    private let isSelected: Bool
    private let action: (Bool) -> Void
    private let size: CitrusButtonSize
    private let isFullWidth: Bool
    private let leadingIcon: String?
    private let trailingIcon: String?
    private let isDisabled: Bool
    
    // MARK: - Constants
    private let accentColor = Color(hex: "#9747ff")
    
    // MARK: - Initializer
    init(
        title: String,
        isSelected: Bool,
        size: CitrusButtonSize = .medium,
        isFullWidth: Bool = false,
        leadingIcon: String? = nil,
        trailingIcon: String? = nil,
        isDisabled: Bool = false,
        action: @escaping (Bool) -> Void
    ) {
        self.title = title
        self.isSelected = isSelected
        self.size = size
        self.isFullWidth = isFullWidth
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isDisabled = isDisabled
        self.action = action
    }
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            action(!isSelected)
        }) {
            HStack(spacing: 8) {
                // Leading icon
                if let leadingIcon = leadingIcon {
                    Image(systemName: leadingIcon)
                        .font(.system(size: iconSize))
                }
                
                // Button text
                Text(title)
                    .font(.system(size: fontSize, weight: .medium))
                
                // Trailing icon
                if let trailingIcon = trailingIcon {
                    Image(systemName: trailingIcon)
                        .font(.system(size: iconSize))
                }
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .background(isSelected ? accentColor : Color.clear)
            .foregroundColor(isSelected ? .white : accentColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(accentColor, lineWidth: 1)
            )
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.6 : 1.0)
    }
    
    // MARK: - Computed Properties
    private var fontSize: CGFloat {
        switch size {
        case .large:
            return 16
        case .medium:
            return 14
        case .small:
            return 12
        }
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .large:
            return 18
        case .medium:
            return 16
        case .small:
            return 14
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .large:
            return 24
        case .medium:
            return 16
        case .small:
            return 12
        }
    }
    
    private var verticalPadding: CGFloat {
        switch size {
        case .large:
            return 14
        case .medium:
            return 10
        case .small:
            return 8
        }
    }
    
    private var cornerRadius: CGFloat {
        switch size {
        case .large:
            return 8
        case .medium:
            return 6
        case .small:
            return 4
        }
    }
}

// MARK: - Preview
struct CitrusButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Group {
                Text("Regular Buttons")
                    .font(.headline)
                
                // Filled Buttons
                Text("Filled Buttons")
                    .font(.subheadline)
                
                HStack(spacing: 16) {
                    CitrusButton(title: "Large", size: .large) {}
                    CitrusButton(title: "Medium") {}
                    CitrusButton(title: "Small", size: .small) {}
                }
                
                // Outlined Buttons
                Text("Outlined Buttons")
                    .font(.subheadline)
                
                HStack(spacing: 16) {
                    CitrusButton(title: "Large", style: .outlined, size: .large) {}
                    CitrusButton(title: "Medium", style: .outlined) {}
                    CitrusButton(title: "Small", style: .outlined, size: .small) {}
                }
                
                // Bare Buttons
                Text("Bare Buttons")
                    .font(.subheadline)
                
                HStack(spacing: 16) {
                    CitrusButton(title: "Large", style: .bare, size: .large) {}
                    CitrusButton(title: "Medium", style: .bare) {}
                    CitrusButton(title: "Small", style: .bare, size: .small) {}
                }
            }
            
            Group {
                Text("Width Options")
                    .font(.headline)
                
                CitrusButton(title: "Hug Width", isFullWidth: false) {}
                CitrusButton(title: "Full Width", isFullWidth: true) {}
            }
            
            Group {
                Text("With Icons")
                    .font(.headline)
                
                CitrusButton(title: "Leading Icon", leadingIcon: "star") {}
                CitrusButton(title: "Trailing Icon", trailingIcon: "arrow.right") {}
                CitrusButton(title: "Both Icons", leadingIcon: "star", trailingIcon: "arrow.right") {}
            }
            
            Group {
                Text("Toggle Buttons")
                    .font(.headline)
                
                HStack(spacing: 16) {
                    CitrusToggleButton(title: "Selected", isSelected: true) { _ in }
                    CitrusToggleButton(title: "Unselected", isSelected: false) { _ in }
                }
                
                HStack(spacing: 16) {
                    CitrusToggleButton(title: "Large", isSelected: true, size: .large) { _ in }
                    CitrusToggleButton(title: "Medium", isSelected: true) { _ in }
                    CitrusToggleButton(title: "Small", isSelected: true, size: .small) { _ in }
                }
            }
            
            Group {
                Text("Disabled State")
                    .font(.headline)
                
                HStack(spacing: 16) {
                    CitrusButton(title: "Disabled", isDisabled: true) {}
                    CitrusToggleButton(title: "Disabled", isSelected: true, isDisabled: true) { _ in }
                }
            }
        }
        .padding()
    }
}
