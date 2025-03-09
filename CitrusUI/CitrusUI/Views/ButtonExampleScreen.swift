//
//  ButtonExampleScreen.swift
//  CitrusUI
//
//  Created by Paul Minyoo Kim on 3/9/25.
//

import SwiftUI

struct ButtonExampleView: View {
    @State private var isToggled = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("🍊 Citrus Buttons")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Regular Button Examples
                sectionHeader("Regular Buttons")
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Filled Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "Large", size: .large) {
                            print("Large button tapped")
                        }
                        
                        CitrusButton(title: "Medium") {
                            print("Medium button tapped")
                        }
                        
                        CitrusButton(title: "Small", size: .small) {
                            print("Small button tapped")
                        }
                    }
                    
                    Text("Outlined Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(
                            title: "Large",
                            style: .outlined,
                            size: .large
                        ) {
                            print("Large outlined button tapped")
                        }
                        
                        CitrusButton(
                            title: "Medium",
                            style: .outlined
                        ) {
                            print("Medium outlined button tapped")
                        }
                        
                        CitrusButton(
                            title: "Small",
                            style: .outlined,
                            size: .small
                        ) {
                            print("Small outlined button tapped")
                        }
                    }
                    
                    Text("Bare Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(
                            title: "Large",
                            style: .bare,
                            size: .large
                        ) {
                            print("Large bare button tapped")
                        }
                        
                        CitrusButton(
                            title: "Medium",
                            style: .bare
                        ) {
                            print("Medium bare button tapped")
                        }
                        
                        CitrusButton(
                            title: "Small",
                            style: .bare,
                            size: .small
                        ) {
                            print("Small bare button tapped")
                        }
                    }
                }
                
                // Width Options
                sectionHeader("Width Options")
                
                VStack(alignment: .leading, spacing: 16) {
                    CitrusButton(
                        title: "Hug Width Button",
                        isFullWidth: false
                    ) {
                        print("Hug width button tapped")
                    }
                    
                    CitrusButton(
                        title: "Full Width Button",
                        isFullWidth: true
                    ) {
                        print("Full width button tapped")
                    }
                }
                
                // Buttons with Icons
                sectionHeader("Buttons with Icons")
                
                VStack(alignment: .leading, spacing: 16) {
                    CitrusButton(
                        title: "Leading Icon",
                        leadingIcon: "star"
                    ) {
                        print("Button with leading icon tapped")
                    }
                    
                    CitrusButton(
                        title: "Trailing Icon",
                        trailingIcon: "arrow.right"
                    ) {
                        print("Button with trailing icon tapped")
                    }
                    
                    CitrusButton(
                        title: "Both Icons",
                        leadingIcon: "star",
                        trailingIcon: "arrow.right"
                    ) {
                        print("Button with both icons tapped")
                    }
                }
                
                // Toggle Buttons
                sectionHeader("Toggle Buttons")
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        CitrusToggleButton(
                            title: "Toggle Me",
                            isSelected: isToggled
                        ) { newValue in
                            isToggled = newValue
                            print("Toggle button state: \(newValue)")
                        }
                        
                        Text("Current state: \(isToggled ? "ON" : "OFF")")
                    }
                    
                    HStack(spacing: 16) {
                        CitrusToggleButton(
                            title: "Large",
                            isSelected: true,
                            size: .large
                        ) { _ in }
                        
                        CitrusToggleButton(
                            title: "Medium",
                            isSelected: true
                        ) { _ in }
                        
                        CitrusToggleButton(
                            title: "Small",
                            isSelected: true,
                            size: .small
                        ) { _ in }
                    }
                }
                
                // Disabled State
                sectionHeader("Disabled State")
                
                VStack(alignment: .leading, spacing: 16) {
                    CitrusButton(
                        title: "Disabled Button",
                        isDisabled: true
                    ) {
                        print("This won't be called")
                    }
                    
                    CitrusToggleButton(
                        title: "Disabled Toggle",
                        isSelected: true,
                        isDisabled: true
                    ) { _ in
                        print("This won't be called")
                    }
                }
            }
            .padding()
        }
    }
    
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top, 8)
    }
}

struct ButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExampleView()
    }
}
