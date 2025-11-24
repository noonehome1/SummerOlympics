//
//  ContentView.swift
//  SummerOlympics
//
//  Created by Paul Wagstaff on 2025-11-24.
//

import SwiftUI

struct ContentView: View {
    private let logos: [String] = [
        "1924-Paris-France.jpg",
        "1932-los-angeles-usa.jpg",
        "1936-berlin-germany.png",
        "1948-london-england.jpg",
        "1952-helsinki-finland.jpg",
        "1956-melbourne-australia.jpg",
        "1960-rome-italy.jpg",
        "1964-tokyo-japan.jpg",
        "1968-mexico-city-mexico.jpg",
        "1972-munich-germany.png",
        "1976-montreal-canada.jpg",
        "1980-moscow-russia.jpg",
        "1984-los-angeles-usa.jpg",
        "1988-seoul-south-korea.jpg",
        "1992-barcelona-spain.jpg",
        "1996-atlanta-usa.jpg",
        "2000-sydney-australia.jpg",
        "2004-athens-greece.png",
        "2008-beijing-china.jpg",
        "2012-london-england.jpg",
        "2016-rio-brazil.jpg",
        "2020-tokyo-japan.jpeg",
        "2024-paris-france.png",
        "2028-los-angeles-usa.png",
        "2032-brisbane-australia",
    ]
    
    @State private var logoNumber: Int = 22
    
    var body: some View {
        VStack {
            Text("Olympic Logos")
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            Image(getImageName(logoName: logos[logoNumber]))
                .resizable()
                .scaledToFit()
            
            Spacer()
            Text("\(getCity(logoString: logos[logoNumber])), \(getCountry(logoString: logos[logoNumber]))")
                .font(.largeTitle)
                .fontWeight(.thin)
            Text("\(getYear(logoString: logos[logoNumber]))")
                .font(.largeTitle)
                .fontWeight(.thin)

            HStack {
                Button {
                    logoNumber -= 1
                } label: {
                    Image(systemName: "chevron.left.to.line")
                }
                .disabled(logoNumber == 0)
                Spacer()
                Button {
                    logoNumber += 1
                } label: {
                    Image(systemName: "chevron.right.to.line")
                }
                .disabled(logoNumber == logos.count - 1)
            }
            .font(.largeTitle)
            .fontWeight(.black)
            .tint(.black)
        }
        .padding()
    }
    func getImageName(logoName: String) -> String {
        var newLogoName: String = logoName.replacingOccurrences(of: ".png", with: "")
        newLogoName = newLogoName.replacingOccurrences(of: ".jpg", with: "")
        return newLogoName.replacingOccurrences(of: ".jpeg", with: "")
    }
    func getYear(logoString: String) -> String {
        // Get imageName (no ext), and split into array on "-", take the first element (Year)
        let year: String = getImageName(logoName: logoString).components(separatedBy: "-").first ?? ""
        return year
    }
    func getCountry(logoString: String) -> String {
        // Get imageName (no ext), and split into array on "-", take the last element capitalized (Country), if "usa" ensure all are CAPS
        var country = getImageName(logoName: logoString).components(separatedBy: "-").last ?? ""
        country = (country.lowercased() == "usa" ? "USA" : country.capitalized)
        return country
    }
    func getCity(logoString: String) -> String {
        // Get imageName (no ext), and split into array on "-", dropFirst (Year), dropLast (Country), join it back together, and capitalize it
        let city = getImageName(logoName: logoString).components(separatedBy: "-").dropFirst().dropLast().joined(separator: " ").capitalized
        return city
    }
}

#Preview {
    ContentView()
}
