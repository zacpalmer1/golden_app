//
//  Color.swift
//  golden
//
//  Created by Zachary Palmer on 9/1/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
            }
    
}

let card: [Color] = [Color(hex: "#87BFFF"), Color(hex: "#8F0200"), Color(hex: "#FF8C42"),Color(hex: "#3B28CC"), Color(hex: "#3B28CC"), Color(hex: "#FF8C42"),Color(hex: "#FF3C38"), Color(hex: "#3B28CC"), Color(hex: "#FF8C42")]
let card2: [Color] = [Color(hex: "#7FDEFF"), Color(hex: "#2C2A4A"), Color(hex: "#4F518C"),Color(hex: "#907AD6"), Color(hex: "#0099CC"), Color(hex: "#2C2A4A"),Color(hex: "#7FDEFF"), Color(hex: "#907AD6"), Color(hex: "#7FDEFF")]
let card3: [Color] = [Color(hex: "#62466B"), Color(hex: "#8C93A8"), Color(hex: "#45364B"),Color(hex: "#876194"), Color(hex: "#8C93A8"), Color(hex: "#62466B"),Color(hex: "#45364B"), Color(hex: "#876194"), Color(hex: "#62466B")]
let card4: [Color] = [Color(hex: "#C92318"), Color(hex: "#FF7733"), Color(hex: "#DF4E2A"),Color(hex: "#F97862"), Color(hex: "#DF4E2A"), Color(hex: "#F97862"),Color(hex: "#FF7733"), Color(hex: "#C92318"), Color(hex: "#DF4E2A")]
let follow: [Color] = [Color(hex: "#b71336"), Color(hex: "#dd33aa"), Color(hex: "#FF931F"),Color(hex: "#CC6900"), Color(hex: "#CC6900"), Color(hex: "#FF931F"),Color(hex: "#CC6900"), Color(hex: "#CC6900"), Color(hex: "#CC6900")]

let orange: [Color] = [Color(hex: "#87BFFF"), Color(hex: "#8F0200"), Color(hex: "#FF8C42"),Color(hex: "#3B28CC"), Color(hex: "#3B28CC"), Color(hex: "#FF8C42"),Color(hex: "#FF3C38"), Color(hex: "#3B28CC"), Color(hex: "#FF8C42")]

let pink: [Color] = [Color(hex: "#ff0000"), Color(hex: "#dd33aa"), Color(hex: "#ff0000"),Color(hex: "#b71336"), Color(hex: "#dd88cc"), Color(hex: "#cc1166"),Color(hex: "#dd88cc"), Color(hex: "#dd33aa"), Color(hex: "#ff0000")]

