from odtk import Client

client = Client(port=9876)


odtk = client.get_root()

odtk.application.createObj(odtk, 'Scenario', 'ContainerTest')
odtk.application.createObj(odtk.scenario[0], 'Satellite', 'ContainerSatellite')
odtk.application.createObj(odtk.scenario[0], 'Filter', 'ContainerFilter')

filter = odtk.scenario[0].Children['Filter'][0]
filter.Go()


odtk.application.deleteObject('', odtk.scenario[0])