import SwiftUI

struct MainView: View {
    @State private var userData = UserData(userId: 4, nickname: "김태인", character: 1, stage: 3, level: 1)
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    ColorBackgroundView()
                    
                    VStack {
                        MapView(userData: $userData)
                            .padding(.top, 130)
                            .frame(width: mapWidth(for: geometry.size.width), height: mapHeight(for: geometry.size.height))
                    }
                    
                    TopView(userData: $userData)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                        .padding(50)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    
                    BottomView(userData: $userData)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                        .padding(.trailing, 46)
                        .padding(.bottom, 86)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
    
    private func mapWidth(for width: CGFloat) -> CGFloat {
        return width * 0.9
    }
    
    private func mapHeight(for height: CGFloat) -> CGFloat {
        return height * 0.75
    }
}


#Preview {
    MainView()
}

