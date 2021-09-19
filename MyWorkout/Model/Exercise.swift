//
//  Exercise.swift
//  MyWorkout
//
//  Created by Kunatip Satsomnuk on 10/9/2564 BE.
//

import Foundation

struct Exercise {
    let exerciseName: String
    let videoName: String
    
    enum ExerciseEnum: CustomStringConvertible {
        case squat
        case stepUp
        case burpee
        case sunSalute
        case lunges
        case pushUp
        case planks
        
        var description: String {
            switch self {
            case .squat:
                return NSLocalizedString("Squat", comment: "exercise")
            case .stepUp:
                return NSLocalizedString("Step Up", comment: "exercise")
            case .burpee:
                return NSLocalizedString("Burpee", comment: "exercise")
            case .sunSalute:
                return NSLocalizedString("Sun Salute", comment: "exercise")
            case .lunges:
                return NSLocalizedString("Lunges", comment: "exercise")
            case .pushUp:
                return NSLocalizedString("Push Up", comment: "exercise")
            case .planks:
                return NSLocalizedString("Planks", comment: "exercise")
            }
        }
    }
}

extension Exercise {
    static let exercises = [
        Exercise(exerciseName: String(describing: ExerciseEnum.squat), videoName: "squat"),
        Exercise(exerciseName: String(describing: ExerciseEnum.stepUp), videoName: "step-up"),
        Exercise(exerciseName: String(describing: ExerciseEnum.burpee), videoName: "burpee"),
        Exercise(exerciseName: String(describing: ExerciseEnum.sunSalute), videoName: "sun-salute"),
        Exercise(exerciseName: String(describing: ExerciseEnum.lunges), videoName: "lunges"),
        Exercise(exerciseName: String(describing: ExerciseEnum.pushUp), videoName: "push-up"),
        Exercise(exerciseName: String(describing: ExerciseEnum.planks), videoName: "planks")
    ]
}
