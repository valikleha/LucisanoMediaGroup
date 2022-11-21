//
//  Fonts.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 17/11/22.
//

import Foundation
import SwiftUI

struct Fonts {
    
    public static var tabBar: Font {
        return Font.custom("AvenirNext-Medium", size: 10)
    }
    public static var headline: Font {
        return Font.custom("AvenirNext-Bold", size: 45)
    }
    public static var movieHeadline: Font {
        return Font.custom("AvenirNext-Bold", size: 42)
    }
    public static var subTitle: Font {
        return Font.custom("AvenirNext-Medium", size: 18)
    }
    public static var categories: Font {
        return Font.custom("AvenirNext-Bold", size: 20)
    }
    public static var movieTitle: Font {
        return Font.custom("AvenirNext-Regular", size: 14)
    }
    public static var description: Font {
        return Font.custom("AvenirNext-Regular", size: 18)
    }
    public static var movieSubtitle: Font {
        return Font.custom("AvenirNext-Medium", size: 14)
    }
}
