import Foundation


struct ContactosManage {
    private var fileURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("contactos").appendingPathExtension("json")
    }
    
    func save(contactos: ContactoModel) {
        var con: [ContactoModel] = load()
        
        con.append(contactos)
        
        do {
            let data = try JSONEncoder().encode(con)
            try data.write(to: fileURL)
        } catch {
            print("Erro ao salvar os contactos: \(error)")
        }
    }
    
    func load() -> [ContactoModel] {
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([ContactoModel].self, from: data)
        } catch {
            print("Erro ao carregar os contactos: \(error)")
            return []
        }
    }
    
    func saveArray(contactos: [ContactoModel]) {
        do {
            let data = try JSONEncoder().encode(contactos)
            try data.write(to: fileURL)
        } catch {
            print("Erro ao salvar os contactos: \(error)")
        }
    }
}
