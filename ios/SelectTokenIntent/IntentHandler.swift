//
//  IntentHandler.swift
//  SelectTokenIntent
//
//  Created by Ben Goldberg on 10/28/21.
//

import Intents

@available(iOS 14.0, *)
class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}

@available(iOS 14.0, *)
extension IntentHandler: SelectTokenIntentHandling {
  func provideTokenOptionsCollection(
    for intent: SelectTokenIntent,
    with completion: @escaping (INObjectCollection<Token>?, Error?) -> Void
  ) {
    var top100 = ["no address": 1, "0xB8c77482e45F1F44dE1745F52C74426C631bDD52": 2, "0x2b591e99afe9f32eaa6214f7b7629768c40eeb39": 3, "0x514910771af9ca656af840dff83e8264ecf986ca": 4, "0x2260fac5e5542a773aa44fbcfedf7c193bc2c599": 5, "0x1f9840a85d5af5bf1d1762f925bdaddc4201f984": 6, "0xd850942ef8811f2a866692a623011bde52a462c1": 7, "0xa0b73e1ff0b80914ab6fe0444e65848c4c34450b": 8, "0x75231f58b43240c9718dd58b4967c5114342a86c": 9, "0xe1be5d3f34e89de342ee97e6e90d405884da6c67": 10, "0x6e1A19F235bE7ED8E3369eF73b196C07257494DE": 11, "0x3883f5e181fccaf8410fa61e12b59bad963fb645": 13, "0x4e15361fd6b4bb609fa63c81a2be19d873717870": 14, "0xae7ab96520de3a18e5e111b5eaab095312d7fe84": 15, "0x7f39c581f595b53c5cb19bd0b3f8da6c935e2ca0": 16, "0xc944e90c64b2c07662a292be6244bdf05cda44a7": 17, "0xbbbbca6a901c926f240b89eacb641d8aec7aeafd": 18, "0x4a220e6096b25eadb88358cb44068a3248254675": 19, "0x2af5d2ad76741191d15dfe7bf6ac92d4bd912ca3": 20, "0xfd09cf7cfffa9932e33668311c4777cb9db3c9be": 22, "0x799a4202c12ca952cb311598a024c80ed371a41e": 23, "0xff20817765cb7f73d4bde2e66e067e58d11095c2": 24, "0x9f8f72aa9304c8b593d555f12ef6589cc3a579a2": 25, "0x0316EB71485b0Ab14103307bf65a021042c6d380": 26, "0x3506424f91fd33084466f402d5d97f05f8e3b4af": 27, "0xf629cbd94d3791c9250152bd8dfbdf380e2a3b9c": 28, "0x99d8a9c45b2eca8864373a26d1459e3dff1e17f3": 29, "0xe83cccfabd4ed148903bf36d4283ee7c8b3494d1": 30, "0x6c6ee5e31d828de241282b9606c8e98ea48526e2": 31, "0xd26114cd6EE289AccF82350c8d8487fedB8A0C07": 32, "0x6b3595068778dd592e39a122f4f5a5cf09c90fe2": 33, "0x16631e53c20fd2670027c6d53efe2642929b285c": 34, "0x3845badAde8e6dFF049820680d1F14bD3903a5d0": 35, "0xc00e94cb662c3520282e6f5717214004a7f26888": 36, "0xe452e6ea2ddeb012e20db73bf5d3863a3ac8d77a": 37, "0xaaaebe6fe48e54f431b0c390cfaf0b017d09d42d": 38, "0xc011a73ee8576fb46f5e1c5751ca3b9fe0af2a6f": 39, "0xb62132e35a6c13ee1ee0f84dc5d40bad8d815206": 40, "0x6fb3e0a217407efff7ca062d46c26e5d60a14d69": 41, "0x58b6a8a3302369daec383334672404ee733ab239": 42, "0xf34960d9d60be18cc1d5afc1a6f012a723a28811": 43, "0x6f259637dcd74c767781e37bc6133cd6a68aa161": 44, "0x0d8775f648430679a709e98d2b0cb6250d2887ef": 45, "0x8dae6cb04688c62d939ed9b68d32bc62e49970b1": 46, "0x3103df8f05c4d8af16fd22ae63e406b97fec6938": 47, "0xd7c49cee7e9188cca6ad8ff264c1da2e69d4cf3b": 48, "0x467Bccd9d29f223BcE8043b84E8C8B282827790F": 49, "0x05f4a42e251f2d52b8ed15e9fedaacfcef1fad27": 50, "0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e": 51, "0x41ab1b6fcbb2fa9dced81acbdec13ea6315f2bf2": 52, "0xeb4c2781e4eba804ce9a9803c67d0893436bb27d": 53, "0x1f573d6fb3f13d689ff844b4ce37794d79a7ff1c": 54, "0xe41d2489571d322189246dafa5ebde1f4699f498": 55, "0xc18360217d8f7ab5e7c516566761ea12ce7f9d72": 56, "0x92d6c1e31e14520e676a687f0a93788b716beff5": 57, "0x476c5E26a75bd202a9683ffD34359C0CC15be0fF": 58, "0x04Fa0d235C4abf4BcF4787aF4CF447DE572eF828": 59, "0x39bb259f66e1c59d5abef88375979b4d20d98022": 60, "0xb4efd85c19999d84251304bda99e90b92300bd93": 61, "0x761d38e5ddf6ccf6cf7c55759d5210750b5d60f3": 62, "0x3432b6a60d23ca0dfca7761b7ab56459d9c964d0": 63, "0xfa1a856cfa3409cfa145fa4e20eb270df3eb21ab": 64, "0x853d955acef822db058eb8505911ed77f175b99e": 65, "0xaa7a9ca87d3694b5755f213b5d04094b8d0f0a6f": 66, "0x4691937a7508860f876c9c0a2a617e7d9e945d4b": 67, "0x55296f69f40ea6d20e478533c15a6b08b654e758": 68, "0x111111111117dc0aa78b770fa6a738034120c302": 69, "0x4f9254c83eb525f9fcf346490bbb3ed28a81c667": 70, "0x767fe9edc9e0df98e07454847909b5e959d7ca0e": 71, "0x6810e776880c02933d47db1b9fc05908e5386b96": 72, "0xfd1e80508f243e64ce234ea88a5fd2827c71d4b7": 73, "0x8A2279d4A90B6fe1C4B30fa660cC9f926797bAA2": 74, "0xba9d4199fab4f26efe3551d490e3821486f135ba": 75, "0xaea46A60368A7bD060eec7DF8CBa43b7EF41Ad85": 76, "0x3597bfd533a99c9aa083587b074434e61eb0a258": 77, "0x9992ec3cf6a55b00978cddf2b27bc6882d88d1ec": 78, "0xc7283b66eb1eb5fb86327f08e1b5816b0720212b": 79, "0x956F47F50A910163D8BF957Cf5846D573E7f87CA": 80, "0x7DD9c5Cba05E151C895FDe1CF355C9A1D5DA6429": 81, "0xe28b3B32B6c345A34Ff64674606124Dd5Aceca30": 82, "0x69af81e73a73b40adf4f3d4223cd9b1ece623074": 83, "0xa1faa113cbe53436df28ff0aee54275c13b40975": 84, "0x8c15ef5b4b21951d50e53e4fbda8298ffad25057": 85, "0x0fd10b9899882a6f2fcb5c371e17e70fdee00c38": 86, "0xD291E7a03283640FDc51b121aC401383A46cC623": 87, "0x8ce9137d39326ad0cd6491fb5cc0cba0e089b6a9": 88, "0x0f2d719407fdbeff09d87557abb7232601fd9f29": 89, "0x43Dfc4159D86F3A37A5A4B3D4580b888ad7d4DDd": 90, "0x8207c1ffc5b6804f6024322ccf34f29c3541ae26": 91, "0x967da4048cD07aB37855c090aAF366e4ce1b9F48": 92, "0x4575f41308EC1483f3d399aa9a2826d74Da13Deb": 93, "0x744d70fdbe2ba4cf95131626614a1763df805b9e": 94, "0xba11d00c5f74255f56a5e366f4f77f5a186d7f55": 95, "0x85eee30c52b0b379b046fb0f85f4f3dc3009afec": 96, "0xcca0c9c383076649604eE31b20248BC04FdF61cA": 97, "0x8400d94a5cb0fa0d041a3788e395285d61c9ee5e": 98, "0xf16e81dce15b08f326220742020379b855b87df9": 99, "0xff56cc6b1e6ded347aa0b7676c85ab0b3d08b0fa": 100, "0x45804880De22913dAFE09f4980848ECE6EcbAf78": 101, "0x607F4C5BB672230e8672085532f7e901544a7375": 102, "0xfc82bb4ba86045af6f327323a46e80412b91b27d": 103]
    
    var topTokenItems = [Token]()
    var otherTokenItems = [Token]()
    let tokenProvider = TokenProvider.shared
    var tokens = tokenProvider.getTokens()

    let partition = tokens.partition(by: { top100.keys.contains($0.address!) })
    let otherTokens = tokens[..<partition]
    let topTokens = tokens[partition...]
    
    topTokenItems = topTokens.map { token in
      Token(identifier: token.address!.lowercased(), display: token.name! + " (" + token.symbol! + ")")
    }

    otherTokenItems = otherTokens.map { token in
      Token(identifier: token.address!.lowercased(), display: token.name! + " (" + token.symbol! + ")")
    }

    top100.keys.forEach {
      top100[$0.lowercased()] = top100.removeValue(forKey: $0)
    }

    topTokenItems.sort(by: {
      top100[$0.identifier!]! < top100[$1.identifier!]!
    })

    otherTokenItems.sort(by: {
      $0.displayString < $1.displayString
    })
    
    completion(INObjectCollection(sections: [
      INObjectSection(title: "Top Tokens", items: topTokenItems),
      INObjectSection(title: "More Tokens", items: otherTokenItems)
    ]), nil)
  }
}