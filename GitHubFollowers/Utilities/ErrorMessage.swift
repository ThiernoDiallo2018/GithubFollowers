//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Thierno Diallo on 6/8/24.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username create an invalid request. Please Try "
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
}
