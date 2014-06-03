//
//  URLSession.swift
//  NANDOR
//
//  Created by Chris Nandor on 2014.06.02.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import Foundation

var configuration = NSURLSessionConfiguration();
var session = NSURLSession(configuration: configuration)

class URLSession:NSObject {
    func makeRequest(baseURL:String, with:String) {
        NSLog("%@?%@", baseURL, with)
        return

        var url = NSURL(string: "\(baseURL)?\(with)")
        var dataTask = session.dataTaskWithHTTPGetRequest(url)
        dataTask.resume()
    }
}