# WRITING TCP CLIENT AND SERVER SOFTWARE CONCURRENT SERVERS AND MULTITHREADING


A. Simonelis

Due:	Demos – December 5 and 7, 2017

Docs  – December 8, 2017

## ITERATIVE SERVERS

An iterative server handles clients sequentially. This means that:
- it services 1 client at a time
-a 2nd, … client will be able to connect to the server
- the 2nd, … client will be able to send data (which will be queued by Java/TCP) as soon as it connects
- the server will not process the data of, nor reply to, the 2nd, … client until it has finished with the 1st client, which is the only client being serviced by the server.

To be effective, the client servicing must take a small, bounded amount of time; otherwise, the wait experienced by subsequent clients may cause timeout problems. This proviso is generally unrealistic.

## MULTITHREADING

Using multithreading, a single process can handle multiple activities, including multiple instances of one type of activity (such as servicing a client), concurrently and independently by spawning a thread for each activity.

Multithreading is a feature provided by programming languages, including Java, that is based partly on multitasking, which is a feature of the underlying OS. Since an OS uses one of two different ways to perform multitasking, the multithreading feature of Java can behave differently on different OSs, and therefore multithreading is not platform independent, unlike most features of Java. 

A process or task is a unit of work submitted to the OS for execution, consisting of 1 or more threads. It is allocated resources by the OS. An example of a process is the execution of an .exe file.

A thread is an executable unit that inherits its parent’s resources, and can dynamically acquire resources of its own from the OS. A thread is a dispatchable unit that has priorities that determine when it will execute on a CPU.

A program that is highly parallel (i.e. has a number of activities that can be executed independently) can execute much more quickly when multithreaded than when run as a single thread, especially on a multiprocessor system. Such a program could spawn multiple threads, one for each parallel activity.

## CONCURRENT SERVERS

A concurrent server handles multiple clients simultaneously. There are 2 ways to implement a concurrent server:

1. thread-per-client, where a new thread is spawned to handle each new client
2. thread-pool, where the server pre-spawns a fixed number of threads to handle all client connections.

A thread-per-client server is simpler from the programming point of view. However, it is also more dangerous to the OS, and therefore less reliable, because errors in the server, or a flood of external requests by hackers, could produce an excessive, unsupportable number of threads being spawned. That could lead to a system crash, because each thread requires resources (e.g. memory and setup time from the CPU).

A thread-pool server is more complicated since its code must contain the modules necessary for management of the thread pool. It also may cause clients to wait longer for servicing than a thread-per-client server. At the same time, it is less likely to crash and therefore more reliable.

## MULTITHREADING IN JAVA

Java provides 2 ways to execute a new thread.

1. The multithreaded class (e.g. ThreadExample) is defined as a subclass of the Thread class. ThreadExample must contain a run() method for the multithreaded activities and the class is used in the same way as in method 2 (described below). This way of doing multithreading is less general because it has the drawback that it can only be used with classes that do not already extend a class.

2. The multithreaded class (e.g. `ThreadExample`) implements the Runnable interface with a `run()` method for the set of multithreaded activities. The current, spawning thread (e.g. `main()`) instantiates `ThreadExample` and passes it to the Thread constructor to spawn a thread, and that thread is used to invoke the `start()` method which causes the JVM to execute the `run()` method as a new thread. Note that if `main()` invoked `run() `directly, rather than through execution of start(), that would cause `run()` to be executed as part of the `main()` thread, rather than as an independent thread. After `start()` begins executing `run()`, flow of control immediately returns to `main()` – `start()` does not block – and `main()` can continue executing. `main()` and `run()` are now both executing as separate threads. In fact, if `main()` ends before `run()`, the JVM will generally continue executing `run()` (unless it is a daemon process).

For example:
```java
public class ThreadExample implements Runnable {

  private String greeting;   	// Message to display

  public ThreadExample(String greeting) {
    this.greeting = greeting;
  }

  public void run() {
    for (;;) {
        System.out.println(Thread.currentThread().getName() + ":  " + greeting);
        try {
            Thread.sleep((long) (Math.random() * 100));
            //Sleep 0 to 99 milliseconds
        } catch (InterruptedException e) {}
        // Will not happen
    }
  }

  public static void main(String[] args) {
      new Thread(new ThreadExample("Hello")).start();
      new Thread(new ThreadExample("Aloha")).start();
      new Thread(new ThreadExample("Ciao")).start();
  }
}
```

Examine the `EchoProtocol2.java` file on the server. That class’s `run()` method encapsulates the session-handling code of `TCPEchoServer.java`. The thread-per-client server code can create a separate instance of `EchoProtocol2` for each client connection, construct a `Thread` with it, and `start()` the thread executing independently. See `TCPEchoServerThread2.java` for the server code.

It is important to note that multithreading is an advanced, complicated topic. For example, if 2 or more threads need to access a common data item, access to that item must be carefully synchronized to guarantee proper updating of that item. As well, deadlock (a situation where 2 or more threads are blocked forever, each waiting for some action to be performed by the other blocked threads) must be avoided. These dangers do not apply to the protocol in this project because your threads share no common data - they execute entirely independently of one another.

Implement your 3 STONES protocol server as a thread-per-client server.

## Final documentation (per team) will consist of:

1. a title page, which includes a statement describing the status of your project (complete and working properly, or detailing existing problems)
2. the source listings of the server program, which are to include explanatory comments; on the day that you submit your documentation, you must also email your source code to your instructor
3. all of the above in an appropriate binder.
