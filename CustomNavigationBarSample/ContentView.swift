//
//  ContentView.swift
//  CustomNavigationBarSample
//
//  Created by MakeItSimple on 2020/02/26.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import SwiftUI

struct AppleDevice: Identifiable {
    var id = UUID()
    var name = String()
}

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = .yellow
        
        // UINavigationBar.
        
        
    }
    
    let appleDevices: [AppleDevice] = [
        AppleDevice(name: "iPhone"),
        AppleDevice(name: "iPad"),
        AppleDevice(name: "iMac")
    ]
    
    var body: some View {
        
        NavigationView {
            
            List(appleDevices) { device in
                NavigationLink(destination: DetailView(name: device.name)) {
                    VStack(alignment: .leading) {
                        Text(device.name)
                    }
                }
                
            }
            .navigationBarItems(leading: HStack {
                // 좌측
                Button(action: {}) {
                    Image(systemName: "minus.square.fill")
                        .font(.largeTitle)
                }.foregroundColor(.pink)
                
            }, trailing:
                // 우측
                HStack {
                    Button(action: {}) {
                        Image(systemName: "plus.square.fill")
                            .font(.largeTitle)
                    }.foregroundColor(.blue)
            })
            .navigationBarTitle(Text("Names"))
        }
        
        
    }
}

struct DetailView: View {
    var name: String
    
    var body: some View {
        Text("선택한 디바이스 이름은 \(name)")
            .navigationBarTitle(Text("상세보기"), displayMode: .inline)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
