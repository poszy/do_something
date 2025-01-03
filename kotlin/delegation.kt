package pena.luis.hw10

import kotlin.properties.ReadWriteProperty
import kotlin.reflect.KProperty

class CountingDelegate<T>(private var value: T) : ReadWriteProperty<Any?, T> {
    companion object {

        private val counts = mutableMapOf<String, Int>()

        fun dumpCounts() {
            println("Property reads:")
            counts.forEach { (property, count) ->
                println("   $property: $count")
            }
        }
    }

    // from kotlin documentation
    override fun getValue(thisRef: Any?, property: KProperty<*>): T {
        counts[property.name] = counts.getOrDefault(property.name, 0) + 1
        return value
    }

    override fun setValue(thisRef: Any?, property: KProperty<*>, value: T) {
        this.value = value
    }
}

class Person(names: String, ages: Int) {
    var name: String by CountingDelegate(names)
    var age: Int by CountingDelegate(ages)
}

// Expected output:
// Scott
// Humuhumunukunukuapua'a
// Voltron
// Godzilla
// 57
// 58
// 59
// Property reads:
//   name: 4
//   age: 3


fun main() {
    val person = Person("Scott", 57)
    println(person.name)
    person.name = "Humuhumunukunukuapua'a"
    println(person.name)
    person.name = "Voltron"
    println(person.name)
    person.name = "Godzilla"
    println(person.name)

    println(person.age)
    person.age = 58
    println(person.age)
    person.age = 59
    println(person.age)

    CountingDelegate.dumpCounts()
}
