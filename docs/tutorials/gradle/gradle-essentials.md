---
title: Gradle Essentials
---
# {{ page.title }}

Building a software artifact is a complex process involving various activities such as compiling source code,
running automated tests, packaging distributable files, and so on.
These activities are further split into many steps, often dependent on the execution order, fetching dependent artifacts,
resolving configuration variables, and so on.
Executing all these activities manually is cumbersome and often error-prone.
A good build automation tool helps us reduce the effort and time it takes to build correct artifacts in a repeatable manner.

## Introduction

### Gradle is
- an advanced build automation tool that brings the best from various proven build tools and innovates on top of them.
- used to automate compiling, testing, packaging, and deployment of your software or any other types of projects.
- can be used to produce different kind of artifacts such as web applications, static sites, and desktop applications.
- Works by conventions over configuration.
- can be configured using very human-friendly Groovy DSL.

### Gradle's Main Features
- Declarative builds and convention over configuration
- Support for Ant Tasks and Maven repositories
- Incremental builds, the tasks in a build are only executed if necessary.
- Gradle has great support for multi-project builds.
- The Gradle Wrapper allows us to execute Gradle builds even if Gradle is not installed on a computer.

### Installing Gradle
- Gradle needs Java Runtime Environment (JRE) 6 or Java Development Kit (JDK) 1.6 or higher.
- Download page is https://gradle.org/install/
- Gradle User Manual is https://docs.gradle.org/current/userguide/userguide.html
- Export or add Environment Variables to your OS to run gradle from any command line shell.
- Verifying the installation by `gradle --version` or `gradle -v`
- In case we need to set some global options for the JVM that Gradle will use,
we can set the `GRADLE_OPTS` environment variable with acceptable flags to tune the JVM.
- Gradle also honors the `JAVA_OPTS` environment variable. but his affects the setting for all the Java programs on a machine.

### The Gradle command-line interface
- `gradle` command is issued from the root of a project directory with some tasks to be executed. like `gradle help`
- Gradle tasks may vary depending on the project in which the gradle command is being run.
- Gradle tasks are currently available on project by `gradle tasks` command.

### Gradle build script
- Build scripts are Groovy code.
- Gradle treats the current directory as a project root and tries to find the build.gradle file there.
- Create and open the `build.gradle` file and declare a task by adding the following line `task helloWorld`
- Task helloWorld and run it using command `gradle -q helloWorld`:
```
task helloWorld << {
    println "Hello, World!"
    println ("Hello, World!")
    println ("Hello, World!");
    System.out.println("Hello, World!")
    System.out.println("Hello, World!");
    System.out.println "Hello, World!";
    System.out.println "Hello, World!"
}
```

- To define a simple task that prints out a simple message to the console:

```
// The project object has several properties and methods and it is available in our build scripts
// Assign value to description property.
project.description = 'Simple project' // or
project.setDescription('Simple project')
// DSL to create a new task using
// Groovy << operator.
task simple << {
    println 'Running simple task for project ' +
      project.description
}
// Or Use create method to add new task instead of Groovy << operator
project.getTasks().create('simple') {
    println 'Running simple task for project ' + project.description
}
```

- Defining tasks

```
task first {
    doFirst {
        println 'Running first'
    }
}
task second {
    doLast { Task task ->
        println "Running ${task.name}"
    }
}
// OR
task second {
    doLast {
        // Using implicit 'it' closure parameter.
        // The type of 'it' is a Gradle task.
        println "Running ${it.name}"
    }
}
// Or
task second {
    doLast { Task task ->
        // Using explicit name 'task' as closure parameter.
        // We also defined the type of the parameter.
        // This can help the IDE to add code completion.
        println "Running ${task.name}"
    }
}
// Here we use the << operator
// as synonym for the doLast method.
task third << { taskObject ->
    println 'Running ' + taskObject.name
}
```

- Defining actions with the Action interface
Gradle often has more than one way of defining something, Besides using closures to add actions to a task,
we can also follows a more verbose way of passing an implementation class of the `org.gradle.api.Action` interface.
The Action interface has one method: execute. This method is invoked when the task is executed.
The following piece of code shows a re-implementation of the first task in our build script:

```
task first {
    doFirst(
        new Action() {
          void execute(O task) {
            println "Running ${task.name}"
          }
       }
    )
}
```

- While calling a gradle task from a command line, we can save a few keystrokes by typing only
the characters that are enough to uniquely identify the task name. For example,
the task helloWorld can be called using gradle hW. We can also use helloW, hWorld, or even heWo
- Gradle Daemon is a process that keeps running in the background to speed up the builds significantly.
- Defining dependencies between tasks using the `dependsOn` method for a task or `dependsOn` property.
- Organized better and if the code can be reused instead of repeated
```
// We assign the task closure
// to a variable. We can reuse
// the variable name in our task definitions.
def printTaskName = { task ->
    println "Run ${task.name}"
}
// We use the variable with the closure.
task third(dependsOn: 'second') << printTaskName
task second(dependsOn: 'first') << printTaskName
task first << printTaskName
```

- Defining dependencies via closures

```
def printTaskName = { task ->
    println "Run ${task.name}"
}
task second << printTaskName
// We use the dependsOn method
// with a closure.
second.dependsOn {
    // We use the Groovy method findAll
    // that returns all tasks that
    // apply to the condition we define
    // in the closure: the task name
    // starts with the letter 'f'.
    project.tasks.findAll { task ->
        task.name.contains 'f'
    }
}
task first << printTaskName
task beforeSecond << printTaskName
```

- Setting default tasks

```
defaultTasks 'first', 'second'
task first {
    doLast {
        println "I am first"
    }
}
task second {
    doFirst {
        println "I am second"
    }
}
```

- Adding a description to tasks

```
defaultTasks 'second'
// Use description property to set description.
task first(description: 'Base task') << {
    println "I am first"
}
task second(
    dependsOn: first,
    description: 'Secondary task') << {
    println "I am second"
}
```

- Create a new task:

```
// Define name of task
// as a variable.
def simpleTask = 'simple'
// Variable is used for the task name.
task(simpleTask) << { task ->
    println "Running ${task.name}"
}
```

- Create a new task using Groovy GString:

```
// Name of task as variable.
def simpleTask = 'simple'
// Using Groovy GString with
// ${} expression to use variable
// as task name.
task "${simpleTask}" << { task ->
    println "Running ${task.name}"
}
// Or use loops to create multiple tasks.
['Dev', 'Acc', 'Prod'].each { environment ->
    // A new task is created for each element
    // in the list ['Dev', 'Acc', 'Prod'].
    task "deployTo${environment}" << { task ->
        println "Deploying to ${environment}"
    }
}
```

-  Add a new task using the tasks property of a project:

```
def printTaskName = { task ->
    println "Running ${task.name}"
}
// Use tasks project variable to get access
// to the TaskContainer object.
// Then we use the create method of
// TaskContainer to create a new task.
project.tasks.create(name: 'first') << printTaskName
// Let Gradle resolve tasks to project variable.
tasks.create(name: 'second', dependsOn: 'first') << printTaskName
```

- Using task rules

```
task first(description: 'First task')
task second(description: 'Second task')
tasks.addRule(
    "Pattern: desc<TaskName>: " +
    "show description of a task.") { taskName ->
    if (taskName.startsWith('desc')) {
        // Remove 'desc' from the task name.
        def targetTaskName = taskName - 'desc'
      // Uncapitalize the task name.
      def targetTaskNameUncapitalize =
        targetTaskName[0].toLowerCase() +
          targetTaskName[1..-1]
      // Find the task in the project we search
      // the description for.
      def targetTask =
        project.tasks.findByName(
          targetTaskNameUncapitalize)
      if (targetTask) {
          task(taskName) << {
          println "Description of task ${targetTask.name} " +
            " -> ${targetTask.description}"
        }
      }
    }
}
```

- Accessing tasks as project properties

```
// Create a simple task.
task simple << { task ->
    println "Running ${task.name}"
}
// The simple task is available as
// project property.
simple.description = 'Print task name'
// We can invoke methods from the
// Task object.
simple.doLast {
    println "Done"
}
// We can also reference the task
// via the project property
// explicitly.
project.simple.doFirst {
    println "Start"
}
```

- Adding additional properties to tasks

```
// Create simple task.
task simple << {
    println "Hello ${message}"
}
// We set the value for
// the non-existing message
// property with the task extension
// support.
simple.ext.message = 'world'
```

- A common mistake when creating a task and adding actions for this task is that we forget the left-shift operator `<<`.
 instead of adding actions, we have configured our task. The closure we use is then interpreted as a configuration closure.
All methods and properties in the closure are applied to the task.
- We can add actions for our tasks in the configuration closure, but we must use the `doFirst` and `doLast` methods.
We cannot use the left-shift operator `<<`.

```
def printTaskName = { task ->
    println "Running ${task.name}"
}
task 'one' {
    // Invoke doFirst method to add action.
    doFirst printTaskName
}
// Assign action through left-shift operator (<<).
task 'two' << printTaskName
task 'three' {
    // This line will be displayed during configuration
    // and not when we execute the task,
    // because we use the configuration closure
    // and forgot the << operator.
    println "Running three"
}
defaultTasks 'one', 'two'
```

- Every task has an onlyIf method that accepts a closure as an argument. The result of the closure must be true or false.
If the task must be skipped, the result of the closure must be false, otherwise the task is executed.
The task object is passed as a parameter to the closure. Gradle evaluates the closure just before the task is executed.

