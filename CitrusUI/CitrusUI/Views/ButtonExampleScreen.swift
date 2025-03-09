import SwiftUI

struct ButtonExampleView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Text("🍊 Citrus Buttons")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Primary Buttons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Primary Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", size: .compact) {
                            print("Compact primary button tapped")
                        }
                        
                        CitrusButton(title: "[Text]") {
                            print("Medium primary button tapped")
                        }
                    }
                    
                    CitrusButton(title: "[Text]", size: .full) {
                        print("Full width primary button tapped")
                    }
                }
                
                // Secondary Buttons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Secondary Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", style: .secondary, size: .compact) {
                            print("Compact secondary button tapped")
                        }
                        
                        CitrusButton(title: "[Text]", style: .secondary) {
                            print("Medium secondary button tapped")
                        }
                    }
                    
                    CitrusButton(title: "[Text]", style: .secondary, size: .full) {
                        print("Full width secondary button tapped")
                    }
                }
                
                // Outlined Buttons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Outlined Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", style: .outlined, size: .compact) {
                            print("Compact outlined button tapped")
                        }
                        
                        CitrusButton(title: "[Text]", style: .outlined) {
                            print("Medium outlined button tapped")
                        }
                    }
                    
                    CitrusButton(title: "[Text]", style: .outlined, size: .full) {
                        print("Full width outlined button tapped")
                    }
                }
                
                // Pink Buttons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Pink Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", style: .pink, size: .compact) {
                            print("Compact pink button tapped")
                        }
                        
                        CitrusButton(title: "[Text]", style: .pink) {
                            print("Medium pink button tapped")
                        }
                    }
                    
                    CitrusButton(title: "[Text]", style: .pink, size: .full) {
                        print("Full width pink button tapped")
                    }
                }
                
                // Gray Buttons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Gray Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", style: .gray, size: .compact) {
                            print("Compact gray button tapped")
                        }
                        
                        CitrusButton(title: "[Text]", style: .gray) {
                            print("Medium gray button tapped")
                        }
                    }
                    
                    CitrusButton(title: "[Text]", style: .gray, size: .full) {
                        print("Full width gray button tapped")
                    }
                }
                
                // Disabled Buttons
                VStack(alignment: .leading, spacing: 16) {
                    Text("Disabled Buttons")
                        .font(.headline)
                    
                    HStack(spacing: 16) {
                        CitrusButton(title: "[Text]", size: .compact, isDisabled: true) {
                            print("This won't be called")
                        }
                        
                        CitrusButton(title: "[Text]", isDisabled: true) {
                            print("This won't be called")
                        }
                    }
                    
                    CitrusButton(title: "[Text]", size: .full, isDisabled: true) {
                        print("This won't be called")
                    }
                }
                
                // Real-world Examples
                VStack(alignment: .leading, spacing: 16) {
                    Text("Real-world Examples")
                        .font(.headline)
                    
                    CitrusButton(title: "Sign In", icon: "person.fill") {
                        print("Sign in tapped")
                    }
                    
                    CitrusButton(title: "Continue with Apple", style: .outlined, icon: "apple.logo") {
                        print("Continue with Apple tapped")
                    }
                    
                    CitrusButton(title: "Add to Cart", style: .secondary, icon: "cart.fill.badge.plus") {
                        print("Add to cart tapped")
                    }
                    
                    CitrusButton(title: "Delete Account", style: .pink, icon: "trash") {
                        print("Delete account tapped")
                    }
                }
            }
            .padding()
        }
    }
}

struct ButtonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExampleView()
    }
}
