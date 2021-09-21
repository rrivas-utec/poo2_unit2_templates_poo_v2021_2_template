# Task #2: Templates  
**course:** Programación Orientada a Objetos II  
**unit:** Unidad 2  
**cmake project:** poo2_unit2_templates_poo_v2021_2
## Instructions


## Question #1 - python input (2 points)

Crear la función template **`input`** que simula el funcionamiento de la función de python **`input`**.

**Use Case:**
```cpp
    // Por default el template retorna un std::string
    auto text = input();
    auto entero = input<int>("Ingrese un numero: ");
    auto real = input<double>("Ingrese un numero: ");
    std::cout << "El texto es: " << text << endl;
    std::cout << "El entero es: " << entero << endl;
    std::cout << "El real es: " << real << endl;
```

## Question #2 - print  (2 points)

Crear la función template **`print`** que permita imprimir el contenido de un contenedor, incluyendo un delimitador, un objeto del tipo **`std::ostream`** que recibirá el contenido del contenedor.

**Use Case:**
```cpp
    // Vector
    std::vector<int> vec = {10, 20, 30, 40, 50, 60};
    // Imprimir en consola
    print(begin(vec), end(vec), std::cout, "-");
    // Grabarlos en un archivo
    std::ofstream file("out.txt");
    print(begin(vec), end(vec), file, "|");
    // Imprimir la mitad de valores
    auto last_it = next(begin(vec), vec.size() / 2);
    print(begin(vec), last_it, std::cout, "-");
    
```

## Question #3 - sumarizar (2 points)

Crear la función template **`sumarizar`** que permita sumar el contenido de un contenedor con valores numéricos, que incluya un parámetro que defina un valor inicial.

**Use Case:**
```cpp
    // Contenedor 
    std::list<double> lst = {10.5, 20.4, 30.2, 40.5, 50.9, 60.5};
    cout << "Total: " << sumarizar(begin(lst), end(lst), 0) << endl;
    // Calcular la mitad de valores inferior
    auto last_it = next(begin(lst), size(lst) / 2);
    cout << "Sumatoria de la mitad: " << sumarizar(begin(lst), last_it, 0) << endl;
```

## Question #4 - puntero inteligente (4 points)
Crear la clase template **`smart_ptr`** que simule un puntero inteligente (la memoria es liberada automáticamente) y la función template **`make_smart_ptr`** que simule el operador **`new`**. Sobrecargar el operador de-referencia `*`, el operador arrow `->`.


**Use Case #1:**
```cpp
    smart_ptr<int> sp1; // puntero inteligente no inicializado
    sp1 = make_smart_ptr<int>(10);
    
    cout << *sp1 << endl;   // Imprimiendo el contenido

    // puntero inteligente no inicializado
    smart_ptr<string> sp2 = make_smart_ptr<string>("Hola"); 
    cout << *sp2 << endl;
```

**Use Case #2:**
```cpp
    class point {
        int x;
        int y;
    public:
        point(int x, int y): x{x}, y{y} {}
        point() = default;
        
        friend ostream& operator<< (ostream& os, const point& p) {
            os << "{" << x <<", " << y << "}" << endl;
            return os;
        }

        int get_x() { return x; }
        int get_y() { return y; }
    };

    smart_ptr<point> sp1; // puntero inteligente no inicializado
    sp1 = make_smart_ptr<point>(20, 30);
    
    cout << *sp1 << endl;   // Imprimiendo el contenido

    smart_ptr<point> sp2 = make_smart_ptr<point>(10, 40); // puntero inteligente no inicializado
    cout << sp2->get_x() << endl;
    cout << sp2->get_y() << endl;
```

## Question #5 - suma producto (2 points)
Crear la función template **`suma_producto`** del tipo variadic que permita tomar de 2 en 2 los parámetros de la función template, calcule el producto y que realice la suma de todos los productos. En caso la cantidad de valores variados sea impar el último valor será considerado en la suma.

