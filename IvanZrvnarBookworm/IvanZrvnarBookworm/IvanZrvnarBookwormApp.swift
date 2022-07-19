//
//  IvanZrvnarBookwormApp.swift
//  IvanZrvnarBookworm
//
//  Created by Ivan Zrvnar on 2022-07-05.
//

import SwiftUI

@main
struct IvanZrvnarBookwormApp: App {
    // making the instance of the data store availible to the rest of the app
    @StateObject private var dataController = DataContoller()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
