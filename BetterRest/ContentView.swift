//
//  ContentView.swift
//  BetterRest
//
//  Created by Charles Michael on 8/26/24.
//
import CoreML
import SwiftUI

//struct ContentView: View {
//    @State private var sleepAmount = 8.0
//    
//    var body: some View {
//        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//            .padding()
//    }
//       
//}
//
//#Preview {
//    ContentView()
//}


//struct ContentView: View {
//    @State private var wakeUp = Date.now
//    
//    var body: some View {
//        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
//            .labelsHidden()
//    }
//    
//    func exampleDates () {
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tomorrow
//    }
//       
//}

struct ContentView: View {
   
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up")
                    .font(.headline)
                
                DatePicker("Please enter a name", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                
                
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
        }
      
        
    }
    
    func calculateBedtime(){
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
        } catch {
            
        }
    }
       
}


#Preview {
    ContentView()
}
