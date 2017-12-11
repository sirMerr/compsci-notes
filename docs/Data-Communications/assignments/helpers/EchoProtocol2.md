```java
// for Socket
import java.net.*;
// for IOException and Input/OutputStream
import java.io.*;

class EchoProtocol2 implements Runnable {
    // Size (in bytes) of I/O buffer
    static public final int BUFSIZE = 32; 
    // Connection socket
    private Socket clntSock;  					// Connection socket
    
    public EchoProtocol2(Socket clntSock) {
        this.clntSock = clntSock;
    }

    public void run() {
        try {
            // Get the input and output I/O streams from socket
            InputStream in = clntSock.getInputStream();
            OutputStream out = clntSock.getOutputStream();

            // Size of received message
            int recvMsgSize;  
            // Bytes received from client   
            int totalBytesEchoed = 0;
            // Receive Buffer
            // Receive until client closes connection, indicated by -1
            byte[] echoBuffer = new byte[BUFSIZE];
            while ((recvMsgSize = in.read(echoBuffer)) != -1) {
                out.write(echoBuffer, 0, recvMsgSize);
                totalBytesEchoed += recvMsgSize;
            }
        } catch (IOException e) {
            System.out.println("Exception = " +  e.getMessage());
        }
        // Close socket
        try {
            clntSock.close();
        } catch (IOException e) {
            System.out.println("Exception = " +  e.getMessage());
        }
    }
}

```