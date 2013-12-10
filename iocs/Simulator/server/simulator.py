import SocketServer
import re
import argparse
import time
import random

class DMM4040:
    def __init__(self):
        self.VALUE = 12345
        self.IDN = "Tektronix DMM4040 Simulator, ISIS"
        
    def check_command(self, comstr):
        if comstr == "INIT;FETC?":
            #Get actual value
            return str(random.randint(1000, 10000))
        elif comstr.startswith("CONF:"):
            #Do nothing as this value cannot be read
            pass
        elif comstr == "*IDN?":
            return self.IDN
        return None

class SimulatorTCPHandler(SocketServer.BaseRequestHandler):
    def handle(self):
        global SIMULATOR, DEBUG
        # self.request is the TCP socket connected to the client
        self.data = self.request.recv(1024).strip()
        
        ans = SIMULATOR.check_command(self.data)
        
        if DEBUG :
            print self.data, "returned", ans
        
        if not ans is None:
            self.request.sendall(ans)
            
if __name__ == "__main__":
    #Argument parser - checks for debug mode and port
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--debug', action='store_true', help='put into debug mode')
    parser.add_argument('-p', '--port', type=int, nargs=1, default=9999, help='server port')
    args = parser.parse_args()
    DEBUG = args.debug
    
    #Define the type of simulator
    SIMULATOR = DMM4040()
    
    # Create the server, binding to localhost on port 
    server = SocketServer.TCPServer(("localhost", args.port), SimulatorTCPHandler)

    # Activate the server; this will keep running until you
    # interrupt the program with Ctrl-C
    server.serve_forever()