//
//  ContentView.swift
//  UIMapExample
//
//  Created by Nathan Chang on 2/14/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.760082, longitude: -73.983249),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var searchQuery: String = ""
    
    @StateObject private var viewModel = LocationViewModel()
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        ZStack {
            VStack {
                Map(
                    coordinateRegion: $region,
                    showsUserLocation: true,
                    annotationItems: viewModel.locations
                ) { location in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)) {
                        VStack {
                            Image(systemName: "person.circle.fill")
                                .foregroundColor(.blue)
                                .font(.title)
                                .background(Circle().fill(Color.white))
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                viewModel.fetchLocations()
            }
            
            VStack {
                ZStack(alignment: .leading) {
                    // Background and styling of the TextField
                    TextField("Enter text here", text: $searchQuery) // Replace with your actual binding variable
                        .padding(.vertical, Constants.spacingTight)
                        .padding(.leading, Constants.spacingDefault + 18) // Add extra padding for the left icon space
                        .padding(.horizontal, Constants.spacingDefault)
                        .background(Constants.bgActionNeutralDefault)
                        .cornerRadius(999)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .textFieldStyle(PlainTextFieldStyle()) // Removes default padding
                    
                    // Left Icon
                    Image(.citrusLogo)
                        .padding(.leading, Constants.spacingDefault)
                    
                    // Right Icon
                    HStack {
                        Spacer()
                        Image(.microphone)
                            .padding(.trailing, Constants.spacingDefault)
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: Constants.searchWidth)
                
                Spacer()
            }
            
            
        }
    }
}
