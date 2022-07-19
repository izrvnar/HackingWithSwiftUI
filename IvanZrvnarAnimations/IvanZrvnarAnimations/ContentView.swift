//
//  ContentView.swift
//  IvanZrvnarAnimations
//
//  Created by Ivan Zrvnar on 2022-06-28.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    @State private var isShowingRed = false
    
    
    var body: some View{
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation{
                isShowingRed.toggle()
            }
        }
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        VStack{
//            Button("Tap Me"){
//                withAnimation{
//                isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed{
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//                // 2 different animations for when one is being showed and one for disapearing
//                .transition(.asymmetric(insertion: .scale, removal: .opacity))
//
//            }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    let letters = Array("Hello SwiftUI")
//      @State private var enabled = false
//      @State private var dragAmount = CGSize.zero
//
//
//    var body: some View{
//        HStack(spacing: 0){
//            ForEach(0..<letters.count){
//                num in
//
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double (num) / 20), value: dragAmount)
//
//
//            }
//
//        }
//        .gesture(
//              DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                  dragAmount = .zero
//                  enabled.toggle()
//                }
//        )
//
//
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//    @State private var dragAmount = CGSize.zero
//
//    var body: some View{
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//        // adding a gesture to the card to drag it back to centre
//            .gesture(
//                DragGesture()
//                    .onChanged{ dragAmount = $0.translation}
//                    .onEnded{_ in
//                        withAnimation(.spring()){
//
//                            dragAmount = .zero}
//
//                    }
//            )
//            .animation(.spring(), value: dragAmount)
        
        
        
    
    
//    @State private var animationAmount = 0.0
//    @State private var enabled = false
//
//    var body: some View {
//
//        Button("Tap Me") {
//            withAnimation{
//                animationAmount += 360
//            }
//            enabled.toggle()
//
//        }
//           .frame(width: 200, height: 200)
//           .background(enabled ? .blue : .red)
//           .animation(nil, value: enabled)
//           .foregroundColor(.white)
//           .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//           .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
           
       
    

        
        
        
        
        
        
        
//        print(animationAmount)
//
//
//      return VStack{
//            Stepper("Scale Amount", value: $animationAmount.animation(), in: 1...10)
//            Spacer()
//
//            Button("Tap Me"){
//               animationAmount += 1
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//
//
//
//        }

////        .blur(radius: (animationAmount - 1) * 3)
//
//        .overlay(
//            Circle()
//                .stroke(.red)
//                .scaleEffect(animationAmount)
//                .opacity(2 - animationAmount)
//                .animation(.easeOut(duration: 1)
//                    .repeatForever(autoreverses: false),
//
//                            value: animationAmount)
//        )
//
//        .onAppear{
//            animationAmount = 2
//        }
//
////        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
//
////        .animation(.easeOut(duration: 2)
////            .delay(1),
////             value: animationAmount)
//
////        .animation(.easeInOut(duration: 1)
////            .repeatCount(3, autoreverses: true),
////                   value: animationAmount)
        
        
    }//: Body
}//: Content view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
