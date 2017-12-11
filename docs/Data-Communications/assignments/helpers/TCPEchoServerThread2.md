```java
// for Socket, ServerSocket, and InetAddress
import java.net.*;
// for IOException and Input/OutputStream
import java.io.*;

public class TCPEchoServerThread2 {
  public static void main(String[] args) throws IOException {
    if (args.length != 1)  							
      // Test for correct # of args
      throw new IllegalArgumentException("Parameter(s): <Port>");

    // Server port 
    int echoServPort = Integer.parseInt(args[0]);

    // Create a server socket to accept client connection requests
    ServerSocket servSock = new ServerSocket(echoServPort);

    // Run forever, accepting and spawning threads to service each connection
    for (;;) {
      try {
        Socket clntSock = servSock.accept();  	// Block waiting for connection
        EchoProtocol2 protocol = new EchoProtocol2(clntSock);
        Thread thread = new Thread(protocol);
        thread.start();
        System.out.println("Created and started Thread = " + thread.getName());
      } catch (IOException e) {
          System.out.println("Exception = " + e.getMessage());
      }
    }
    /* NOT REACHED */
  }
}
```