###Solid Principles

####Single Responsability Principle (SRP)

- the idea that each class serves one purpose. If it serves more than one purpose, separate it into different classes;
This creates a solid boundary as to what the class actually represents

####Open/Closed Principle(OCP)

- Entities should be open for extension but closed for modification;

(changing the existing code might change the existing behavior and introduce regressions; also, the system should become more predictable and more maintainable by following OCP)

####Abstract Base Class

- OOP concept of a class that cannot be instanciated (we cannot create an object directly from this class) on its own and is designed to be subclassed.

####Liskov Substitution Principle (LSP)

- Functions that use pointers of references to base classes must be able to use objects of derived classes without knowing it

####Interface Segregation Principle

- Dividing the software into multiple, independent parts

####Dependency Inversion Principle

- Abstractions should not depend on details. Details should depend on abstractions
