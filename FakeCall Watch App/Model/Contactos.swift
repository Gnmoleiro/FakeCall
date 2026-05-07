import Foundation

struct ContactoModel: Codable, Identifiable {
    let id: UUID
    let nome: String
    let numero: String
    let color: String
}
