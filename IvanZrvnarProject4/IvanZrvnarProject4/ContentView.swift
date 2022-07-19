//
//  ContentView.swift
//  IvanZrvnarProject4
//
//  Created by Ivan Zrvnar on 2022-06-27.
//

import SwiftUI
import CoreML

struct ContentView: View {
    //MARK: - Properties
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    // alert properties
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    var body: some View {
        
        NavigationView{
           Form{
               VStack(alignment: .leading, spacing: 0){
                   Text("When do you want to wake up")
                       .font(.headline)
                   
                   // date picker for when the user wakes up. Note label is hidden to remove the normal giant gap datepicker has
                   DatePicker("Please enter a time" , selection: $wakeUp, displayedComponents: .hourAndMinute)
                       .labelsHidden()
               }
                
               VStack(alignment: .leading, spacing: 0){
                   // desired amount of sleep using the stepper
                   Text("Desired amount of sleep")
                       .font(.headline)
                   
                   Stepper("\(sleepAmount.formatted()) hours" , value: $sleepAmount, in: 4...12, step: 0.25)
               }
               
               VStack(alignment: .leading, spacing: 0){
                   Text("Daily Coffee Intake")
                       .font(.headline)
                   
                   Stepper(coffeAmount == 1 ? "1 Cup" : "\(coffeAmount) cups", value: $coffeAmount, in: 1...20)
               }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
              Button("OK") { }
            } message: {
              Text(alertMessage)
            }
            .navigationTitle("Better Rest")
            .toolbar{
                Button("Calculate", action: calculateBedTime)
            }
            
        }

        
    }
    
    //MARK: Methods
    func calculateBedTime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            // more code
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour +
            minute), estimatedSleep: sleepAmount, coffee:
            Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            // creating an alert for calculated sleep time
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
            
            
            
        } catch{
            alertTitle = "Error"
            alertMessage = "Sorry there was a problem calculating your bedtime"
            
            
        }
        showingAlert = true
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
