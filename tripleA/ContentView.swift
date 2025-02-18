//
//  ContentView.swift
//  tripleA
//
//  Created by Brian Sen on 1/21/25.
//

import SwiftUI
import FirebaseFirestore

// function to verify the Firestore is connected
//func checkFirestoreConnection() {
//    let db = Firestore.firestore()
//    db.collection("test_click").getDocuments {(snapshot, error) in
//        if let error = error {
//            print("Firestore connection failed with error: \(error)")
//        } else if let snapshot = snapshot {
//            print("Firestore is connected! Found \(snapshot.documents.count) documents.")
//            for document in snapshot.documents {
//                print("Document ID: \(document.documentID)")
//            }
//        }
//    }
//}

struct ContentView: View  {
    let db = Firestore.firestore(); // Firebase Database reference
    

    var body: some View {
            ZStack {
                Color(red: 0.07, green: 0.55, blue: 0.33) // #128c55
                    .ignoresSafeArea()
                
                Text("RiskIt")
                    .font(.system(size: 48, weight: .regular))
                    .foregroundColor(Color(red: 0.035, green: 0.035, blue: 0.035)) // #090909
            }
        }
    
    func saveDataToFirestore() {
        print("In Save Data function")
        let data: [String: Any] = [
            "message": "Testing a new collection",
            "timestamp": Timestamp()
        ]

        db.collection("test_data")
            .document("test_doc")
            .setData(data) { error in
            if let error = error {
                print("❌ Firestore write error: \(error.localizedDescription)")
            } else {
                print("✅ Firestore write successful! Document ID: new_test_doc")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