```
import static java.util.Calendar.*
task longrunning {
    // Only run this task if the
    // closure returns true.
    onlyIf { task ->
        def now = Calendar.instance
        def weekDay = now[DAY_OF_WEEK]
        def weekDayInWeekend = weekDay in [SATURDAY, SUNDAY]
        return weekDayInWeekend
    }
    // Add an action.
    doLast {
        println "Do long running stuff"
    }
}
```

- Besides using a closure to define the condition that determines whether the task needs to be executed or not,
we can use an implementation of the org.gradle.api.specs.Spec interface.

```
// Create a new File object.
def file = new File('data.sample')
task handleFile {
    // Use Spec implementation to write
    // a conditon for the onlyIf method.
    onlyIf(new Spec() {
        boolean isSatisfiedBy(task) {
            file.exists()
        }
    })
    doLast {
        println "Work with file ${file.name}"
    }
}
```

- Skipping tasks by throwing StopExecutionException

```
// Define closure with the task actions.
def printTaskName = { task ->
    println "Running ${task.name}"
}
// Create first task.
task first << printTaskName
// Use doFirst method with closure
// that throws exception when task
// is executed during work hours.
first.doFirst {
    def today = Calendar.instance
    def workingHours = today[Calendar.HOUR_OF_DAY] in 8..17
    if (workingHours) {
        throw new StopExecutionException()
    }
}
// Create second task that depends on first task.
task second(dependsOn: 'first') << printTaskName
```

- Enabling and disabling tasks
Every task has an enabled property.

```
task listDirectory {
    def dir = new File('assemble')
    // Set value for enabled task property.
    enabled = dir.exists()
    // This is only executed if enabled is true.
    doLast {
        println "List directory contents: " +
                dir.listFiles().join(',')
    }
}
```

- Skipping from the command line
we have defined the rules to skip a task in the build file. However, we can use the --exclude-tasks (-x)
command-line option if we run the build. for example : `gradle third -x second`

- We want the task to be executed only if the source file has changed, or the output file is missing,
or has changed since the last run of the task.

```
task convert {
    def source = new File('source.xml')
    def output = new File('output.txt')
    doLast {
      def xml = new XmlSlurper().parse(source)
      output.withPrintWriter { writer ->
          xml.person.each { person ->
            writer.println "${person.name},${person.email}"
        }
      }
      println "Converted ${source.name} to ${output.name}"
    }
}
// change the definition of our task so that Gradle can determine whether the task needs to be executed based on
// changes in the input file or output file of the task.
// A task has the properties inputs and outputs that are used for this purpose.
// rewrite our task to make it support Gradle's incremental build feature
// We can use the --rerun-tasks command-line option to ignore the incremental build feature.
task convert {
    def source = new File('source.xml')
    def output = new File('output.txt')
    // Define input file
    inputs.file source
    // Define output file
    outputs.file output
    doLast {
      def xml = new XmlSlurper().parse(source)
      output.withPrintWriter { writer ->
        xml.person.each { person ->
          writer.println "${person.name},${person.email}"
        }
      }
      println "Converted ${source.name} to ${output.name}"
    }
}
// If these methods are not appropriate for our build, we can even use the upToDateWhen method for the outputs property.
// We pass a closure or implementation of the org.gradle.api.specs.Spec interface to define a predicate that determines
// whether the output of the task is up to date.
project.version = '1.0'
task createVersionDir {
    def outputDir = new File('output')
    // If project.version changes then the
    // task is no longer up-to-date
    inputs.property 'version', project.version
    outputs.dir outputDir
    doLast {
        println "Making directory ${outputDir.name}"
        mkdir outputDir
    }
}
task convertFiles {
    // Define multiple files to be checked as inputs.
    // Or use inputs.dir 'input' to check a complete directory.
    inputs.files 'input/input1.xml', 'input/input2.xml'
    // Use upToDateWhen method to define predicate.
    outputs.upToDateWhen {
        // If output directory contains any file which name
        // starts with output and has the xml extension,
        // then the task is up-to-date.
        // We use the Groovy method any to check
        // if at least one file applies to the condition.
        // The ==~ syntax is a Groovy shortcut to
        // check if a regular expression is true.
        new File('output')
            .listFiles()
            any { it.name ==~ /output.*\.xml$/ }
    }
    doLast {
        println "Running convertFiles"
    }
}
```


### Gradle Wrapper
- A Gradle Wrapper consists of a `gradlew` shell script for Linux/Mac OS X,
a `gradlew.bat` batch script for Windows, and a few helper files.
- These files can be generated by running a `gradle wrapper` task
and should be checked into the version control system (VCS) along with project sources.
Instead of using the system-wide gradle command, we can run the builds via the wrapper script.
- the advantages of running builds via a wrapper script are
    - We don’t need to download and install Gradle manually. The wrapper script takes care of this.
    - It uses a specific version of Gradle that the project needs.
- To generate the wrapper scripts and supporting files, just execute the following code from the command line:
`gradle wrapper` or `gradle wrapper --gradle-version 5.0`
- To running a build via wrapper use it like any other command `gradlew helloWorld`
and we can use the arguments and flags exactly in the same way as we pass to the gradle command.

### Default Gradle tasks
- The gradle command is used to execute a build. This command accepts several command-line options: `gradle --help`.
- to show the available Gradle tasks for our project, type `gradle -q tasks`.
- The properties task is very useful to see the properties available for our project: `gradle -q properties`.
- The dependencies task will show dependencies (if any) for our project: `gradle -q dependencies`.
- The projects tasks will display subprojects (if any) for a root project: `gradle -q projects`.
- The model tasks displays information about the model that Gradle builds internally from our project build file: `gradle -q model`.
- Changing the build file and directory:
`gradle --project-dir [project-root-dir] --build-file [build-file] -q [task-name]`.
- Gradle provides the `--profile` command-line option to record the time that certain tasks take to complete.
The data is saved in an HTML file in the `build/reports/profile` directory.
- You can use the `--offline` command-line option to instruct Gradle to not access any network during the build.
- To start the Gradle GUI, we invoke the following command: `gradle --gui`.
- To execute multiple tasks, add each task name to the command line.
Gradle executes the tasks in the same order as they are defined in the command line.
and Gradle will only execute a task once during the build.

## Building Java Projects
- In the root of the project directory create the `build.gradle` file and add the following code line to it:

```java
apply plugin: 'java'
```

- Adding source files in the same structure for any standard maven project in `src/main/java` directory.
- To compile the project and produce the class files call the following task from a command line: `gradle compileJava`
and the compiled classes go into `build/classes/main` relative to the project root.
- To generate the `.jar` file for our application run the following task: `gradle build`
and the jar will be in the `build/libs` directory.
- Note that when we run the `build` task, Gradle also invokes the `compileJava` and other dependent tasks
before actually executing the build task. So, we don't need to explicitly call `compileJava` here to compile classes.
- The name of the .jar file is the same as that of the project.
This can be configured by setting the `archivesBaseName` property in the build.gradle file. as

```java
archivesBaseName = "my-app"
```

- To see what all tasks were brought into our build by the java plugin run `gradle –q tasks` command.
- Gradle by itself is nothing more than a task runner. It does not know how to compile a Java file
or where to read the source files. It means that these tasks are not there by default.
and a Gradle build file, without any plugin applied, contained very few tasks.
- A plugin adds relevant tasks and conventions to a Gradle build.
all the tasks such as compileJava, build, clean, and many more are essentially brought in by the java plugin
that we applied to our build.
- There are number of plugins that come out of the box with Gradle. The `java` plugin is one such plugin.

### Unit testing
- Java test sources are kept in the `src/test/java` directory relative to the project root.
- To compile tests use the `compileTestJava` task, which is exactly the same as `compileJava`, but compiles the test source files.

#### Adding the JUnit to the classpath
- we need JUnit library on the classpath. And this dependency is only required
while compiling and running the tests.
- In the dependencies section, we list down all the dependencies of the project along with their scope.
We declared JUnit to be made available in the testCompile scope.
- In the repositories section, we configure the type and location of the repository where external dependencies will be found.
- We need to update the build.gradle file as follows:

```java
apply plugin: 'java'

repositories {
    mavenCentral()
}

dependencies {
    testCompile 'junit:junit:4.12'
}
```

- Running the test by command `gradle test`
- Whether the test passes or not, a nice HTML report is created with details of all the tests that are run.
By default, this report is located at build/reports/tests/index.html relative to the project root.
- We just need to call the last task in the flow, and all the tasks that the called tasks depend on will be called sequentially
and the build will not succeed if any of the tasks fails.
- If we need to force run task actions even if nothing has changed between the two runs,
we can pass the `--rerun-tasks` flag on the command line so that all task actions can run.

### Bundling an application distributable
- applies the `application` plugin to our build by `apply plugin: 'application'`
- Add `mainClassName` and `run.args` attributes.
- The `application` plugin adds the `run` task to our build.
- as we are applying the application plugin, it is not necessary to explicitly apply the java plugin
as an application plugin implicitly applies the java plugin to our build.
- It also implicitly applies the distribution plugin so that we get the tasks to package the application
as a ZIP or TAR archive and also gets the task to install the application distribution locally.
- More information on the application plugin can be found at https://docs.gradle.org/current/userguide/distribution_plugin.html.
- Running the application with Gradle by `gradle run` or `gradle -q run`.
- The –P adds properties to the Gradle Project. like `gradle -q run -PrunArgs=world` and access it by `project.runArgs`.
- We could create a gradle.properties in project’s root parallel to the build.gradle file.
- There are ways to declare properties which can be found at https://docs.gradle.org/current/userguide/build_environment.html.

