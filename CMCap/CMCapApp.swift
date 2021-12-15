//
//  CMCapApp.swift
//  CMCap
//
//  Created by Naji Achkar on 06/12/21.
//

import SwiftUI

@main
struct CMCapApp: App {
    
    @StateObject var cryptoData = CoinsService()
    
    var body: some Scene {
        
        WindowGroup {
            TabView {
                ListView(coinsService: cryptoData)
                 .tabItem {
                     Image(systemName: "chart.line.uptrend.xyaxis")
                     Text("Market")
                 }.tag(0)
                PortfolioView()
                    .tabItem {
                        Image(systemName: "bitcoinsign.circle")
                        Text("My Portfolio")
                    }.tag(1)
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }.tag(2)
           
             
            }.accentColor(.theme.blue)
            
            
            
            
            
            
            
           
                
        }
    }
}
