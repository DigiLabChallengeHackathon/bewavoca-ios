import SwiftUI

struct ResultGameView: View {
    
    @State private var userData = UserData(userId: 4, nickname: "김태인", character: 1, stage: 4, level: 1)
    
    var totalQuestions: Int
    var correctAnswers: Int
    var stage: Stage
    
    var body: some View {
        NavigationStack {
            DeviceScaledView {
                VStack {
                    Image("text_maintitle")
                        .frame(width: 293, height: 101)
                        .padding(.top, 67)
                        .padding(.bottom, 71)
                    
                    ZStack(alignment: .top) {
                        BackgroundResizeRectangleView(width: 812, height: 554) {
                            VStack {
                                HStack(alignment: .top) {
                                    Image("image_result_character_big_1")
                                        .resizable()
                                        .frame(width: 345, height: 438)
                                        .padding(.trailing, 45)
                                        .padding(.top, 52)
                                    
                                    VStack {
                                        Text("\(getGameLevel())단계")
                                            .font(
                                                Font.custom("GmarketSansBold", size: 40)
                                            )
                                            .multilineTextAlignment(.center)
                                            .padding(.top, 52)
                                            .padding(.bottom, 11)
                                        
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 288, height: 83)
                                                .background(Color("myGrey08"))
                                                .cornerRadius(20)
                                            
                                            Text(getResultMessage())
                                                .font(
                                                    Font.custom("GmarketSansBold", size: 50)
                                                )
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color("myDarkBlue"))
                                        }
                                        .padding(.bottom, 19)
                                        
                                        Text("정답률 : \(correctAnswers)/\(totalQuestions)")
                                            .font(
                                                Font.custom("Gmarket Sans", size: 40)
                                                    .weight(.bold)
                                            )
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color.black)
                                            .padding(.bottom, 32)
                                        
                                        NavigationLink(destination: MainView()) {
                                            Image("btn_confirm")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 288, height: 143)
                                        }
                                        .buttonStyle(EffectButtonStyle())
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 43)
                                }.padding(58)
                            }
                        }
                        
                        Image("image_ribbon_\(stage.description)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 107)
                            .alignmentGuide(.top) { d in d[.top] }
                            .offset(y: -50)
                    }
                    Spacer()
                }
                .frame(height: 1024)
            }
        }
    }
    
    // 맞춘 갯수에 따라 메시지 변경
    private func getResultMessage() -> String {
        if correctAnswers >= totalQuestions / 2 {
            return "대단해요"
        } else {
            return "아쉬워요"
        }
    }
    
    // 게임 레벨을 반환하는 함수 (임의로 지정, 실제 게임 레벨 로직에 맞게 수정 가능)
    private func getGameLevel() -> Int {
        return 2 // 예시로 2단계로 설정 (필요한 로직에 맞게 수정)
    }
}

#Preview {
    ResultGameView(totalQuestions: 10, correctAnswers: 7, stage: .garden)
}
