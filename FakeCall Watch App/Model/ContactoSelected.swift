import Foundation

struct ContactoSelected {
    
    private var fileURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("contactoSelected").appendingPathExtension("json")
    }
    
    func save(contactos: ContactoModel) {
        do {
            let data = try JSONEncoder().encode(contactos)
            try data.write(to: fileURL)
        } catch {
            print("Erro ao salvar o contacto: \(error)")
        }
    }
    
    func load() -> ContactoModel? {
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode(ContactoModel.self, from: data)
        } catch {
            return nil
        }
    }
    
    func clear() {
        do {
            if FileManager.default.fileExists(atPath: fileURL.path) {
                try FileManager.default.removeItem(at: fileURL)
                print("Ficheiro eliminado com sucesso.")
            }
        } catch {
            print("Erro ao apagar o contacto: \(error)")
        }
    }
}
