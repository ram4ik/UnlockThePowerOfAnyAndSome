//
//  ContentView.swift
//  UnlockThePowerOfAnyAndSome
//
//  Created by Ramill Ibragimov on 3/29/24.
//

import SwiftUI

protocol Shape {}

struct Rectangle: Shape {}
struct Triangle: Shape {}
struct VerifyBigRectangle: Shape {}

struct ContentView: View {
    
    /// some: This is used in Swift to represent some kind of type that conforms to a protocol, but the specific type isn't specified. This is known as opaque types. When you see some View, it means the function will return a type that conforms to the View protocol, but the specific type is not revealed.
    var body: some View {
        VStack {
            Text("Unlock the Power of `Any` and `Some`")
        }
        .onAppear() {
            existentialType()
            verifyBig()
            _ = makeRectangle()
        }
    }
    
    /// Existential Type: In Swift, an existential type is a type that is defined by a protocol, rather than a concrete type. It's a way to use protocols as types. When you use a protocol as a type, you don't know what the underlying concrete type is, you only know that it conforms to a certain protocol.
    private func existentialType() {
        
        /// Any: This is a type eraser in Swift. It can represent an instance of any type at all, including function types and optional types. When you see AnyView, it's usually used to conditionally return different types of views.
        var shape: any Shape = Rectangle()
        shape = Triangle()
        print(shape.self)
    }
    
    /// Generics: Generics are a way to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.
    private func draw<T: Shape>(shape: T) {}
    
    private func verifyBig() {
        print(MemoryLayout.size(ofValue: VerifyBigRectangle()))
        let shape: any Shape = VerifyBigRectangle()
        print(MemoryLayout.size(ofValue: shape))
    }
    
    /// Opaque Type: An opaque type is a type that hides its underlying concrete type. When a function returns an opaque type, it means that it will return some specific type that conforms to a protocol, but it doesn't specify what that type is. This is specified using the some keyword
    private func makeRectangle() -> some Shape {
        return Rectangle()
    }
}

#Preview {
    ContentView()
}
