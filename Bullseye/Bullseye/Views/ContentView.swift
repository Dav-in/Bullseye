//
//  ContentView.swift
//  Bullseye
//
//  Created by Davin Henrik on 11/30/21.
//
// Single Responsibility Principle:

// ContentView's job: Display the user interface for the app.


import SwiftUI


//*. defining a template for an instance using the struct keyword called ContentView.
//*. Plain English Definition.
//*. defining a template for an instance called ContentView that is a View.


// View Class

struct ContentView: View {
    
    // property to store if alert is visible
    // this property is only for contentview
    
    @State private var alertIsVisible = false
    
    // slider state property
    
    @State private var sliderValue = 50.0
    
    //create instance of struct Game
    
    @State private var game = Game()
    
    
    // - body is a property of type some View
    // - View is the main view containing subviews
    // - var is a container for data and contents can change
    // - Plain English
    // - This is the definition for a variable called body and its a some View
    // - lets ContentView knowwhat to display as its main body
    // - some means "body" can contain a view or something that behaves like a view.
    
    
    var body: some View {
        VStack {
            VStack {
                
                
                //below are examples of calling methods.
                
                
                Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                
                
                /*bold returns a textview, multi returns a view, kerning returns a textview, need to reorder kerning view modifier while textview is still being returned
                */
                
                //convert game.target (Int) to a String
                
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                }
                Button(action: {
                    
                    
                    //print() is a true function
                    // function is like a method but not attached to an instance (class/struct)
                    
                    
                    print("Hello, SwiftUI!")
                    
                    //self means you want to use something from within the ContentView Class.
                    // this changes the state of the alert property.
                    
                    self.alertIsVisible = true
                    
                    
                }) {
                    //prints inside the button
                    
                    Text("Hit me")
                }
                
                // use $ to convert alertIsVisible to a binding in the state variable
                .alert(isPresented: $alertIsVisible, content: {
                    
                    //this truncates the value does not actually round up/down
//                    var roundedValue: Int = Int(self.sliderValue)
                    
                    //this will provide a rounded value
                    let roundedValue = Int(sliderValue.rounded())
                    
                    
                    //self.game.points accesses the Game instance created in this struct
                    //(sliderValue: roundedValue) takes parameter sliderValue with Int roundedValue (user's guess)
                    
                    return Alert(title: Text("Hello"), message: Text("The slider's value is: \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Awesome!")))
                })
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider
    {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
