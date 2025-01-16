//
//  Dictionary+Extensions.swift
//  RDC
//
//  Created by James OMahoney on 11/20/20.
//  Copyright © 2020 ProfitStars. All rights reserved.
//

import Foundation

extension Dictionary {

    public func makeQueryString(params : [String : Any])-> String{
        
        let urlParams = params.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")
        var urlString = urlParams
        if let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)?.replacingOccurrences(of: "+", with: "%2B"){
            urlString = url
        }
        return urlString
    }
}
