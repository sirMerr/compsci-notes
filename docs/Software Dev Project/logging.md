## What is logging
Logging is the process of recording application actions and state to a secondary interface.

## Structured Approach to Logging
Events or problems of gradually
increasing severity
* WARN, ERROR


General information purposes
* INFO
* Debugging
* DEBUG, TRACE

## What do you need to log?
Most common are:
* Java.util.logging
* Log4j2 (most used in 2017)
* Logback

## Using a logging façade
* Different projects may use different
frameworks
* Rather than become an expert in each
one you use a façade
* Façade provides a new interface to an
existing class

## Simple Logging Façade for Java (SLF4J)
* Searches for a framework in class/build
path
    * If more than one is found it throws an
exception
    * If none is found it uses a no-op
implementation
        * Program runs but logging does nothing

## How to Use it
Add the proper dependencies to the Maven pom file.

```xml
<!-- The dependency for the SLF4J Facade -->
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>1.7.25</version>
</dependency>

<!-- Binding for Log4J -->
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-slf4j-impl</artifactId>
    <version>2.8.2</version>
</dependency>
<!-- Logging Framework Dependency Uses the log4j2 library -->
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>2.8.2</version>
</dependency>

<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>2.8.2</version>
</dependency>
```

In each class:

1. Add two imports:
```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
```
2. Declare a Logger class variable:
```java
private final Logger log = LoggerFactory.getLogger(this.getClass().getName());
```

Log message may include a `String` or a `String` and an `Object`.

`log.info(“program starts”);`

or

```java
} catch (SQLException sqlex) {
    log.error(“Connect failed”, sqlex);
}
```

Logging configuration file is required
otherwise there is no logging

* Format is framework dependent
* File goes into `src/main/resources`
* See the sample code for an example

## Bibliography
* Sample code: https://gitlab.com/omniprof/LoggingDemo.git
* http://www.codeproject.com/Articles/42354/The-Art-of-Logging
* http://zeroturnaround.com/rebellabs/the-state-of-logging-in-java-2013/
* http://www.slf4j.org/
* http://www.slf4j.org/manual.html
* http://log4jtester.com/
* http://logging.apache.org/log4j/2.x/manual/layouts.html#PatternLayout