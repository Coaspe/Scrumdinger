//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by 이우람 on 2023/08/03.
//

/// To create an arc, you’ll create a structure that conforms to the Shape protocol.
/// The Shape protocol has one required function: path(in:).
/// You’ll write the path(in:) function and additional properties you’ll use to calculate the path inside that function.
import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }
    /// Add a private computed property named startAngle, and calculate the value using degreesPerSpeaker and speakerIndex.
    /// When you draw a path, you’ll need an angle for the start and end of the arc. The additional 1.0 degree is for visual separation between arc segments.
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    private var endAngle: Angle {
         Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
     }
    /// Argument Label (전달인자 레이블):
    //    Argument label은 함수를 호출할 때 인자(argument)를 전달할 때 사용되는 레이블입니다.
    //    함수를 호출할 때에는 argument label을 사용하여 인자의 역할이 무엇인지 명확하게 표시합니다.
    //    Argument label은 함수 정의시 매개변수 이름 앞에 작성됩니다.
    //    Parameter Name (매개변수 이름):
    //
    //    Parameter name은 함수 내부에서 매개변수를 참조할 때 사용되는 이름입니다.
    //    함수 내부에서는 parameter name을 사용하여 인자에 접근하고, argument label은 사용되지 않습니다.
    //    Parameter name은 함수 정의시 매개변수 이름 뒤에 작성됩니다.
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
    
    
}
