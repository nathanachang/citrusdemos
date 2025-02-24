//
//  APIClient.swift
//  MapExample
//
//  Created by Nathan Chang on 2/13/25.
//

import Foundation

class APIClient {
    
    // Function to fetch users from the API endpoint
    func fetchLocations(completion: @escaping ([LocationData]?, Error?) -> Void) {
        // Define the URL of the API endpoint
        guard let url = URL(string: "https://391c9f2a-fc5e-482c-9581-90fd26294aea.mock.pstmn.io/location") else {
            completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
            return
        }
        
        // Create a URL session to handle the request
        let session = URLSession.shared
        
        // Create a data task to send the GET request
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            // Check if we received valid data
            guard let data = data else {
                completion(nil, NSError(domain: "No Data", code: 500, userInfo: nil))
                return
            }
            
            // Attempt to decode the data into an array of User objects
            do {
                let locationData = try JSONDecoder().decode([LocationData].self, from: data)
                completion(locationData, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        // Start the task
        task.resume()
    }
}