let green: [Color] = [Color(hex: "#62466B"), Color(hex: "#8C93A8"), Color(hex: "#45364B"),Color(hex: "#876194"), Color(hex: "#8C93A8"), Color(hex: "#62466B"),Color(hex: "#45364B"), Color(hex: "#876194"), Color(hex: "#62466B")]
let red: [Color] = [Color(hex: "#C92318"), Color(hex: "#FF7733"), Color(hex: "#DF4E2A"),Color(hex: "#F97862"), Color(hex: "#DF4E2A"), Color(hex: "#F97862"),Color(hex: "#FF7733"), Color(hex: "#C92318"), Color(hex: "#DF4E2A")]
// Enviromental Colors
let desert: [Color] = [Color(hex: "#F7DBA7"), Color(hex: "#1E2D2F"), Color(hex: "#C57B57")]
let ocean: [Color] = [Color(hex: "#3B28CC"), Color(hex: "#87BFFF"), Color(hex: "#3F8EFC")]
let fire: [Color] = [Color(hex: "#FF3C38"), Color(hex: "#8F0200"), Color(hex: "#FF8C42")]
let forest: [Color] = [Color(hex: "#2E933C"), Color(hex: "#2E933C"), Color(hex: "#2E933C")]
let fall: [Color] = [Color(hex: "#861C0E"), Color(hex: "#EC6816"), Color(hex: "#FCA943")]
let cyber: [Color] = [Color(hex: "#6A68A1"), Color(hex: "#CEFF1A"), Color(hex: "#5C998F")]
let blackAndWhite: [Color] = [Color(hex: "#E6FDFF"), Color(hex: "#121614"), Color(hex: "#090B0A")]
let amber: [Color] = [Color(hex: "#570000"), Color(hex: "#B10F2E"), Color(hex: "#280000")]
let earthy: [Color] = [Color(hex: "#E1CA96"), Color(hex: "#ACA885"), Color(hex: "#434A42")]
let cottoncandy: [Color] = [Color(hex: "#004FFF"), Color(hex: "#FF007F"), Color(hex: "#31AFD4")]
let bluehour: [Color] = [Color(hex: "#414876"), Color(hex: "#1778B5"), Color(hex: "#1B2A4B")]
let burnt: [Color] = [Color(hex: "#0B1D1B"), Color(hex: "#FF8811"), Color(hex: "#1A1528")]
let lime: [Color] = [Color(hex: "#3F4531"), Color(hex: "#5FDD9D"), Color(hex: "#499167")]
let purple: [Color] = [Color(hex: "#443659"), Color(hex: "#DC6ACF"), Color(hex: "#100F1A")]
let easter: [Color] = [Color(hex: "#F5E960"), Color(hex: "#DFB2F4"), Color(hex: "#F49097")]
let beach: [Color] = [Color(hex: "#222E50"), Color(hex: "#007991"), Color(hex: "#E9D886")]
let racecar: [Color] = [Color(hex: "#15616D"), Color(hex: "#FFECD1"), Color(hex: "#FF7D00")]
// North American Country Colors
let usa: [Color] = [Color(hex: "#3C3C6E"), Color(hex: "#FEFEFE"), Color(hex: "#B42134")]
let mexico: [Color] = [Color(hex: "#006847"), Color(hex: "#FEFEFE"), Color(hex: "#D01027")]
let canada: [Color] = [Color(hex: "#D80621"), Color(hex: "#FEFEFE"), Color(hex: "#D80621")]
let antiguaAndBarbuda: [Color] = [Color(hex: "#CF1027"), Color(hex: "#FCD117"), Color(hex: "#0371C6")]
let bahamas: [Color] = [Color(hex: "#000000"), Color(hex: "#00778B"), Color(hex: "#FDC72C")]
let barbados: [Color] = [Color(hex: "#01267F"), Color(hex: "#FEC827"), Color(hex: "#01267F")]
let belize: [Color] = [Color(hex: "#BB1A2D"), Color(hex: "#003F84"), Color(hex: "#BB1A2D")]
let cuba: [Color] = [Color(hex: "#D0142C"), Color(hex: "#0C3496"), Color(hex: "#FFFFFF")]
let costarica: [Color] = [Color(hex: "#042A7F"), Color(hex: "#FFFFFE"), Color(hex: "#CF1026")]
let dominica: [Color] = [Color(hex: "#0E744C"), Color(hex: "#D01D31"), Color(hex: "#EFD221")]
let dominicanrepublic: [Color] = [Color(hex: "#012C63"), Color(hex: "#CD1227"), Color(hex: "#FFFFFF")]
let elsalvador: [Color] = [Color(hex: "#0E48AD"), Color(hex: "#FFFFFF"), Color(hex: "#0E48AD")]
let grenada: [Color] = [Color(hex: "#006747"), Color(hex: "#FCD116"), Color(hex: "#CE1126")]
let guatemala: [Color] = [Color(hex: "#00A3E0"), Color(hex: "#FFFFFF"), Color(hex: "#00A3E0")]
let haiti: [Color] = [Color(hex: "#00209F"), Color(hex: "#D21034"), Color(hex: "#FFFFFF")]
let honduras: [Color] = [Color(hex: "#0073CF"), Color(hex: "#FFFFFF"), Color(hex: "#0073CF")]
let jamaica: [Color] = [Color(hex: "#000000"), Color(hex: "#FED100"), Color(hex: "#007847")]
let nicaragua: [Color] = [Color(hex: "#0067C6"), Color(hex: "#FFFFFF"), Color(hex: "#0067C6")]
let panama: [Color] = [Color(hex: "#005AA7"), Color(hex: "#FFFFFF"), Color(hex: "#FF0000")]
let saintkittsAndNevis: [Color] = [Color(hex: "#006747"), Color(hex: "#F42A41"), Color(hex: "#FFD100")]
let saintlucia: [Color] = [Color(hex: "#6CCFF6"), Color(hex: "#FEDF00"), Color(hex: "#000000")]
let saintvincentAndGrenadines: [Color] = [Color(hex: "#009739"), Color(hex: "#FFD100"), Color(hex: "#0072CE")]
let trinidadAndTobago: [Color] = [Color(hex: "#CE1126"), Color(hex: "#000000"), Color(hex: "#FFFFFF")]
// South American
let argentina: [Color] = [Color(hex: "#74ACDF"), Color(hex: "#FFFFFF"), Color(hex: "#F7D117")]
let bolivia: [Color] = [Color(hex: "#D52B1E"), Color(hex: "#FFD700"), Color(hex: "#007934")]
let brazil: [Color] = [Color(hex: "#009739"), Color(hex: "#FFCC29"), Color(hex: "#002776")]
let chile: [Color] = [Color(hex: "#0033A0"), Color(hex: "#FFFFFF"), Color(hex: "#D52B1E")]
let colombia: [Color] = [Color(hex: "#FFD100"), Color(hex: "#003087"), Color(hex: "#CE1126")]
let ecuador: [Color] = [Color(hex: "#FED100"), Color(hex: "#00247D"), Color(hex: "#CE1126")]
let guyana: [Color] = [Color(hex: "#009739"), Color(hex: "#FFD100"), Color(hex: "#EF3340")]
let paraguay: [Color] = [Color(hex: "#0038A8"), Color(hex: "#FFFFFF"), Color(hex: "#D52B1E")]
let peru: [Color] = [Color(hex: "#D91023"), Color(hex: "#FFFFFF"), Color(hex: "#D91023")]
let suriname: [Color] = [Color(hex: "#007847"), Color(hex: "#FFFFFF"), Color(hex: "#C8102E")]
let uruguay: [Color] = [Color(hex: "#0038A8"), Color(hex: "#FFFFFF"), Color(hex: "#FCD116")]
let venezuela: [Color] = [Color(hex: "#FFD100"), Color(hex: "#003DA5"), Color(hex: "#D52B1E")]
// Europe
let albania: [Color] = [Color(hex: "#D12229"), Color(hex: "#000000"), Color(hex: "#D12229")]
let andorra: [Color] = [Color(hex: "#0055A4"), Color(hex: "#FFCE00"), Color(hex: "#D1001F")]
let armenia: [Color] = [Color(hex: "#0033A0"), Color(hex: "#F2A800"), Color(hex: "#D90012")]
let austria: [Color] = [Color(hex: "#ED2939"), Color(hex: "#FFFFFF"), Color(hex: "#ED2939")]
let belgium: [Color] = [Color(hex: "#000000"), Color(hex: "#FFD100"), Color(hex: "#EF3340")]
let bosniaAndHerzegovina: [Color] = [Color(hex: "#002F6C"), Color(hex: "#FFD100"), Color(hex: "#FFFFFF")]
let bulgaria: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#00966E"), Color(hex: "#D62612")]
let croatia: [Color] = [Color(hex: "#FF0000"), Color(hex: "#FFFFFF"), Color(hex: "#0000FF")]
let cyprus: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#D57800"), Color(hex: "#008000")]
let czechRepublic: [Color] = [Color(hex: "#D7141A"), Color(hex: "#FFFFFF"), Color(hex: "#11457E")]
let denmark: [Color] = [Color(hex: "#C60C30"), Color(hex: "#FFFFFF"), Color(hex: "#C60C30")]
let estonia: [Color] = [Color(hex: "#0072CE"), Color(hex: "#000000"), Color(hex: "#FFFFFF")]
let finland: [Color] = [Color(hex: "#002F6C"), Color(hex: "#FFFFFF"), Color(hex: "#002F6C")]
let france: [Color] = [Color(hex: "#0055A4"), Color(hex: "#FFFFFF"), Color(hex: "#EF4135")]
let georgia: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#E81B30"), Color(hex: "#FFFFFF")]
let germany: [Color] = [Color(hex: "#000000"), Color(hex: "#DD0000"), Color(hex: "#FFCE00")]
let greece: [Color] = [Color(hex: "#0D5EAF"), Color(hex: "#FFFFFF"), Color(hex: "#0D5EAF")]
let hungary: [Color] = [Color(hex: "#CE2939"), Color(hex: "#FFFFFF"), Color(hex: "#477050")]
let iceland: [Color] = [Color(hex: "#003897"), Color(hex: "#FFFFFF"), Color(hex: "#D72828")]
let ireland: [Color] = [Color(hex: "#169B62"), Color(hex: "#FFFFFF"), Color(hex: "#FF883E")]
let italy: [Color] = [Color(hex: "#008C45"), Color(hex: "#FFFFFF"), Color(hex: "#CD212A")]
let kosovo: [Color] = [Color(hex: "#00209F"), Color(hex: "#FFD100"), Color(hex: "#FFFFFF")]
let latvia: [Color] = [Color(hex: "#9E3039"), Color(hex: "#FFFFFF"), Color(hex: "#9E3039")]
let lithuania: [Color] = [Color(hex: "#FDB913"), Color(hex: "#006A44"), Color(hex: "#C1272D")]
let luxembourg: [Color] = [Color(hex: "#00A1DE"), Color(hex: "#FFFFFF"), Color(hex: "#EF3340")]
let malta: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#E41E20"), Color(hex: "#C8102E")]
let moldova: [Color] = [Color(hex: "#0032A0"), Color(hex: "#FFD700"), Color(hex: "#D82010")]
let monaco: [Color] = [Color(hex: "#CE1126"), Color(hex: "#FFFFFF"), Color(hex: "#CE1126")]
let montenegro: [Color] = [Color(hex: "#C6363C"), Color(hex: "#FCDD09"), Color(hex: "#D4AF37")]
let netherlands: [Color] = [Color(hex: "#21468B"), Color(hex: "#FFFFFF"), Color(hex: "#AE1C28")]
let northMacedonia: [Color] = [Color(hex: "#D20000"), Color(hex: "#FFCD00"), Color(hex: "#D20000")]
let norway: [Color] = [Color(hex: "#BA0C2F"), Color(hex: "#FFFFFF"), Color(hex: "#00205B")]
let poland: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#DC143C"), Color(hex: "#FFFFFF")]
let portugal: [Color] = [Color(hex: "#006600"), Color(hex: "#FF0000"), Color(hex: "#FECB00")]
let romania: [Color] = [Color(hex: "#002B7F"), Color(hex: "#FCD116"), Color(hex: "#CE1126")]
let russia: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#D52B1E"), Color(hex: "#0039A6")]
let sanMarino: [Color] = [Color(hex: "#5EB6E4"), Color(hex: "#FFFFFF"), Color(hex: "#D2A31A")]
let serbia: [Color] = [Color(hex: "#C6363C"), Color(hex: "#FFFFFF"), Color(hex: "#002F6C")]
let slovakia: [Color] = [Color(hex: "#0B4EA2"), Color(hex: "#FFFFFF"), Color(hex: "#EF3340")]
let slovenia: [Color] = [Color(hex: "#0B4EA2"), Color(hex: "#FFFFFF"), Color(hex: "#EF3340")]
let spain: [Color] = [Color(hex: "#AA151B"), Color(hex: "#F1BF00"), Color(hex: "#AA151B")]
let sweden: [Color] = [Color(hex: "#005BAC"), Color(hex: "#FECB00"), Color(hex: "#005BAC")]
let switzerland: [Color] = [Color(hex: "#D52B1E"), Color(hex: "#FFFFFF"), Color(hex: "#D52B1E")]
let ukraine: [Color] = [Color(hex: "#0057B7"), Color(hex: "#FFD700"), Color(hex: "#0057B7")]
let unitedKingdom: [Color] = [Color(hex: "#00247D"), Color(hex: "#FFFFFF"), Color(hex: "#CF142B")]
let vaticanCity: [Color] = [Color(hex: "#FFD100"), Color(hex: "#FFFFFF"), Color(hex: "#FFD100")]
let liechtenstein: [Color] = [Color(hex: "#002395"), Color(hex: "#FFD700"), Color(hex: "#D10C32")]
//Asian
let afghanistan: [Color] = [Color(hex: "#000000"), Color(hex: "#D12026"), Color(hex: "#007A3D")]
let azerbaijan: [Color] = [Color(hex: "#009639"), Color(hex: "#EF3340"), Color(hex: "#00B9E4")]
let bahrain: [Color] = [Color(hex: "#CE1126"), Color(hex: "#FFFFFF"), Color(hex: "#CE1126")]
let bangladesh: [Color] = [Color(hex: "#006A4E"), Color(hex: "#F42A41"), Color(hex: "#006A4E")]
let bhutan: [Color] = [Color(hex: "#FFCC33"), Color(hex: "#FF6600"), Color(hex: "#FFFFFF")]
let brunei: [Color] = [Color(hex: "#FFD100"), Color(hex: "#FFFFFF"), Color(hex: "#000000")]
let cambodia: [Color] = [Color(hex: "#032EA1"), Color(hex: "#ED1C24"), Color(hex: "#FFFFFF")]
let china: [Color] = [Color(hex: "#DE2910"), Color(hex: "#FFDE00"), Color(hex: "#DE2910")]
let india: [Color] = [Color(hex: "#FF9933"), Color(hex: "#FFFFFF"), Color(hex: "#138808")]
let indonesia: [Color] = [Color(hex: "#CE1126"), Color(hex: "#FFFFFF"), Color(hex: "#CE1126")]
let iran: [Color] = [Color(hex: "#DA0000"), Color(hex: "#FFFFFF"), Color(hex: "#239F40")]
let iraq: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#000000"), Color(hex: "#CE1126")]
let israel: [Color] = [Color(hex: "#0038B8"), Color(hex: "#FFFFFF"), Color(hex: "#0038B8")]
let japan: [Color] = [Color(hex: "#BC002D"), Color(hex: "#FFFFFF"), Color(hex: "#BC002D")]
let jordan: [Color] = [Color(hex: "#007A3D"), Color(hex: "#CE1126"), Color(hex: "#000000")]
let kazakhstan: [Color] = [Color(hex: "#00AFCA"), Color(hex: "#FFD100"), Color(hex: "#00AFCA")]
let kuwait: [Color] = [Color(hex: "#007A3D"), Color(hex: "#FFFFFF"), Color(hex: "#CE1126")]
let kyrgyzstan: [Color] = [Color(hex: "#FF4C00"), Color(hex: "#FFCC33"), Color(hex: "#FF4C00")]
let laos: [Color] = [Color(hex: "#002868"), Color(hex: "#FFFFFF"), Color(hex: "#D52B1E")]
let lebanon: [Color] = [Color(hex: "#FF0000"), Color(hex: "#FFFFFF"), Color(hex: "#007A3D")]
let malaysia: [Color] = [Color(hex: "#010066"), Color(hex: "#FFFFFF"), Color(hex: "#FFD100")]
let maldives: [Color] = [Color(hex: "#D21034"), Color(hex: "#007E3A"), Color(hex: "#FFFFFF")]
let mongolia: [Color] = [Color(hex: "#C4272F"), Color(hex: "#015197"), Color(hex: "#FFD900")]
let myanmar: [Color] = [Color(hex: "#FED100"), Color(hex: "#007847"), Color(hex: "#EF3340")]
let nepal: [Color] = [Color(hex: "#DC143C"), Color(hex: "#003893"), Color(hex: "#FFFFFF")]
let northKorea: [Color] = [Color(hex: "#024FA2"), Color(hex: "#FFFFFF"), Color(hex: "#ED1C27")]
let oman: [Color] = [Color(hex: "#D52B1E"), Color(hex: "#007A3D"), Color(hex: "#FFFFFF")]
let pakistan: [Color] = [Color(hex: "#01411C"), Color(hex: "#FFFFFF"), Color(hex: "#01411C")]
let philippines: [Color] = [Color(hex: "#0038A8"), Color(hex: "#FF0000"), Color(hex: "#FFFFFF")]
let qatar: [Color] = [Color(hex: "#8A1538"), Color(hex: "#FFFFFF"), Color(hex: "#8A1538")]
let saudiArabia: [Color] = [Color(hex: "#006C35"), Color(hex: "#FFFFFF"), Color(hex: "#006C35")]
let singapore: [Color] = [Color(hex: "#EF3340"), Color(hex: "#FFFFFF"), Color(hex: "#EF3340")]
let southKorea: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#003478"), Color(hex: "#C60C30")]
let sriLanka: [Color] = [Color(hex: "#8D2029"), Color(hex: "#FFD100"), Color(hex: "#00534E")]
let syria: [Color] = [Color(hex: "#FFFFFF"), Color(hex: "#000000"), Color(hex: "#D52B1E")]
let taiwan: [Color] = [Color(hex: "#FEFEFE"), Color(hex: "#000097"), Color(hex: "#FE0000")]
let tajikistan: [Color] = [Color(hex: "#006747"), Color(hex: "#D72E29"), Color(hex: "#F0C300")]
let thailand: [Color] = [Color(hex: "#F4F5F8"), Color(hex: "#2D2A4A"), Color(hex: "#A51931")]
let timorLeste: [Color] = [Color(hex: "#FFD100"), Color(hex: "#000000"), Color(hex: "#D7141A")]
let turkey: [Color] = [Color(hex: "#E30A17"), Color(hex: "#FFFFFF"), Color(hex: "#E30A17")]
let turkmenistan: [Color] = [Color(hex: "#01796F"), Color(hex: "#FFD700"), Color(hex: "#FFFFFF")]
let unitedArabEmirates: [Color] = [Color(hex: "#00732F"), Color(hex: "#000000"), Color(hex: "#CE1126")]
let uzbekistan: [Color] = [Color(hex: "#1EB53A"), Color(hex: "#FFFFFF"), Color(hex: "#0099B5")]
let vietnam: [Color] = [Color(hex: "#DA251D"), Color(hex: "#FFFF00"), Color(hex: "#DA251D")]
let yemen: [Color] = [Color(hex: "#CE1126"), Color(hex: "#FFFFFF"), Color(hex: "#000000")]
//Africa
let algeria: [Color] = [Color(hex: "#006233"), Color(hex: "#FFFFFF"), Color(hex: "#D52B1E")]
let angola: [Color] = [Color(hex: "#000000"), Color(hex: "#D52B1E"), Color(hex: "#FFD100")]
let benin: [Color] = [Color(hex: "#FCD116"), Color(hex: "#008751"), Color(hex: "#E8112D")]
let botswana: [Color] = [Color(hex: "#00CBFF"), Color(hex: "#FFFFFF"), Color(hex: "#000000")]
let burkinaFaso: [Color] = [Color(hex: "#EF2B2D"), Color(hex: "#009739"), Color(hex: "#FFD100")]
let burundi: [Color] = [Color(hex: "#1EB53A"), Color(hex: "#FFFFFF"), Color(hex: "#EF2B2D")]
let caboVerde: [Color] = [Color(hex: "#003893"), Color(hex: "#FFD700"), Color(hex: "#FF0000")]
let cameroon: [Color] = [Color(hex: "#007A5E"), Color(hex: "#FFCE00"), Color(hex: "#CE1126")]
let centralAfricanRepublic: [Color] = [Color(hex: "#003082"), Color(hex: "#FFD700"), Color(hex: "#16A83D")]
let chad: [Color] = [Color(hex: "#002664"), Color(hex: "#FECB00"), Color(hex: "#C60C30")]
let comoros: [Color] = [Color(hex: "#FFD100"), Color(hex: "#FFFFFF"), Color(hex: "#3A75C4")]
let congo: [Color] = [Color(hex: "#218736"), Color(hex: "#FFD100"), Color(hex: "#DC241F")]
let drCongo: [Color] = [Color(hex: "#007FFF"), Color(hex: "#F7D618"), Color(hex: "#CE1021")]
let djibouti: [Color] = [Color(hex: "#6AB2E7"), Color(hex: "#00A551"), Color(hex: "#FFFFFF")]
let egypt: [Color] = [Color(hex: "#CE1126"), Color(hex: "#FFFFFF"), Color(hex: "#000000")]
let equatorialGuinea: [Color] = [Color(hex: "#3E9A00"), Color(hex: "#FFFFFF"), Color(hex: "#D7141A")]
let eritrea: [Color] = [Color(hex: "#478032"), Color(hex: "#12AD2B"), Color(hex: "#C8102E")]
let eswatini: [Color] = [Color(hex: "#003893"), Color(hex: "#FFD100"), Color(hex: "#D01027")]
let ethiopia: [Color] = [Color(hex: "#078930"), Color(hex: "#DA121A"), Color(hex: "#FFD100")]
let gabon: [Color] = [Color(hex: "#009739"), Color(hex: "#FFD100"), Color(hex: "#3A75C4")]
let gambia: [Color] = [Color(hex: "#3A75C4"), Color(hex: "#FFFFFF"), Color(hex: "#E41E2B")]
let ghana: [Color] = [Color(hex: "#006B3F"), Color(hex: "#FCD116"), Color(hex: "#CE1126")]
let guinea: [Color] = [Color(hex: "#CE1126"), Color(hex: "#FCD116"), Color(hex: "#009460")]
let guineaBissau: [Color] = [Color(hex: "#CE1126"), Color(hex: "#FCD116"), Color(hex: "#009739")]
let ivoryCoast: [Color] = [Color(hex: "#F77F00"), Color(hex: "#FFFFFF"), Color(hex: "#009E60")]
let kenya: [Color] = [Color(hex: "#006600"), Color(hex: "#FFFFFF"), Color(hex: "#BB0A30")]
let lesotho: [Color] = [Color(hex: "#00209F"), Color(hex: "#FFFFFF"), Color(hex: "#009639")]
let liberia: [Color] = [Color(hex: "#BF0A30"), Color(hex: "#FFFFFF"), Color(hex: "#002868")]
let libya: [Color] = [Color(hex: "#239E46"), Color(hex: "#D52B1E"), Color(hex: "#000000")]
let madagascar: [Color] = [Color(hex: "#007E3A"), Color(hex: "#FFFFFF"), Color(hex: "#FC3D32")]
let malawi: [Color] = [Color(hex: "#DC241F"), Color(hex: "#00853F"), Color(hex: "#000000")]
let mali: [Color] = [Color(hex: "#14B53A"), Color(hex: "#FFD100"), Color(hex: "#EF2B2D")]
let mauritania: [Color] = [Color(hex: "#006233"), Color(hex: "#FFD100"), Color(hex: "#D52B1E")]
let mauritius: [Color] = [Color(hex: "#EF3340"), Color(hex: "#FFD100"), Color(hex: "#418FDE")]
let morocco: [Color] = [Color(hex: "#C1272D"), Color(hex: "#006233"), Color(hex: "#C1272D")]
let mozambique: [Color] = [Color(hex: "#FFD100"), Color(hex: "#FFFFFF"), Color(hex: "#000000")]
let namibia: [Color] = [Color(hex: "#003580"), Color(hex: "#FFD100"), Color(hex: "#009739")]
let niger: [Color] = [Color(hex: "#0DB02B"), Color(hex: "#FFFFFF"), Color(hex: "#E05206")]
let nigeria: [Color] = [Color(hex: "#008753"), Color(hex: "#FFFFFF"), Color(hex: "#008753")]
let rwanda: [Color] = [Color(hex: "#1C9B38"), Color(hex: "#00A1DE"), Color(hex: "#FFD100")]
let saoTomeAndPrincipe: [Color] = [Color(hex: "#12AD2B"), Color(hex: "#FFD100"), Color(hex: "#D7141A")]
let senegal: [Color] = [Color(hex: "#00853F"), Color(hex: "#FFD100"), Color(hex: "#E31B23")]
let seychelles: [Color] = [Color(hex: "#003D84"), Color(hex: "#FFD100"), Color(hex: "#FF0000")]
let sierraLeone: [Color] = [Color(hex: "#1EB53A"), Color(hex: "#FFFFFF"), Color(hex: "#0072CE")]
let somalia: [Color] = [Color(hex: "#4189DD"), Color(hex: "#FFFFFF"), Color(hex: "#4189DD")]
let southAfrica: [Color] = [Color(hex: "#007847"), Color(hex: "#FFD100"), Color(hex: "#000000")]
let southSudan: [Color] = [Color(hex: "#00843D"), Color(hex: "#FDEF42"), Color(hex: "#BF0D3E")]
let sudan: [Color] = [Color(hex: "#007A3D"), Color(hex: "#FFFFFF"), Color(hex: "#CE1126")]
let tanzania: [Color] = [Color(hex: "#FCD116"), Color(hex: "#003893"), Color(hex: "#007A3D")]
let togo: [Color] = [Color(hex: "#006A4E"), Color(hex: "#FFD100"), Color(hex: "#D21034")]
let tunisia: [Color] = [Color(hex: "#E70013"), Color(hex: "#FFFFFF"), Color(hex: "#E70013")]
let uganda: [Color] = [Color(hex: "#FFCD00"), Color(hex: "#000000"), Color(hex: "#D21034")]
let zambia: [Color] = [Color(hex: "#E03C31"), Color(hex: "#007749"), Color(hex: "#F77F00")]
let zimbabwe: [Color] = [Color(hex: "#006A4E"), Color(hex: "#FFD100"), Color(hex: "#D21034")]
// Oceania
let australia: [Color] = [Color(hex: "#00247D"), Color(hex: "#FFFFFF"), Color(hex: "#FE0000")]
let fiji: [Color] = [Color(hex: "#003F87"), Color(hex: "#FFFFFF"), Color(hex: "#FE0000")]
let kiribati: [Color] = [Color(hex: "#CE1126"), Color(hex: "#FCD116"), Color(hex: "#0033A0")]
let marshallIslands: [Color] = [Color(hex: "#003893"), Color(hex: "#F77F00"), Color(hex: "#FFFFFF")]
let micronesia: [Color] = [Color(hex: "#75B2DD"), Color(hex: "#FFFFFF"), Color(hex: "#75B2DD")]
let nauru: [Color] = [Color(hex: "#002B7F"), Color(hex: "#FFC726"), Color(hex: "#FFFFFF")]
let newZealand: [Color] = [Color(hex: "#00247D"), Color(hex: "#FFFFFF"), Color(hex: "#FE0000")]
let palau: [Color] = [Color(hex: "#4AADD6"), Color(hex: "#FFDE00"), Color(hex: "#4AADD6")]
let papuaNewGuinea: [Color] = [Color(hex: "#D21034"), Color(hex: "#000000"), Color(hex: "#FFD100")]
let samoa: [Color] = [Color(hex: "#002B7F"), Color(hex: "#FFFFFF"), Color(hex: "#D52B1E")]
let solomonIslands: [Color] = [Color(hex: "#007847"), Color(hex: "#FFD100"), Color(hex: "#0033A0")]
let tonga: [Color] = [Color(hex: "#C8102E"), Color(hex: "#FFFFFF"), Color(hex: "#C8102E")]
let tuvalu: [Color] = [Color(hex: "#C8102E"), Color(hex: "#75B2DD"), Color(hex: "#FFD100")]
let vanuatu: [Color] = [Color(hex: "#000000"), Color(hex: "#FFD100"), Color(hex: "#00843D")]

