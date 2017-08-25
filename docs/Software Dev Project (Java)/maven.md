# Maven <small>Week 1 [August 25]</small>

## ❔Wat ist dis
A software project management and comprehension tool.
Maven is a standalone java application.
### Maven Build System
* Ensures that the right library jars are in the build path of a project
* Manages compiling/building
* Executes unit tests
* Projects can be used in different IDEs 

## Standard Project Directory Layout
```
-src
  -main
    -java
    -resources
    -webapp
  -test
    -java
    -resources
-target
```

* `src`
    * contains all of the source material for building the project
* `src/main/java`
    * Java source files (packages are here)
* `src/main/resources`
    * Non code resources such as CSS, images, etc.
* `src/test/java`
    * Java source code for tests
* `src/test/resources`
    * Non code resources used only for tests
* `src/main/webapp`
    * Root folder of a web application, home to HTML, JSF, etc. 
    * Will be used next semester
* `target`
    * used to house all output of the build

For more information on the standard directory structure see https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html

## Maven POM - Project Object Model
Maven uses a file called `pom`, create a local repository and puts it in. It's in your build path so now when you go to compile your code all the libraries are visible. And when you build/package it, it goes into your `.jar`. It then officially becomes a fat `.jar`.

* Describes a project
* Name and Version
* Module Type (`.jar`,`.war`, etc.)
* Source Code Locations (optional)
* Dependencies
* Plugins
* Profiles (Alternate build configurations)
* Written as an XML file

## Build Cycle
Only ==three build lifecycles==

* `clean` –project cleaning
* `default` –building and deploying project
* `site` – generation of project documentation

Lifecycles are broken down into build phases
Phases are made up of goals

### Build Phases for Default Lifecycle
1. `validate`: check `pom.xml`
2. `compile`: compile the source
1. `test`: run unit tests
1. `package`: create `jar/war/...`
1. `verify`: verify the package
1. `install`: publish package to local repo
1. `deploy`: publish package to remote repo

## Extras
### Plugins
* Artifacts/modules that extend what Maven does
* Large library of plugins
* Can write your own
* Bound to different lifecycle phases

### Repositories
* Holds build modules of various types
* Local or remote
* If a module is not found locally then remote is accessed

#### Maven Repos
* Dependencies downloaded from repositories via http
* Usually found in **`${user.home}/.m2/repository`**

Maven Central is primary community repo
http://repo1.maven.org/maven2

The Central Repository can be searched at:
http://search.maven.org/#browse

## Snapshot Builds
* Version of a project not yet been released
* Version number ends with `-SNAPSHOT`
* Define a project Snapshot until ready for  production
* In prod, remove this

## Maven Coordinates
* All projects are uniquely identified by a set of Maven Coordinates
    * Group ID
    * Artifact ID
    * Version
* `group-id:artifact-id:version`
    * `junit:junit:4.11`
    * `org.kuali.rice:core-api:2.2.1`
    * `com.kfcstandard:fxfishtable:1.12`

Example: If your domain is `kitties.com`, your package would be `com.kitties.~`

For this classe's purposes, we will be using something along the lines of `com.firsnamelastname.~`

## Bibliography
* Maven Homepage: http://maven.apache.org
    * Reference Documentation for Maven
    * Reference Documentation for core Plugins
* Description of the pom.xml that must be used in this course
    * https://www.omnijava.com/2017/08/23/the-kfcstandard-pom-xml-file-update/

## Example POM
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <!-- Maven version of the xml document currently only 4.0.0 is valid -->
    <modelVersion>4.0.0</modelVersion>

    <!-- The GAV consists of an arbitrary descriptor that is usually in the
    form of a reverse domain name. -->
    <groupId>com.kfdesktopstandard</groupId>

    <!-- This is the name given to the packaged build -->
    <artifactId>kf_desktop_standard_project</artifactId>

    <!-- The version of the build. Any value is valid though a number and a
    string are common. SNAPSHOT means a project under development. FINAL or no
    text is commonly used to refer to stable production version -->
    <version>1.1-SNAPSHOT</version>

    <!-- Default value is jar but may be war or ear -->
    <packaging>jar</packaging>

    <!-- The name given to the project. Unlike groupId and artifactId a name
    may have spaces. By default it is the following so it is optional -->
    <name>${project.artifactId}</name>

    <!-- A description of the program -->
    <description>Standard starting point for JavaFX programs for students of Ken Fogel
        that displays a table of data using JavaFX and JDBC</description>

    <!-- Identifies the programmer or programmers who worked on the project -->
    <developers>
        <developer>
            <id>Enter your school id</id>
            <name>Enter your name</name>
            <email>Enter your email address</email>
        </developer>
    </developers>

    <!-- The company or organization that the programmer(s) work for -->
    <organization>
        <name>Enter school name</name>
    </organization>

    <!-- Global settings for the project. Settings can be accessed in the pom
    by placing the tag name in ${...} ex. ${mainClass} -->
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>

        <!-- class that has the main method -->
        <mainClass>${project.groupId}.MainApp</mainClass>
    </properties>

    <dependencies>

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

        <!-- JUnit 4 testing dependency -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <!-- only to be used during test, phase will not be included in executable jar -->
            <scope>test</scope>
        </dependency>

        <!-- MySQL dependency -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.43</version>
        </dependency>


    </dependencies>

    <build>
        <!-- Goals may be set in the IDE or the pom IDE or CLI goals override the
        defaultGoal -->
        <defaultGoal>clean compile package exec:exec</defaultGoal>

        <!-- Plugins define components that perform actions -->
        <plugins>
            <!-- Shade: Create an executable jar containing all the dependencies when
            the package goal is carried out -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-shade-plugin</artifactId>
                <version>3.0.0</version>
                <executions>
                    <execution>
                        <goals>
                            <goal>shade</goal>
                        </goals>
                        <configuration>
                            <transformers>
                                <transformer implementation=
                      "org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                                    <mainClass>${mainClass}</mainClass>
                                </transformer>
                            </transformers>
                        </configuration>
                    </execution>
                </executions>
            </plugin>

            <!-- Exec: Executes the program -->
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>exec-maven-plugin</artifactId>
                <version>1.6.0</version>
                <executions>
                    <execution>
                        <id>default-cli</id>
                        <goals>
                            <!-- Runs in separate instance of JVM -->
                            <goal>exec</goal>
                            <!-- Runs in same instance of the JVM as Maven -->
                            <goal>java</goal>
                        </goals>
                        <configuration>
                            <!--used by java goal -->
                            <!--executes in the same VM that Maven runs in -->
                            <mainClass>${mainClass}</mainClass>

                            <!--used by exec goal -->
                            <!--runs in a separate VM from the one that Maven runs in -->
                            <executable>${java.home}/bin/java</executable>
                            <commandlineArgs>-jar ${project.build.directory}/${project.build.finalName}.jar</commandlineArgs>
                        </configuration>

                    </execution>
                </executions>
            </plugin>

            <!-- Executes JUnit tests and writes the results as an xml and
            txt file Test classes must include one of the following in their
            name: Test* *Test *TestCase -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.20</version>
                <configuration>
                    <argLine>-Dfile.encoding=${project.build.sourceEncoding}</argLine>
                    <skipTests>false</skipTests>
                </configuration>
            </plugin>

        </plugins>
    </build>
</project>
```