import SwiftUI

struct BottomView: View {
    @Binding var userData: UserData
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Image("big_character_1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 261, height: 321)
                
                NavigationLink(destination: NextSampleView(test: "캐릭터 바꾸러")) {
                    Image("btn_character")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 343, height: 143)
                        .offset(y: -66)
                }
                .buttonStyle(EffectButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    BottomView(userData: .constant(UserData(userId: 4, nickname: "김태인", character: 1, stage: 3, level: 1)))
}
