//
//  ContentView.swift
//  IvanZrvnarBookworm
//
//  Created by Ivan Zrvnar on 2022-07-05.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    
    
    
    var body: some View {

        NavigationView{
            
            List{
                ForEach(books){book in
                    NavigationLink{
                        DetailView(book: book)
                    }label: {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            
                .navigationTitle("BookWorm")
                .toolbar{
                    
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        EditButton()
                    })
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showingAddScreen.toggle()
                        }label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
        }
        
        
        
        
    }//: Body
    
    //MARK: Methods
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets{
            // find the book
            let book = books[offset]
            
            moc.delete(book)
        }
        try? moc.save()
    }
    
    
}//: ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
