//
// Created by Austin Anaya on 10/27/23
//

import FirebaseDatabase
import Combine
import FirebaseFirestore

extension DatabaseReference {
    func toAnyPublisher<T>() -> AnyPublisher<T?, Never> {
        let subject = CurrentValueSubject<T?, Never>(nil)

        let handle = observe(.value, with: { snapshot in
            subject.send(snapshot.value as? T)
        })

        return subject.handleEvents(receiveCancel: {[weak self] in
            self?.removeObserver(withHandle: handle)
        }).eraseToAnyPublisher()
    }
}
