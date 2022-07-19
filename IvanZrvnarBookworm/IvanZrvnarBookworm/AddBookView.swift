//
//  AddBookView.swift
//  IvanZrvnarBookworm
//
//  Created by Ivan Zrvnar on 2022-07-05.
//

import SwiftUI

struct AddBookView: View {
    //MARK: Properties
    @Environment(\.managedObjectContext) var moc
    
    //properties for the book
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    //genre picker options
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry",
    "Romance", "Thriller"]
    
    //property to dismiss the current view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Authors Name", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                    

                } header: {
                    Text("Write a Review")
                }
                
                Section{
                    Button("Save"){
                        //add the book
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                            dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
        
        
    
    }//: Body
}//: AddBookView

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