#### Building the distribution archive

- Another interesting task is `distZip`, which packages the application along with OS-specific start scripts: `gradle distZip`.
- It would have generated the application distribution in ZIP format in the build/distributions relative to the project root.
- The name of the ZIP defaults to the project name. unless change by using the following property in build.gradle: `distributions.main.baseName = 'someName'`
- unzip the archive to see its contents and folders structure.

### Generating IDE project files
- Gradle sports very nice plugins that can generate IDE-specific project files.
Both IntelliJ IDEA and Eclipse are covered by their respective plugins.
Depending on which IDE you want to support, you will either include `apply plugin: 'idea'` or `apply plugin: 'eclipse'`.
- execute the following for Eclipse and IntelliJ IDEA, respectively:

```
$ gradle eclipse
$ gradle idea
```

- Make sure you ignore IDE-specific files in version control. For example, if you are using Git,
consider adding the following entries in your .gitignore file to prevent someone from accidentally committing
the IDE-specific files:

```
.idea/
*.iml
*.ipr
*.iws
.classpath
.project
.settings/
```

## Building a Web Application

- To create the `build.gradle` file for Building a Web Application in the root of the project:

```java
apply plugin: 'war'

repositories {
    mavenCentral()
}

dependencies {
    providedCompile 'javax.servlet:javax.servlet-api:3.1.0'
}
```

