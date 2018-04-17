//
//  ViewModelFactory.swift
//  OmniPharm
//
//  Created by Beslan Tularov on 07.03.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

protocol Delegatable: class {}

///// Factory for ViewModels
//class ViewModelFactory {
//    
//    enum ViewModelTypes {
//        case doctors
//        case catigories
//    }
//
//    private init() { }
//
//    /// Создает ViewModel для конфигурации ячеек
//    ///
//    /// - Parameters:
//    ///   - type: <#type description#>
//    ///   - arguments: <#arguments description#>
//    ///   - delegate: <#delegate description#>
//    /// - Returns: <#return value description#>
//    static func produce(type: ViewModelTypes, arguments: Model?, delegate: Delegatable?) -> AnyCellViewModel {
//        var viewModel: AnyCellViewModel
//        switch type {
//        case .doctors: viewModel = DoctorsViewModel
//        case .catigories: viewModel =
//        }
//        return viewModel
//    }
//
//    /// Создает ViewModel для конфигурации ячеек без делегирования
//    ///
//    /// - Parameters:
//    ///   - type: ViewModelType
//    ///   - arguments: Decodable?
//    /// - Returns: ViewModel
//    static func produce(type: ViewModelTypes, arguments: Model?) -> AnyCellViewModel {
//        return produce(type: type, arguments: arguments, delegate: nil)
//    }
//}

