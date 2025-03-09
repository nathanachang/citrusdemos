//
//  HomeScreen.swift
//  Citis
//
//  Created by Paul Minyoo Kim on 2/24/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Display content based on the selected tab
            Group {
                if selectedTab == 0 {
                    MapView()
                } else if selectedTab == 1 {
                    PlanView()
                } else if selectedTab == 2 {
                    WebSocketScreen()
                } else if selectedTab == 3 {
                    SavedView()
                } else if selectedTab == 4 {
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Spacer()
            tabBarItem(index: 0, systemImage: "fill", title: "Map")
            Spacer()
            tabBarItem(index: 1, systemImage: "fill", title: "Plan")
            Spacer()
            tabBarItem(index: 2, systemImage: "fill", title: "Inbox")
            Spacer()
            tabBarItem(index: 3, systemImage: "fill", title: "Saved")
            Spacer()
            tabBarItem(index: 4, systemImage: "fill", title: "Profile")
            Spacer()
        }
        .padding(.vertical, 20)
        .background(Color(UIColor.systemBackground).shadow(radius: 2))
    }
    
    private func tabBarItem(index: Int, systemImage: String, title: String) -> some View {
        Button(action: {
            withAnimation {
                selectedTab = index
            }
        }) {
            VStack {
                Circle()
                    .fill(selectedTab == index ? Color.orange : Color.gray.opacity(0.3))
                    .frame(width: 30, height: 30)
                    .overlay(
                        Image(systemName: systemImage)
                            .foregroundColor(.white)
                    )
                Text(title)
                    .font(.caption)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct MapView: View {
    var body: some View {
        NavigationView {
            Text("Map View")
                .navigationBarTitle("Map", displayMode: .inline)
        }
    }
}

struct PlanView: View {
    var body: some View {
        NavigationView {
            Text("Plan Screen")
                .navigationBarTitle("Plan", displayMode: .inline)
        }
    }
}


struct SavedView: View {
    var body: some View {
        NavigationView {
            Text("Saved Screen")
                .navigationBarTitle("Saved", displayMode: .inline)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Text("Profile Screen")
                .navigationBarTitle("Profile", displayMode: .inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

