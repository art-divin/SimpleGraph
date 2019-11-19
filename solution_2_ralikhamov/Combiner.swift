//
//  Combiner.swift
//  solution_2_ralikhamov
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import Interfaces
import Backend

class Combiner {
    
    var providers : [Provider] = []
    
    func provider<T>(by cls: T.Type) -> T? {
        if let module = self.providers.first(where: { type(of: $0) == type(of: cls) || $0 is T }) {
            return module as? T
        }
        return nil
    }
    
    func combine() {
        let backend = Backend()
        self.providers.append(backend)
    }
    
}