- The war plugin extends the java plugin; so all the tasks that were available when we applied the java plugin are still available
to us in addition to the war task.
- the `providedCompile` configuration (scope) tells Gradle not to package the servlet API with the application,
as it will already be available on the container where the application will be deployed.
The `providedCompile` configuration is added by the `war` plugin (it also adds `providedRuntime`).
- To build the deployable WAR file. use command `gradle war`.
- To verify the tasks available for our build use command `gradle tasks --all`.
- The war file is created at `/build/libs/hello-web.war`.
- To list the contents of WAR, use `jar -tf build/libs/hello-web.war` or use any the standard zip/unzip tools.
- When we say build automation, it implicitly means that no manual intervention should be expected
and things should work in one click (or one command in Gradle's case).
- Gradle plugins like a `Gretty` plugin can be found at a Gradle plugin portal,
This plugin adds numerous tasks to the build and supports various versions of Tomcat and Jetty.
- To configure it use:

```
plugins {
    id "org.akhikhl.gretty" version "2.0.0"
}
```

- We can include the `war` plugin's application inside this block. For internal plugins,
we don't need to specify a version. It will look as follows:

```
plugins {
    id "org.akhikhl.gretty" version "1.2.4"
    id "war"
}
```

- If we run gradle tasks now, we must have an appRun task under the Gretty group.
There are many more tasks in this group, which are added by the Gretty plugin.
- There are many configurations exposed by the plugin, in order to control aspects such as server version, port number,
and many more. Add a gretty block to the build.gradle files as follows:

```
gretty {
    servletContainer = 'tomcat8'
    port = 8080
}
```

or

```
gretty {
    servletContainer = 'jetty9'
    port = 9080
}
```

- Important Reference Links:
    - Gradle plugin portal: https://plugins.gradle.org/
    - Tomcat plugin: https://github.com/bmuschko/gradle-tomcat-plugin

### Project dependencies
- Gradle locates and makes dependencies available in the appropriate classpath and packaging if required.

#### External libraries
- The dependencies of a project are declared in the `dependencies` section in the build file.
- the coordinates of an Gradle dependency artifact takes a form of group:name:version. like:

```
dependencies {
    compile 'org.springframework:spring-core:4.0.6.RELEASE'
    compile group:'org.springframework', name:'spring-core', version:'4.0.6.RELEASE'
}
```

- We can also specify multiple dependencies as follows: `configurationName dep1, dep2, dep3,...`
- We run the following code in our build.gradle file: `runtime 'org.slf4j:slf4j-nop:1.7+'` to indicate a dynamic version of the library.
- run the dependencies task by : `gradle dependencies`
- Gradle resolves transitive dependencies quite well.
- To disable Gradle transitive dependencies provide an extra block to dependency declaration:

```
runtime ('org.slf4j:slf4j-nop:1.7+') {
    transitive = false
}
```

-  To force a given version of the library use:

```
runtime ('org.slf4j:slf4j-nop:1.7.2') {
    force = true
}
```

#### Dependency configurations
- The following are configurations that are added by the java plugins: `compile, runtime, testCompile, testRuntime`.
- The following are configurations that are added by the war plugins: `providedCompile, providedRuntime`.
- More configurations can be added by plugins, or we can declare them ourselves in our build script.

#### Repositories
- The repositories section configures the repositories where Gradle will look for dependencies.
- Repositories such as Maven, Ivy, and flat directory (filesystem) are supported for dependency resolution and uploading artifacts.
-  Maven repos can be easily configured using the following syntax:

```
repositories {
    mavenCentral()  // shortcut to maven central
    mavenLocal()    // shortcut to maven local (typically ~/.m2)
    jcenter()       // shortcut to jcenter
    maven {
        url "http://repo.company.com/maven"
    }
    ivy {
        url "http://repo.company.com/ivy"
    }
    flatDir { // jars kept on local file system
        dirs 'libDir'
    }
}
```

## Gradle Build Scripts
- the Gradle build script is written in Groovy language.
- The two important objects available in our build, namely, the project object and the task object(s).
- Build phases and life cycle callbacks
- Some details of the tasks

### Groovy for Gradle build scripts
- To write effective Gradle build scripts, we need to understand some basics of Groovy, which is a dynamic language.
- Groovy's syntax is concise, expressive, and powerful.
- In a Groovy script, the def keyword can define a variable (depending on the context): `def a = 10`
and the type of a is decided at the runtime depending on what type of object it points to. or `Integer b = 10`
- We can also use Java primitive data types. but keep in mind that they are not actually primitives in Groovy.
They are still first-class objects and are actually Java wrapper classes for corresponding data type. for example:

```
int c = 10
println c.getClass() // print => class java.lang.Integer
```

- String literals are using ''.
- Regular Java string literals ("") can also be used, but they are called GStrings in Groovy,
Both ${var} and $var are valid:

```
def name = "Gradle"
println "$name is an awesome build tool"
def number = 4
println "number is even ? ${number % 2 == 0 }"
```

- Groovy supports multiline string literals:

```
def multilineString = '''\
    Hello
    World
'''
println multilineString
```

- "slashy" string literal, which starts and ends with a single forward slash (/):

```
def r = /(\d)+/
println r.class
```

- Groovy supports a pattern operator (~), which when applied to a string, gives a pattern object:

```
def pattern = ~/(\d)+/
println pattern.class // print > class java.util.regex.Pattern
// or
if ("groovy" ==~ /gr(.*)/)
  println "regex support rocks"
```

- Closure in Groovy is a block of code that can be assigned to a reference or passed around just like any other variable.
- examples:

```
def cl1 = {
    println "hello world!"
}
cl1.call()
def cl2 = { n ->
    println "value of param : $n"
}
cl2.call(101)
3.times(cl2)
3.times { println it * it }
```

- Groovy supports literal declaration of the often-used data structures, which makes the code a lot more terse without sacrificing readability.
- Examples:

```
def aList = [] // In Groovy, [] is actually a Java's List instance and not an array.
println aList.getClass()
def anotherList = ['a','b','c']
def list = [10, 20, 30] + [40, 50]
list  <<  60
list = list – [20, 30, 40]
list  -= [20,30,40]
list.each {println it}
def aSet = [1,2,3] as Set
println aSet.class // print > class java.util.LinkedHashSet
TreeSet anotherSet = [1,2,3]
println anotherSet.class
// Adding elements to a set is just like a list using an indirection operator
aSet << 4
aSet << 3
println aSet // [1, 2, 3, 4]
// Map can be declared using the map literal [:]:
def a = [:]
def tool = [version:'2.8', name:'Gradle', platform:'all']
println tool.name
println tool["version"]
println tool.get("platform")
tool.version = "2.9"
tool["releaseDate"] = "2015-11-17"
tool.put("platform", "ALL")
```

- methods:

```
int sum(int a, int b) {
  return a + b;
}
def sum(a, b) {
  a + b // we omitted the return statement as the evaluation of the last expression is automatically returned by a method.
}
```

- A method call in Groovy can omit the parenthesis is many cases:

```
sum(1,2)
sum 1, 2
```

- Default values of parameters:

```
def divide(number, by=2) {
    number/by
}
println divide (10, 5)
println divide (10)
// Methods with map parameters/named parameters
def method(Map options) {
    def a = options.a ?: 10
    def b = options.b ?: 20 // options.a ? options.a : 10
}
method([a:10,b:20])
// We can omit the square brackets ([]) because maps have special support in the method call
method(a:10, b:20)
// The order of parameters is not important and all the parameters need not be passed.
// Also, the parenthesis wrapping is optional, just like any method call:
method b:30, a:40
method b:30
// varags are denoted by ..., but providing the type is optional:
def sumSquares(...numbers) {
    numbers.collect{ it * it }.sum()
}
sumSquares 1, 2, 3
// Closures are important and, hence, Groovy has a special syntax for closures
// if the closure is the last parameter of a method signature:
// the third call is the special syntactical support in which the parenthesis just wraps the other parameters,
// while the closure is written outside the parenthesis, as if it were a method body.
def myMethod (param, cls) {
    ...
}
myMethod(1,{ ... })
myMethod 2, {... }
myMethod(3) {...}
```

- Classes are public by default. They can inherit from other classes using extends or implementing interfaces using implmenets.
Instead of using the def for properties, we can use more specific types.
- Examples:

```
class Person {
  def name, age
}
// In addition to the default constructor, classes in Groovy get a special constructor,
// which takes the map of properties of the class. Here is how we use it:
def person = new Person(name:"John Doe", age:35)
println person.age
person.age = 36
println person.age
// We can provide our own getters and/or setter for the desired fields,
// which will take precedence over the generated one
void setAge(age){
    if (age < 0)
        throw new IllegalArgumentException("age must be a positive number")
    else
        this.age = age
}
// We can add an instance and static methods to classes just like we do in Java:
def speak(){
  println "${this.name} speaking"
}
static def now(){
  new Date().format("yyyy-MM-dd HH:mm:ss")
}
```

- in Gradle build script:

```
apply plugin: 'java' // apply is a method.
apply(plugin: 'java')
apply([plugin: 'java'])
// the apply method is implicitly applied on the project object.
// So, we can also call it on the project object's reference:
project.apply([plugin: 'java'])
```

### Gradle – an object-oriented build tool
- Gradle creates objects of both project and task types. These objects are accessible in our build script for us to customize.
- A project object is a central piece of API that is exposed to and configured via the build scripts.
A project object is available in the script such that the methods without object reference
are intelligently invoked on the project object.
- The task objects are created for each task declared directly in the build file and also for plugins.
- some tasks are already available in our build without us having to add a single line to our build file
(such as the help task and the tasks task, and so on).

### Build phases
- A Gradle build follows a very simple life cycle on every invocation.
The build passes through three stages: initialization, configuration, and execution.
- Gradle first figures out whether the current project has child projects or if it is the only project in the build.
For multi-modules build, Gradle figures out which modules have to be included in the build.
- Gradle then creates a Project instance for the root project and for each of the child projects of a project.
- In Configuration phase, the build scripts of participating projects are evaluated against the corresponding project object
that was created during the initialization phase.
- When a script is evaluated, all the statements in the script are executed sequentially.
- Tasks are only configured during the Configuration phase. No matter what tasks are going to be called, all tasks will be configured.
- In the Execution phase, Gradle figures out which tasks need to be run based on the parameters such as task names
passed as command line arguments and the current directory.
- Gradle intelligently determines which tasks need to actually run and which can be skipped.
- Gradle provides various hooks for executing code at various points during life cycle events.
We can implement callback interfaces or provide callback closure to DSL in the build script.

### Gradle Project API
- Gradle creates a project object for each build.gradle for us during the initialization phase.
This object is available in our build scripts using the project reference.
- all the top-level method calls in the build scripts are called on a project object if no explicit reference is provided.
- Examples:

```
project.apply plugin: 'java'
project.repositories {
    mavenCentral()
}
project.dependencies {
    testCompile 'junit:junit:4.11'
}
// or
project.repositories({...})
project.dependencies({...})
// Project Properties:
description = "a sample project"
version = "1.0"
task printProperties << {
    println project.version
    println project.property("description")
}
```

- Gradle makes it very easy to store user-defined properties on a project,
while still being able to enjoy the niceties of project properties' syntax.

```
ext.abc = "123"
task printExtraProperties << {
    println project.abc
    println project.property("abc")
    println project.ext.abc
}
```

### Tasks
- a task is a named action that performs some build logic. It's a unit of build work. For example, clean, compile, dist.

```
project.task "myTask"
project.task("myTask")
```

- The project object has several flavors of a task method to create a task object:

```
Task task(String name)
Task task(String name, Closure configureClosure)
Task task(Map<String, ?> args, String name)
Task task(Map<String, ?> args, String name, Closure configureClosure)
```

- A Task object has a method called doLast, which accepts a closure.
Gradle ensures that all the closures passed to this methods are executed
in the order they were passed:

```
someTask.doLast({
    println "this should be printed when the task is run"
})
someTask {
    doLast {
        println "third line that should be printed"
    }
}
someTask << {
    println "the action of someTask"
}
```

- Tasks within a project may have a dependency on each other.
- There are tasks whose execution is dependent on the other task's successful completion. For example

```
// $ gradle compile dist
task compile << {
    println 'compling the source'
}
task dist(dependsOn: compile) << {
    println "preparing a jar dist"
}
```

- We can also declare that, if a task is called, it should be followed by another task,
even if another task is not explicitly called.

```
task distUsingTemp << {
  println ("preapring dist using a temp dir")
}
task cleanup << {
  println("removing tmp dir")
}
distUsingTemp.finalizedBy cleanup
```

- We can specify a condition and if it is satisfied, the task will be executed:

```
cleanup.onlyIf { file("/tmp").exists()}
```

- mustRunAfter and shouldRunAfter

```
build.mustRunAfter clean
build.shouldRunAfter clean
```

- Creating tasks dynamically

```
10.times { number ->
  task "dynamicTask$number" << {
    println "this is dynamic task number # $number "
  }
}
```

- Setting default tasks `defaultTasks "myTaskName", "myOtherTask"`
- Custom task types act as a template with some sensible defaults for a common build logic.
We still need to declare a task in our build, but we just tell Gradle the type of this task
and configure the settings of this task type, instead of writing the entire task action block again.
Gradle already ships with many custom task types; for example, Copy, Exec, Delete, Jar, Sync, Test, JavaCompile, Zip
- We can configure a task that is of type Copy using the following syntax:
- The closure that we are passing to this task actually gets executed in the configuration phase of build.

```
task copyDocumentation(type:Copy) {
from file("src/docs/html")
into file("$buildDir/docs")
}
```

- Creating task types

```
class Print extends DefaultTask {
  @Input
  String message = "Welcome to Gradle"
  @TaskAction
  def print() {
    println "$message"
  }
}
task welcome(type: Print)
task thanks(type: Print) {
  message = "Thanks for trying custom tasks"
}
task bye(type: Print)
bye.message = "See you again"
thanks.dependsOn welcome
thanks.finalizedBy bye
```

- References
    - https://docs.gradle.org/current/dsl/org.gradle.api.Project.html
    - https://docs.gradle.org/current/dsl/org.gradle.api.invocation.Gradle.html
    - https://docs.gradle.org/current/dsl/org.gradle.api.Task.html

## Multiprojects Build
- The arrangement of subprojects relative to the root project may be flat,
that is, all the subprojects are the direct children of the root project
or are hierarchical, such that the subproject may also have nested child projects
or any hybrid directory structure.

### The settings.gradle file
- During initialization, Gradle reads the settings.gradle file to figure out
which projects are to take part in a build. Gradle creates an object of type Setting.
- The most common use of settings.gradle is to enlist all the subprojects participating in the build:
`include ':repository', ':services', ':web-app'`
- The colon denotes the project path relative to the root project.
However, the include method allows level 1 subproject names to omit the colon.
So, the include call can be rewritten as follows: `include 'repository', 'services', 'web-app'`
- The projects task lists all the projects available in a Gradle build: `gradle projects`
- We can find more information on Settings at the Settings DSL documentation https://docs.gradle.org/current/dsl/org.gradle.api.initialization.Settings.html
- For a multiproject build, we can call tasks on any nested project using the gradle <project-path>:<task-name> syntax
or by going into the subproject directory and executing gradle <task-name>.

### Organizing build logic in multiproject builds
- Gradle gives us the flexibility to create one build file for all projects or individual build file per project; you can also mix and match.
- Gradle DSL provides a first-class support for declaring common build elements across all projects.
- The allprojects method takes a closure and executes it on the project (object) of the build file and all the subprojects of the current project.
- We can even apply plugins, declare repositories and dependencies, and so on. So, in essence, we can write any build logic
that is common to all projects and then it will be applied to all projects.

```
allprojects {
    task whoami << {println "I am ${project.name}"}
}
// or
allprojects {
  task("describe${project.name.capitalize()}") << {
    println project.name
  }
}
```

### Applying build logic to subprojects
-  the subprojects method applies some build logic only on subprojects without affecting the parent project.
-

```
subprojects {
  apply plugin: 'java'
}
```

- Check the output of `gradle -q tasks --all` in this case.
- The tasks added by the `java` plugin will only be available on subprojects, whereas tasks such
as help tasks will be available on all projects.

### Dependency on subprojects
- Add dependency declaration in the root project's build.gradle.

```
project(':services') {
  dependencies {
    compile project(':repository')
  }
}
```

- Add dependency declaration in the child project's build.gradle.

```
dependencies {
  compile project(':services')
}
```

## Gradle Scripts Examples

### Free Gradle script to compile and build a Java project:

The gradle plugin provides the flexibility to configure the plugin based on the project's need as the following
code snippt shows:

```
apply plugin:'java'
task cleanDir << {
    delete "build"
    delete "dist"
}
task createDirs(dependsOn:'cleanDir') << {
    def classes = file("build/classes")
    def dist = file("dist")
    classes.mkdirs()
    dist.mkdirs()
}
compileJava {
    File classesDir = file("build/classes")
    FileTree srcDir = fileTree(dir: "src")
    source srcDir
    destinationDir classesDir
}
task createJar(type: Jar) {
    destinationDir = file("dist")
    baseName = "JavaProject-1.0"
    from "build/classes"
}
createJar.dependsOn compileJava
compileJava.dependsOn createDirs
```

### Migrating from a Maven to Gradle project

- A user needs to rewrite the Maven script to the Gradle script. The following are some of the concepts
that will help you to smoothly migrate from Maven to Gradle:
    - Plugin declaration
    To include a plugin, the user only needs to write the `apply plugin` statement like: `apply plugin: '<plugin name>'`
    - Common conventions
    If a user includes a plugin and follows the same convention, then he can avoid writing any boiler-plate code
    that could save both his time and effort.
    If a user includes a java plugin, the common convention is that the source code location should be `src/main/java`,
    test code location should be `src/test/java`
    - Dependency management. To define the dependency in Gradle, a user has to use the following syntax:

```
dependencies{
    compile(' org.apache.logging.log4j: log4j-core:1.2')
}
```
    - Repositories configuration. This is the location from where you download dependencies.
    In Gradle, you can mention the repository using the following syntax:
```
repositories {
    maven {
        url "http://companylocalrepository.org"
    }
}
```

### Publishing artifacts
- You can execute the `gradle –b build.gradle uploadArchives` command to upload the artifacts.
As a part of life cycle, it will build and upload the artifacts.
- Gradle gives you the flexibility to upload the file to a local file system using `flatDir`.
- Gradle has a `maven-publish` plugin to have more control over the publishing process.
It gives you many additional flexibilities along with the default publish tasks.
A user can modify the POM file, publish multiple modules, and so on.
You can find more details at https://docs.gradle.org/current/userguide/publishing_maven.html.
- The following is the sample example of the build file to upload a JAR file generated by a `java plugin`:
```
apply plugin: 'java'
version=1.0
repositories {
  mavenCentral()
}
dependencies {
  compile ('log4j:log4j:1.2.16')
}
uploadArchives {
  repositories {
    maven {
      credentials {
        username "user1"
        password "user1"
      }
      url "http://company.private.repo"
    }
  }
}
```

### Continuous Integration
- If there are compile issues and integration issues, a user can figure out at early stages, rather than it being too late.
- To plan the build and deployment automation solution for any software, we need a different set of tools to work
together to achieve the common goal. Jenkins is one of the integration tools that helps to integrate the complete workflow.
It also works on the concept of plugins; you can add different plugins to Jenkins (for example, Gradle, Git, and so on)
as per your need and configure them to plan the automation flow.

### Generating documentation
- When you apply `Java plugin` to your build file, Gradle provides you a `javadoc` task.
- By default, Gradle generates the initial documentation for your code, even if the user does not mention any Javadoc in the file.
- Run : `gradle clean javadoc`. It will generate the basic Java docs at `{project_root}\build\docs\javadoc`.

## Testing and Reporting with Gradle

- Four different topics: testing with TestNG, integration testing, code coverage with JaCoCo, and code analysis with Sonar.
- TestNG is another widely used testing tool, like JUnit.
- Code coverage and code quality are the other two important aspects in test-driven development (TDD).
- Developers need continuous feedback on the code developed by them. Code quality tools help us to achieve this goal.
- these tools are integrated with the Continuous Integration (CI) systems so that these reports are created on a daily basis or after each commit,
shared among different teams, and even be persisted for future analysis.

### Testing with TestNG
- The very first step is to create the build file with TestNG dependencies and configure the test closure.
- The following build file adds the TestNG library as the testCompile dependency and in the test closure,
we added a testng.xml file to execute the test cases,
you can read more about TestNG configuration at http://testng.org/doc/documentation-main.html:

```
apply plugin:'java'
repositories {
  mavenCentral()
}
dependencies {
  testCompile 'org.testng:testng:6.8.21'
}
test {
  ignoreFailures = true
  useTestNG(){
    suites("src/test/resources/testng.xml")
  }
}
```

```xml
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd" >
<suite name="Suite1" verbose="1" >
  <listeners>
    <listener class-name="org.testng.reporters.EmailableReporter" />
  </listeners>
  <test name="Smoke Test">
  <groups>
    <run>
      <exclude name="Integration"  />
      <include name="Smoke"  />
    </run>
  </groups>
  <classes>
    <class name="com.packtpub.ge.ch7.HashTest">
    </class>
  </classes>
  </test>
</suite>
```

### Integration testing
- It verifies the communication between different components working together as expected or not.
- To enable integration testing along with unit testing in Gradle, you need to customize the Gradle to enable both.
- Create a separate directory structure, `src/integrationTest/java`, for integration test cases,
and you can configure the same in your Gradle build scripts. The updated build script would be as follows:

```
apply plugin: 'java'
sourceSets {
   integrationTest {
       java.srcDir file('src/integrationTest/java')
       resources.srcDir file('src/integrationTest/resources') // to add the resources
   }
}
task runIntegrationTest(type: Test) {
   testClassesDir = sourceSets.integrationTest.output.classesDir
   classpath = sourceSets.integrationTest.runtimeClasspath
}
```

- Once we have added additional sourceSets to the build script,
the java plugin automatically adds two new dependency configurations to your build script
`integrationTestCompile` and `integrationTestRuntime`.
- `integrationTestCompile` can be used to configure dependencies required to compile the test cases and
`integrationTestRuntime` can be used to configure dependencies required to execute the test cases.
- Execute the following command to check for the current dependencies: `gradle dependencies`
- You can configure them under dependencies closure:

```
dependencies {
    // other configuration dependencies
    integrationTestCompile 'org.hibernate:hibernate:3.2.3.ga'
}
```

- to execute the integration test : `gradle runIntegrationTest`.
- If you want to execute these test cases each time you build your code,
you can link this task with other tasks using dependsOn
or any other dependency attributes.

### Code coverage
- High code coverage does not guarantee that the quality code has been written.
- A developer must use static code analysis tools such as PMD (https://pmd.github.io/) to find the quality of the code.
- The `build.gradle` file has the following content:

```
apply plugin: 'java'
apply plugin: 'jacoco'
repositories {
  mavenCentral()
}
dependencies {
  testCompile 'org.testng:testng:6.8.8'
}
test{
    systemProperty "url",System.properties['url']
    useTestNG()
}
jacocoTestReport.dependsOn test
```

- the report will be created in the `{build dir}/reports/jacoco/test/html` directory and an HTML report file will be generated.
- To execute the `jacocoTestReport` task to generate the code coverage report: `gradle clean jacocoTestReport`.
- In the coverage report, you can observe that all the methods of the Java class were tested unit tests.
- The default version of the jacoco plugin can be modified by modifying the jacoco extension as follows:

```
jacoco {
    toolVersion = "<Required-Version>"
    reportsDir = file("Path_to_Jacoco_ReportDir")
}
```

- The report can be customized by configuring the jacocoTestReport task as follows:

```
jacocoTestReport {
    reports {
        xml.enabled false
        html.destination "<Path_to_dircectory>"
    }
}
```

### Code analysis reports
- Sonar is one of the most popular quality management tools that gives
a complete analysis of a project in terms of lines of code, documentation,
test coverage, issues, and complexities.
- To integrate Gradle with Sonar. The only prerequisite is, the Sonar server should be installed and running.
- To run sonar-runner plugin, we just need to apply the plugin sonar-runner and configure it to connect to the Sonar server.
- Create the build file build.gradle for your project with the following contents:

```
apply plugin: 'java'
apply plugin: "sonar-runner"

repositories {
    mavenCentral()
}

version = '1.0'
repositories {
    mavenCentral()
}

sonarRunner {
  sonarProperties {
    property "sonar.host.url", "http://<IP_ADDRESS>:<PORT>"
    property "sonar.jdbc.url",
    "jdbc:h2:tcp://<IP_ADDRESS>:<PORT>/sonar"
    property "sonar.jdbc.driverClassName", "org.h2.Driver"
    property "sonar.jdbc.username", "sonar"
    property "sonar.jdbc.password", "sonar"
  }
}
```

- To run the `sonarRunner` task for code analysis. After successful execution of this task,
you will find the report hosted on the Sonar server: `gradle clean sonarRunner`
- You can find more on Sonar at http://docs.sonarqube.org/display/SONAR/Documentation/.

## Organizing Build Logic and Plugins

- Developers just include the plugin, configure the required tasks, and leverage the functionalities.

### Extracting build logic to buildSrc
- Plugins are nothing but the group of tasks with specific orders and default configurations, which are created to provide a certain functionality.
- The following is the sample code of a plugin, which a developer can write in build.gradle and use it:

```
apply plugin: CustomPlugin
class CustomPlugin implements Plugin<Project> {
  void apply(Project project) {
    project.task('task1') << {
      println "Sample task1 in custom plugin"
    }
    project.task('task2') << {
      println "Sample task2 in custom plugin"
    }
  }
}
task2.dependsOn task1
```

- All the tasks that you want to implement, you need to define inside the apply method.
- To use a plugin in the build file, you always need to use `apply plugin:<plugin name/plugin class>`
(if a plugin is implemented in the same script or in the buildSrc directory).
- to write plugin code separate from the build logic, Gradle provides two different ways as follows:
    - Extract plugin code to buildSrc
    - Independent plugin
- To extract plugin code to buildSrc, Gradle recommends you to create a buildSrc directory
inside the project directory and keep the plugin code there.
- You just need to import the package and add the apply plugin statement.
- If you want to add some more features for task1, you can do it as follows:

```
task1.doLast {
    println "Added more functionality to task1"
}
task2.dependsOn task1
```

- You can use this plugin only with the same project or the sub-projects defined in the root project.
- You can plug out the plugin code into a standalone plugin and package it into a JAR file,
which you can publish to a repository so that it can be reused by any projects.

### Gradle Plugin
- To make the plugin reusable for all the other projects, Gradle allows you to separate the plugin code and package it in a JAR file.
- You can include this JAR file in any projects in which you want to reuse this functionality.
- You can create the standalone project in Java or Groovy.
- In the build.gradle plugin file, you will package the plugin code into a jar file.
- to include the plugin into other build files. You need a plugin ID for this plugin. To add a plugin ID to your plugin,
you need to create a property file `customplugin.properties` inside the `src/main/resources/META-INF/gradle-plugins` directory.
- To refer to the custom plugin JAR using the flatDir configuration. Use the following in your build.gradle file:

```
buildscript {
    repositories {
        flatDir {dirs "../CustomPlugin/build/libs/"}
    }
    dependencies {
        classpath group: 'ch8', name: 'CustomPlugin',version: '1.0'
    }
}
apply plugin: 'customplugin'
```

- Use the organization's local repository; thus, it can be centrally accessed by any of the organization's projects.

### Configuring plugins
- To define plugin properties, you need to create one additional extension class and register the class into your plugin class.
- Example:

```
// Create the CustomPluginExtension.groovy class as follows:
class CustomPluginExtension {
def location = "/plugin/defaultlocation"
}
// register this class to your plugin class:
class CustomPlugin implements Plugin<Project> {
    void apply(Project project) {
        def extension = project.extensions.create("customExt",CustomPluginExtension)
        project.task('task1') << {
            println "Sample task1 in custom plugin"
            println "location is "+project.customExt.location
        }
    }
}
// To change this field to some other value, add customExt closure
// to your build.gradle file with a different value configured for the location:
buildscript {
    repositories {
        flatDir {dirs "../CustomPlugin/build/libs/"}
    }
    dependencies {
        classpath group: 'ch8', name: 'CustomPlugin',version: '1.0'
    }
}
apply plugin: 'customplugin'
customExt {
    location="/plugin/newlocation"
}
```

## Working with Gradle Build Scripts

- Working with files

```
// Use String for file reference.
File wsdl = file('src/wsdl/sample.wsdl')
// Use File object for file reference.
File xmlFile = new File('xml/input/sample.xml')
def inputXml = project.file(xmlFile)
// Or a URI instance.
def uri = new URI('file:/README')
def readmeFile = file(uri)
// Use a closure to determine the
// file or directory name.
def fileNames = ['src', 'web', 'config']
def configDir = file {
    fileNames.find { fileName ->
        fileName.startsWith('config')
    }
}
// Use Callable interface.
def source = file(new Callable<String>() {
    String call() {
        'src'
    }
})
```

```
// Suppose, we want to work with a directory named config in our build script. The directory must be present, otherwise the build will stop:
def dir = project.file(new File('config'),    PathValidation.DIRECTORY)
// Check file or directory exists.
def readme = project.file('README', PathValidation.EXISTS)
// Check File object is really a file.
def license = project.file('License.txt', PathValidation.FILE)
```

- Using file collections

```
// Use String instances.
def multiple =
    files('README', 'licence.txt')
// Use File objects.
def userFiles =
    files(new File('README'), new File('INSTALL'))
// We can combine different argument types.
def combined = files('README', new File('INSTALL'))
// We can pass a URI or URL object, just as we could with the file() method:
def urlFiles =
    files(new URI('file:/README'),
        new URL('file:/INSTALL'))
// We can also use an array, Collection, or Iterable object with file names
// or another ConfigurableFileCollection instance as an argument:
// Use a Collection with file or directory names.
def listOfFileNames = ['src', 'test']
def mainDirectories = files(listOfFileNames)
// Use an array.
// We use the Groovy as keyword to
// force an object to a certain type.
mainDirectories = files(listOfFileNames as String[])
// Or an implementation of the Iterable interface.
mainDirectories = files(listOfFileNames as Iterable)
// Combine arguments and pass another file collection.
def allDirectories = files(['config'], mainDirectories)
// We can also use a closure or instance of the Callable interface to define a list of files, as follows:
import java.util.concurrent.Callable
def dirs = files {
    [new File('src'), file('README')]
    .findAll { file ->
        file.directory
    }
}
def rootFiles = files(new Callable<List<File>>() {
    def files = [new File('src'),
            file('README'),
            file('INSTALL')]
    List<File> call() {
        files.findAll { fileObject ->
            fileObject.file
        }
    }
})
// we can pass a Task object as an argument to the files() method. The outputs property of the task is used to determine
// the file collection or we can directly use the TaskOutputs object instead of letting Gradle resolve
// it via the outputs property of the Task object.
// To get the file collection object in our build script,
we simply pass the Task instance as an argument to the files() method:
task convert {
    def source = new File('source.xml')
    def output = new File('output.txt')
    // Define input file
    inputs.file source
    // Define output file
    outputs.file output
    doLast {
        def xml = new XmlSlurper().parse(source)
        output.withPrintWriter { writer ->
            xml.person.each { person ->
                writer.println "${person.name},${person.email}"
            }
        }
        println "Converted ${source.name} to ${output.name}"
    }
}
// Get the file collection from
// the task outputs property.
def taskOutputFiles = files(convert)
// Alternatively we could use
// the outputs property directly.
taskOutputFiles = files(convert.outputs)
// The ConfigurableFileCollection interface has useful methods to manipulate the collection, for example,
// we can use + and - operators to add or remove elements from the collection, respectively:
// Define collection.
def fileCollection = files('README', 'INSTALL')
// Remove INSTALL file from collection.
def readme = fileCollection - files('INSTALL')
// Add new collection to existing collection.
def moreFiles =
    fileCollection +
    files(file('config',
            PathValidation.DIRECTORY))
// To get the absolute path names for the elements in ConfigurableFileCollection, we can use the asPath property.
task collectionPath << {
    def fileCollection = files('README', 'INSTALL')
    println fileCollection.asPath
}
// To get the File objects that make up the file collection, we can use the files property.
def fileCollection = files('README', [new File('INSTALL')])
// Get all elements as File objects.
def allFiles = fileCollection.files
// Or use casting with as keyword.
def fileObjects = fileCollection as File[]
def singleFileCollection = files('INSTALL')
// Get single file as File object.
def installFile = singleFileCollection.singleFile
// we can apply a filter to our file collection with the filter() method.
task filterFiles << {
    def rootFiles = files('INSTALL', 'README')
    // Filter for files with a txt extension.
    def smallFiles = rootFiles.filter { file ->
        file.name.endsWith 'txt'
    }
    rootFiles = rootFiles + files('LICENSE.txt')
    // smallFiles now contains 2 files:
    // INSTALL and LICENSE
}
```

- Working with file trees

```
// Create file tree with base directory 'src/main'
// and only include files with extension .java
def srcDir = fileTree('src/main').include('**/*.java')
// Use map with arguments to create a file tree.
def resources =
    fileTree(dir: 'src/main',
        excludes: ['**/*.java', '**/*.groovy'])
// Create file tree with project directory as base
// directory and use method include() on tree
// object to include 2 files.
def base = fileTree('.')
base.include 'README', 'INSTALL'
// Use closure to create file tree.
def javaFiles = fileTree {
    from 'src/main/java'
    exclude '*.properties'
}
// To filter a file tree, we can use the filter() method as we do with file collections, but we can also use the matching() method.
We pass a closure to the matching() method or an instance of the org.gradle.api.tasks.util.PatternFilterable interface.
We can use include, includes, exclude, and excludes methods to either include or exclude files from the file tree, as follows:
def sources = fileTree {
    from 'src'
}
def javaFiles = sources.matching {
    include '**/*.java'
}
def nonJavaFiles = sources.matching {
    exclude '**/*.java'
}
def nonLanguageFiles = sources.matching {
    exclude '**/*.scala', '**/*.groovy', '**/*.java'
}
def modifiedLastWeek = sources.matching {
    lastWeek = new Date() - 7
    include { file ->
        file.lastModified > lastWeek.time
    }
}
// We can use the visit() method to visit each tree node
def testFiles = fileTree(dir: 'src/test')
testFiles.visit { fileDetails ->
    if (fileDetails.directory) {
        println "Entering directory ${fileDetails.relativePath}"
    } else {
        println "File name: ${fileDetails.name}"
    }
}
def projectFiles = fileTree(dir: 'src/test')
projectFiles.visit(new FileVisitor() {
    void visitDir(FileVisitDetails details) {
        println "Directory: ${details.path}"
    }
    void visitFile(FileVisitDetails details) {
        println "File: ${details.path}, size: ${details.size}"
    }
})
```

- Copying files

```
// To copy files in Gradle, we can use the Copy task
task simpleCopy(type: Copy) {
    from 'src/xml'
    into 'definitions'
}
// uses the include() and exclude() methods to select the set of files to be copied:
// Define a closure with ANT-style
// pattern for files.
def getTextFiles = {
    '**/*.txt'
}
task copyTask(type: Copy) {
    // Copy from directory.
    from 'src/webapp'
    // Copy single file.
    from 'README.txt'
    // Include files with html extension.
    include '**/*.html', '**/*.htm'
    // Use closure to resolve files.
    include getTextFiles
    // Exclude file INSTALL.txt.
    exclude 'INSTALL.txt'
    // Copy into directory dist
    // resolved via closure.
    into { file('dist') }
}
// Another way to copy files is with the Project.copy() method. The copy() method accepts a CopySpec interface implementation
task simpleCopy << {
    // We use the project.copy()
    // method in our task. We can
    // leave out the project reference,
    // because Gradle knows how to
    // resolve it automatically.
    copy {
        from 'src/xml'
        into 'definitions'
    }
}
```

- Archiving files
To create an archive file, we can use Zip, Tar, Jar, War, and Ear tasks

```
task archiveDist(type: Zip) {
    from 'dist'
    // Create output filename.
    // Final filename is:
    // dist-files-archive-1.0-sample.zip
    baseName = 'dist-files'
    appendix = 'archive'
    extension = 'zip'
    version = '1.0'
    classifier = 'sample'
}
// By using task type Zip we instruct
// Gradle to create an archive
// in ZIP format.
task archiveFiles(type: Zip) {
    from 'dist'
    // Copy files to a directory inside the archive.
    into 'files'
    // Set destination directory for ZIP file.
    // $buildDir refers to default Gradle
    // build directory 'build/'.
    destinationDir = file("$buildDir/zips")
    // Set complete filename at once.
    archiveName = 'dist-files.zip'
}
// To create a TAR archive with the optional gzip or bzip2 compression, we must use the tarFiles task
task tarFiles(type: Tar) {
    from 'dist'
    // Set destination directory.
    destinationDir = file("$buildDir/tarballs")
    // Set filename properties.
    baseName = 'dist-files'
    // Default extension for tar files
    // with gzip compression is tgz.
    extension = 'tar.gz'
    // Use gzip compression.
    compression = Compression.GZIP // or Compression.BZIP2
}
```

- Project properties

```
version = '1.0'
group = 'Sample'
description = 'Sample build file to show project properties'
task defaultProperties << {
    println "Project: $project"
    println "Name: $name"
    println "Path: $path"
    println "Project directory: $projectDir"
    println "Build directory: $buildDir"
    println "Version: $version"
    println "Group: $project.group"
    println "Description: $project.description"
    println "AntBuilder: $ant"
}
```

- Defining custom properties in script

```
// Define new property.
ext.customProperty = 'custom'
// Or we can use ext{} script block.
ext {
  anotherCustomProperty = 'custom'
}
task showProperties {
    ext {
        customProperty = 'override'
    }
    doLast {
        // We can refer to the property
        // in different ways:
        println customProperty
        println project.ext.customProperty
        println project.customProperty
    }
}
```

- Defining properties using an external file
We can also set the properties for our project in an external file. The file needs to be named gradle.properties,
and it should be a plain text file with the name of the property and its value on separate lines.

```
task showProperties {
    doLast {
        println "Version: $version"
        println "Custom property: $customProperty"
    }
}
```

- Passing properties via the command line
Instead of defining the property directly in the build script or external file, we can use the -P command-line option
to add an extra property to a build.

```
// Run By: $ gradle -Pversion=1.1 -PcustomProperty=custom showProperties
task showProperties {
    doLast {
        println "Version: $version"
        println "Custom property: $customProperty"
    }
}
```

- Defining properties via system properties
We can also use Java system properties to define properties for our Gradle build.
We use the -D command-line option just like in a normal Java application.

```
// run: gradle -Dorg.gradle.project.version=2.0 -Dorg.gradle.project.customProperty=custom showProperties
task showProperties {
    doLast {
        println "Version: $version"
        println "Custom property: $customProperty"
    }
}
```

- Adding properties via environment variables
The environment variable name starts with `ORG_GRADLE_PROJECT_` and is followed by the property name.
We use our build file to show the properties:

```
// we set ORG_GRADLE_PROJECT_version and ORG_GRADLE_PROJECT_customProperty environment variables,
// then we run our showProperties task:
task showProperties {
    doLast {
        println "Version: $version"
        println "Custom property: $customProperty"
    }
}
```

- Using logging
Every Gradle build file and task has a logger object. The logger object is an instance of a Gradle-specific extension
of the Simple Logging Facade for Java (SLF4J) Logger interface. SLF4J is a Java logging library.

```
// Run by : $ gradle --debug logLevels . $ gradle --info logLevels . $ gradle logLevels
// Simple logging sample.
task logLevels << {
    logger.debug 'debug: Most verbose logging level'
    logger.log LogLevel.DEBUG, 'debug: Most verbose logging level'
    logger.info 'info: Use for information messages'
    logger.log LogLevel.INFO, 'info: Use for information messages'
    logger.lifecycle 'lifecycle: Progress information messages'
    logger.log LogLevel.LIFECYCLE,
      'lifecycle: Progress information messages'
    logger.warn 'warn: Warning messages like invalid        configuration'
    logger.log LogLevel.WARN,
      'warn: Warning messages like invalid configuration'
    logger.quiet 'quiet: This is important but not an error'
    logger.log LogLevel.QUIET,
      'quiet: This is important but not an error'
    logger.error 'error: Use for errors'
    logger.log LogLevel.ERROR, 'error: Use for errors'
}
```

we know that every Gradle project and task has a logger we can use. However,
we can also explicitly create a logger instance with the Logging class

```
class Simple {
    // Create new logger using the Gradle
    // logging support.
    private static final Logger logger = Logging.getLogger('Simple')
    int square(int value) {
        int square = value * value
        logger.lifecycle "Calculate square for ${value} = ${square}"
        return square
    }
}
logger.lifecycle 'Running sample Gradle build.'
task useSimple {
    doFirst {
        logger.lifecycle 'Running useSimple'
    }
    doLast {
        new Simple().square(3)
    }
}
```

- Controlling output

```
logging.captureStandardOutput LogLevel.INFO
println 'This message is now logged with log level info instead of quiet'
task redirectLogging {
    doFirst {
      // Use default redirect log level quiet.
      println 'Start task redirectLogging'
    }
    doLast {
      logging.captureStandardOutput LogLevel.INFO
      println 'Finished task redirectLogging'
    }
}
```

- Using the Gradle Wrapper

```
// Creating wrapper scripts
$ gradle wrapper
$ gradle wrapper --gradle-version=2.12
// Customizing the Gradle Wrapper
task createWrapper(type: Wrapper) {
    // Set Gradle version for wrapper files.
    gradleVersion = '2.12'
    // Rename shell scripts name to
    // startGradle instead of default gradlew.
    scriptFile = 'startGradle'
    // Change location and name of JAR file
    // with wrapper bootstrap code and
    // accompanying properties files.
    jarFile = "${projectDir}/gradle-bin/gradle-bootstrap.jar"
}
// run by $ gradle createWrapper
// To change the URL from where the Gradle version must be downloaded, we can alter the distributionUrl property.
task createWrapper(type: Wrapper) {
    // Set URL with custom Gradle distribution.
    distributionUrl = 'http://intranet/gradle/dist/gradle-custom-2.12.zip'
}
```

## Using Gradle for Java Projects

- Working with source sets
A source set is a collection of source files that are compiled and executed together.
Without any configuration, we already have the main and test source sets, which are added by the Java plugin.

```
apply plugin: 'java'
task sourceSetJavaProperties << {
    sourceSets {
        main {
            println "java.srcDirs = ${java.srcDirs}"
            println "resources.srcDirs = ${resources.srcDirs}"
            println "java.files = ${java.files.name}"
            println "allJava.files = ${allJava.files.name}"
            println "resources.files = ${resources.files.name}"
            println "allSource.files = ${allSource.files.name}"
            println "output.classesDir = ${output.classesDir}"
            println "output.resourcesDir = ${output.resourcesDir}"
            println "output.files = ${output.files}"
      }
    }
}
```

- Creating a new source set
Gradle will create three new tasks based on this source set—apiClasses, compileApiJava, and processApiResources.
```
apply plugin: 'java'
sourceSets {
    api
    main {
      compileClasspath += files(api.output.classesDir)
    }
}
classes.dependsOn apiClasses
```

- Custom configuration
to reconfigure the main and test source sets:

```
apply plugin: 'java'
sourceSets {
    main {
        java {
            srcDir 'src/java'
        }
        resources {
            srcDir 'resources/java'
        }
    }
    test {
        java {
            srcDir 'test/unit/java'
        }
        resources {
            srcDir 'resources/test'
        }
    }
    'integeration-test' {
        java {
            srcDir 'test/integration/java'
        }
        resources {
            srcDir 'resources/test'
        }
    }
}
```

- Working with properties

```
task showConvention << {
    println sourceSets.main.name
    println project.sourceSets.main.name
    println project.convention.plugins.java.sourceSets.main.name
}
```

```
apply plugin: 'java'
archivesBaseName = 'gradle-sample'
version = '1.0'
sourceCompatibility = JavaVersion.VERSION_1_8 // Or '1.8' or 8
jar {
    manifest {
      attributes(
        'Implementation-Version' : version,
        'Implementation-Title' : 'Gradle Sample'
      )
    }
}
```

- Creating Javadoc documentation

```
apply plugin: 'java'
javadoc {
    source sourceSets.api.allJava
}
// to set some of the options for the javadoc task in our project:
javadoc {
    source sourceSets.api.allJava
    title = 'Gradle Sample Project'
    options.links = ['http://docs.oracle.com/javase/6/docs/api/']
    options.footer = "Generated on ${new Date().format('dd MMM yyyy')}"
    options.header = "Documention for version ${project.version}"
}
```

- Assembling archives

```
apply plugin: 'java'
archivesBaseName = 'gradle-sample'
version = '1.0'
sourceSets {
    api
    main {
        compileClasspath += files(api.output.classesDir)
    }
}
classes.dependsOn apiClasses
task apiJar(type: Jar) {
    // Define appendix that will be
    // appended to the archivesBaseName
    // for the JAR.
    appendix = 'api'
    // Define the input for the JAR file.
    from sourceSets.api.output
}
```

## Dependency Management

### Dependency configuration

Every Gradle build has a ConfigurationContainer object.
This object is accessible via the Project property with the name containers.
We can use a closure to configure the container with Configuration objects.
Each Configuration object has at least a name, but we can change more properties.
We can set a resolution strategy, if a configuration has version conflicts with dependencies,
or we can change the visibility of a configuration so that it will not be visible outside of our project.
A Configuration object also has a hierarchy. So we can extend from the existing Configuration objects to inherit the settings.

```
configurations {
    commonsLib {
        description = 'Common libraries'
    }
    mainLib {
        extendsFrom commonsLib
        description = 'Main libraries'
    }
}
// Reference mainLib configuration
// using [] syntax for the
// configuration container.
println configurations['mainLib'].name
// Reference commonsLib in another way,
// just use the name directly as property.
println configurations.commonsLib.name
```

### Repositories
- Adding Maven repositories
- Adding Ivy repositories
- Adding a local directory repository

### Defining dependencies
- Using external module dependencies
- Using project dependencies
- Using client module dependencies
- Using Gradle and Groovy dependencies
- Adding optional ANT tasks
- Using dependency configurations as files

```
repositories {
    jcenter()
}
configurations {
    springLibs
}
dependencies {
    springLibs('org.springframework:spring-web:4.2.3.RELEASE')
}
task copyCompileDeps(type: Copy) {
    from configurations.springLibs
    into "$buildDir/compileLibs"
}
```

- Using file dependencies

```
dependencies {
    compile files('spring-core.jar', 'spring-aop.jar')
    compile fileTree(dir: 'deps', include: '*.jar')
}
```

## Testing, Building, and Publishing Artifacts

- Testing our projects
- Configuring the test process

```
apply plugin: 'java'
repositories {
    jcenter()
}
dependencies {
    testCompile('junit:junit:4.12')
}
test {
    // Add System property to running tests.
    systemProperty 'sysProp', 'value'
    // Use the following JVM arguments for each test process.
    jvmArgs '-Xms256m', '-Xmx512m'
    // Enable debugging mode.
    debug = true
    // Ignore any test failues and don't fail the build.
    ignoreFailures = true
    // Enable assertions for test with the assert keyword.
    enableAssertions = true
    // Run four tests in parallel.
    maxParallelForks = 4
    // Restart proces after
    // 10 executions.
    forkEvery = 10
    // Disable automatic scanning
    // for test classes.
    scanForTestClasses = false
    // Include test classes.
    include('**/*Test.class', '**/*Spec.class')
    // Exclude test classes.
    exclude('**/Abstract*.class', '**/Run*.class')
    // Set exception format to full
    // instead of default value 'short'.
    testLogging.exceptionFormat 'full'
    // We can also use a script block to configure
    // the testLogging property.
    testLogging {
        // No log level specified so the
        // property is set on LIFECYCLE log level.
        // We can pass arguments to determine
        // which test events we want to see in the
        // command-line output.
        events 'passed'
        // Show logging events for test methods.
        minGranularity = 3
        // All valid values for the stackTrace output.
        stackTraceFilters 'groovy', 'entry_point', 'truncate'
        // Show System.out and System.err output
        // from the tests.
        showStandardStreams = true
        // Configure options for DEBUG log level.
        debug {
            events 'started'
        }
    }
}
```

- Changing the test report directory

```
apply plugin: 'java'
repositories {
    jcenter()
}
dependencies {
    testCompile('junit:junit:4.12')
}
task testReport(type: TestReport) {
    destinationDir = file("$buildDir/test-reports")
    testResultDirs = files("$buildDir/test-results")
    reportOn(test)
}
// If the test task is finished,
// we want the testReport to be executed.
test.finalizedBy(testReport)
```

- Running an application from a project
The Project class that is always available in our build file has the javaexec() method. With this method,
we can execute a Java class.

```
apply plugin: 'java'
task runJava(dependsOn: classes,
    description: 'Run gradle.sample.SampleApp') << {
    javaexec {
        // Java main class to execute.
        main = 'gradle.sample.SampleApp'
        // We need to set the classpath.
        classpath sourceSets.main.runtimeClasspath
        // Extra options can be set.
        maxHeapSize = '128m'
        systemProperty 'sysProp', 'notUsed'
        jvmArgs '-client'
    }
}
repositories {
    jcenter()
}
```

- Running an application as a task
Besides the javaexec() method, we can define a new org.gradle.api.tasks.JavaExec task.
To configure the task, we can use the same methods and properties as with the javaexec() method.

```
apply plugin: 'java'
task runJava(type: JavaExec) {
    dependsOn classes
    description = 'Run gradle.sample.SampleApp'
    // Java main class to execute.
    main = 'gradle.sample.SampleApp'
    // We need to set the classpath.
    classpath sourceSets.main.runtimeClasspath
    // Extra options can be set.
    systemProperty 'sysProp', 'notUsed'
    jvmArgs '-client'
    // We can pass arguments to the main() method
    // of gradle.sample.SampleApp.
    args 'mainMethodArgument', 'notUsed'
}
```

- Running an application with the application plugin

```
apply plugin: 'application'
mainClassName = 'gradle.sample.SampleApp'
// Extra configuration for run task if needed.
run {
    // Extra options can be set.
    systemProperty 'sysProp', 'notUsed'
    jvmArgs '-client'
    // We can pass arguments to the main() method
    // of gradle.sample.SampleApp.
    args 'mainMethodArgument', 'notUsed'
}
```

- Creating a distributable application archive
With the application plugin, we can also build a distribution with our Java application. All tasks depend on the Jar task.
Read more about application plugin in [https://docs.gradle.org/current/userguide/application_plugin.html](https://docs.gradle.org/current/userguide/application_plugin.html)

```
apply plugin: 'application'
mainClassName = 'gradle.sample.SampleApp'
archivesBaseName = 'gradle-sample'
version = '1.0'

```

- Publishing artifacts
Read more about publishing artifacts in [https://docs.gradle.org/current/userguide/artifact_management.html](https://docs.gradle.org/current/userguide/artifact_management.html)

- Creating a WAR file

```
apply plugin: 'java'
version = '1.0'
// Custom archive task with
// specific properties for a WAR archive.
task war(type: War) {
    dependsOn classes
    from 'src/main/webapp'
    // Files copied to WEB-INF.
    webInf {
        from 'src/main/webInf'
    }
    // Copied to WEB-INF/classes.
    classpath sourceSets.main.runtimeClasspath
    // Copied to WEB-INF/lib.
    classpath fileTree('libs')
    // Custom web.xml.
    webXml = file('  ')
    baseName = 'gradle-webapp'
}
assemble.dependsOn war
```

## Multi-project Builds
-  add a new file, `settings.gradle`, in the root directory.
and use the `include()` method to set the projects that are part of our multi-project build.
- We can reference a project with the `project()` method and use the complete name of the project as an argument.
We must use a closure to define the tasks and properties of the project.
- Gradle has the `allprojects{}` script block to apply project tasks and properties to all projects
that are part of the multi-project build.
- the `subprojects{}` script block apply only tasks and properties of the subprojects of a multi-project build are configured.
- To apply specific configuration to more than one project, we can also use project filtering.
In our `build.gradle` file, we must use the `configure()` method.

## Maintaining Code Quality
- There are tools already available for Java projects to analyze and check the source code,
such as Checkstyle, JDepend, PMD, FindBugs, and CodeNarc. Gradle has plugins for each of these tools.

## Writing Custom Tasks and Plugins
- create a new task definition in our build file and make it an enhanced task.
create a new class in our build file and this class extends `org.gradle.api.DefaultTask`.
To indicate that the method is the action of the class, we will use the `@TaskAction` annotation.
- place the task class definition file in the buildSrc project source directory.
- You can create a task in a standalone project.
- A plugin can contain tasks, configurations, properties, methods, concepts, and more to add extra functionality to our projects.
and to create a new plugin in the build file, you must implement the `org.gradle.api.Plugin<T>` interface and `apply()` method.
- You can create a plugin in the project source directory.
- You can create a plugin in a standalone project.

## Gradle in the Enterprise
- It is good practice to have a continuous integration tool in a software project.
With a continuous integration tool, we can automatically build our software in a controlled environment.

## Read more about Gradle
- [https://docs.gradle.org/current/userguide/userguide.html](https://docs.gradle.org/current/userguide/userguide.html)
