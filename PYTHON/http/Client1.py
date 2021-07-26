import socket

s = socket.socket()

host = '127.0.0.1'
port = 8000

s.connect((host, port))

msg = "GET / HTTP/1.1\r\n\r\n"

s.send(msg.encode())

message_from_server = s.recv(1024)
decoded_message = message_from_server.decode()

print(decoded_message)

s.close()