**Use Case #1:**
```cpp
    std::cout << suma_producto(1, 10, 3, 5) << endl; // El resultado seria: 25
```
**Use Case #2:**
```cpp
    std::cout << suma_producto(1) << endl; // El resultado seria: 1
```
**Use Case #3:**
```cpp
    std::cout << suma_producto(2, 10.5, 14.0, 1, 11.0) << endl; // El resultado seria: 46
```

**Use Case #3:**
```cpp
    std::cout << suma_producto(-2, 0, 1, 0, 0) << endl; // El resultado seria: 0
```

## Question #6 - Retornar el indice (4 points)
Crear la función template **`index_of`** que retorne la posición del tipo de dato del parámetro de la funcion, comparado con una lista de tipos, en caso el tipo no se encuentra entonces la funcion retornara -1.

**Use Case #1:**
```cpp
    char var1{};
    std::cout << index_of<int, char>(var1) << endl; // El resultado seria: 1 
```

**Use Case #2:**
```cpp
    string var2;
    std::cout << index_of<int, char, double, float, string>(var2) << endl; // El resultado seria: 4
```

**Use Case #3:**
```cpp
    vector<int> var3;
    std::cout << index_of<int, char, vector<int>, list<double>>(var3) << endl; // El resultado seria: 2 
```

**Use Case #4:**
```cpp
    vector<double> var4;
    std::cout << index_of<int, char, vector<int>, list<double>>(var4) << endl; // El resultado seria: -1 
```


## Question #7 - Operador << (2 points)

La librería de C++ no permite usar directamente el operador `std::cout` de forma similar que en el caso de variables simples, por ejemplo:
```cpp
    int var = 20
    std::cout << "El valor de var es: " << var << std::endl;    // El valor de var es: 20
```
En cambio en contenedores por ejemplo del tipo `std::array`, `std::vector`, `std::list` o `std::map` no permite por ejemplo:
```cpp
    std::list<int> lst = {10, 20, 30};
    std::cout << "Los valores de lst son: " << lst << std::endl; // NO PERMITIDO
    std::map<char, int> mp = {{'a', 10}, {'b', 20}, {'c', 30}};
    std::cout << "Los valores de mp son: " << mp << std::endl; // NO PERMITIDO
```
Desarrollo el template de sobrecarga del `operador <<` que permita generalizar el uso de `std::cout` para el caso de los siguientes contenedores:
- `std::array` 
- `std::vector` 
- `std::list`
- `std::map` 

**Use Case #1:**
```cpp
    std::array<int, 3> arr = {10, 20, 30};
    std::cout << "Los valores de arr son: " << arr << std::endl; // Los valores de lst son: {10, 20, 30}
```

**Use Case #2:**
```cpp
    std::vector<int> vec = {10, 20, 30};
    std::cout << "Los valores de vec son: " << vec << std::endl; // Los valores de lst son: {10, 20, 30}
```

**Use Case #3:**
```cpp
    std::list<int> lst = {10, 20, 30};
    std::cout << "Los valores de lst son: " << lst << std::endl; // Los valores de lst son: {10, 20, 30}
```

**Use Case #4:**
```cpp
    std::map<char, int> mp = {{'a', 10}, {'b', 20}, {'c', 30}};
    std::cout << "Los valores de mp son: " << mp << std::endl; // Los valores de mp son: {{a: 10}, {b: 20}, {c: 30}}
```

## Question #8 - los mismos tipos (2 points)
Generar un template funcion `are_same` que verifique si todos los tipos de una lista de tipos son iguales.

**Use Case #1:**
```cpp
    cout << boolalpha << are_same<int>() << endl; // true
```

**Use Case #2:**
```cpp
    cout << boolalpha << are_same<int, int , char>() << endl; // false
```

**Use Case #3:**
```cpp
    cout << boolalpha << are_same<vector<int>, vector<int> , vector<int>>() << endl; // true
```

**Use Case #4:**
```cpp
    cout << boolalpha << are_same<int, const int, int&, int &&>() << endl; // false
```


