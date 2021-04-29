from odtk import Client

def connect(port : int, address = '0.0.0.0'):
    """Method to connect to ODTK

    Arguements:
    port -- the integer port number that the odtk http server is running on
    address -- the string ip address of the machine running odtk (typically 0.0.0.0 if on the same machine)
    """
    client = Client(port=port)
    odtk = client.get_root()

def odtkExample(odtk):
    """Method to run some example commands to ensure you are connected to the odtk instance

    Arguements:
    odtk -- the root odtk object
    """
    odtk.application.createObj(odtk, 'Scenario', 'ContainerTest')
    odtk.application.createObj(odtk.scenario[0], 'Satellite', 'ContainerSatellite')
    odtk.application.createObj(odtk.scenario[0], 'Filter', 'ContainerFilter')

    filter = odtk.scenario[0].Children['Filter'][0]
    filter.Go()

    odtk.application.deleteObject('', odtk.scenario[0])

if __name__=="__main__":
    odtk = connect(9876)
    odtkExample(odtk)
