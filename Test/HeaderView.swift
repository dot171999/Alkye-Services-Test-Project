import SwiftUI

import SwiftUI


import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var articles: [Article] = []
    @State var rotation = CGFloat(0)
    let networkManager = NetworkManager.shared
    
    var body: some View {
    
        //HStack {
        Button {
            Task {
                let (fetchedArticles, _) =  await NetworkManager.shared.getArticles()
                
                if let articles = fetchedArticles {
                    self.articles = articles
                }
            }
        } label: {
            Color.blue
                .frame(width: 300, height: 80)
                .overlay(
                    Text("\(articles)")
                        .foregroundColor(.white)
                )
                .rotationEffect(.degrees(rotation))
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                rotation = 90
            }
        }
    }
}

class test {
    private(set) var name: String
    
    init(name: String) {
        self.name = name
    }
    
    
}

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}

struct cell: View {
    var num: Int
    var onClick1: () -> Void
    var onClick: () -> Void

    var body: some View {
        NavigationLink {
            detailView()
        } label: {
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
        }
        .overlay {
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.black)
        }
        .border(.green)
            
    }
}

struct detailView: View {
    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .foregroundColor(.red)
    }
}



#Preview {
    ContentView()
}

@MainActor
class DataController {
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: User.self, CurrentUser.self, configurations: config)
            
//            for i in 1...9 {
//                let user = User(name: "A", username: "A", password: "a")
//                container.mainContext.insert(user)
//            }
            
            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
