# Spring Boot Java Features Starter Project

Minimum Spring Boot Starter Project with test classes built using gradle.

Show the main features of Java Language.

Copy from `SpringBootStarters/SpringBootStarterProject`

## Java 8: java Lambda Expression

### 🚀 **Java Lambda Expressions** (Introduced in Java 8)

A **Lambda Expression** is a **concise way** to represent **anonymous functions** (functions without a name) in Java. It enables **functional programming** by treating functions as first-class citizens, allowing **inline implementation** of methods from **functional interfaces**.

---

### ✅ **Syntax of Lambda Expression:**
```java
(parameter1, parameter2) -> { body of the method }
```

- **Parameters**: Input parameters (like method parameters).
- **Arrow Operator (`->`)**: Separates parameters and method body.
- **Body**: The code to be executed.

---

### ✅ **Example of Lambda Expression:**

#### **Without Lambda:**
```java
List<String> names = Arrays.asList("Alice", "Bob", "Charlie");

// Using an anonymous class
names.forEach(new Consumer<String>() {
    @Override
    public void accept(String name) {
        System.out.println(name);
    }
});
```

#### **With Lambda:**
```java
List<String> names = Arrays.asList("Alice", "Bob", "Charlie");

// Using a lambda expression
names.forEach(name -> System.out.println(name));
```

---

### ✅ **Types of Lambda Expressions**

| **Type**                       | **Example**                  | **Description**                                  |
|--------------------------------|-----------------------------|--------------------------------------------------|
| No parameters                  | `() -> System.out.println("Hello")` | Lambda with no input parameters                 |
| Single parameter               | `x -> x * x`                | Lambda with one input parameter                 |
| Multiple parameters            | `(x, y) -> x + y`           | Lambda with two or more parameters              |
| Block body with return statement | `(x, y) -> { return x + y; }` | Lambda with a block body and return statement   |

---

### ✅ **Examples of Lambda Expressions:**

#### 🔷 **Example 1: No Parameters**
```java
Runnable task = () -> System.out.println("Task is running");
new Thread(task).start();
```

---

#### 🔷 **Example 2: Single Parameter**
```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
numbers.forEach(n -> System.out.println(n * n));
```

---

#### 🔷 **Example 3: Multiple Parameters**
```java
BiFunction<Integer, Integer, Integer> add = (a, b) -> a + b;
System.out.println(add.apply(10, 20));  // Output: 30
```

---

### ✅ **Using Lambda with Functional Interfaces**

Lambda expressions are used to implement **functional interfaces** (interfaces with a single abstract method).

#### 🔷 **Example: Implementing `Runnable` Interface**
```java
Runnable runnable = () -> System.out.println("Lambda Runnable is running!");
new Thread(runnable).start();
```

#### 🔷 **Example: Using `Predicate` Interface**
```java
Predicate<String> isLongString = s -> s.length() > 10;
System.out.println(isLongString.test("Hello, world!"));  // Output: true
```

---

### ✅ **Common Functional Interfaces in Java 8:**

| **Interface**   | **Method**           | **Description**                             | **Example**                      |
|-----------------|----------------------|---------------------------------------------|----------------------------------|
| `Runnable`      | `void run()`          | Represents a task                          | `() -> System.out.println("Run")` |
| `Consumer<T>`   | `void accept(T t)`    | Consumes an input                          | `x -> System.out.println(x)`      |
| `Supplier<T>`   | `T get()`             | Supplies a value                           | `() -> "Hello"`                   |
| `Function<T,R>` | `R apply(T t)`        | Transforms an input into an output         | `x -> x * 2`                      |
| `Predicate<T>`  | `boolean test(T t)`   | Tests a condition                          | `x -> x > 10`                     |
| `BiFunction<T,U,R>` | `R apply(T t, U u)` | Transforms two inputs into an output       | `(a, b) -> a + b`                 |

---

### ✅ **Using Lambda Expressions with Stream API**

The **Stream API** in Java 8 works seamlessly with lambda expressions for **filtering**, **mapping**, and **reducing** collections.

#### **Example: Using Stream with Lambda**
```java
List<String> names = Arrays.asList("Alice", "Bob", "Charlie");

names.stream()
    .filter(name -> name.startsWith("A"))
    .forEach(System.out::println);
```

**Output:**
```
Alice
```

---

### ✅ **Advantages of Lambda Expressions:**
1. **Concise and readable** code.
2. Enables **functional programming** in Java.
3. **Reduces boilerplate code** by eliminating anonymous classes.
4. Works seamlessly with **Stream API** and **Collections**.

---

### ✅ **Summary of Key Points:**

| **Feature**          | **Description**                                  |
|----------------------|--------------------------------------------------|
| Functional Interface  | Interface with a single abstract method         |
| Lambda Syntax         | `(parameters) -> { method body }`               |
| Method References     | Shorthand for calling existing methods          |
| Stream API            | Supports functional operations on collections   |

---

## Java 8: method reference operator

The method reference operator (::) is a feature introduced in Java 8 that provides a
shorthand for lambda expressions when the method being called is already defined. It
allows you to refer to a method without invoking it, improving the readability and
conciseness of your code.

### **Lambda Expression vs. Method Reference**

| **Lambda Expression**         | **Equivalent Method Reference** |
|--------------------------------|---------------------------------|
| `(a, b) -> Math.max(a, b)`     | `Math::max`                     |
| `str -> System.out.println(str)` | `System.out::println`          |
| `() -> new ArrayList<>()`      | `ArrayList::new`                |

---

### **Use Cases of Method References**

- **Improves code readability** by reducing boilerplate.
- **Useful in functional programming** with Java's **Stream API** and **Functional Interfaces**.
- **Simplifies lambda expressions** when the method already exists.

---

### **When to Use Method References:**

- When a **lambda expression** calls an **existing method** without modifying it.
- When using **Stream API operations** such as `forEach()`, `map()`, `filter()`, etc.

---

## Technologies Guide

- Spring Boot
- JUnit
- Log4j2
- lombok
- Gradle 
