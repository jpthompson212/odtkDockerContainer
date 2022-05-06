# ODTK Runtime Container #

 > Unofficial ODTK Engine Runtime Container

 > Branch maintained for ODTK releases (<7.2.1) using the legacy AGI license server

This requires that you download the ODTK engine from [AGI Suppoort](https://support.agi.com/downloads/?t=4) and obtain a license by contacting [AGI Support](mailto:support@agi.com).

## Build the image ##

First you will want to alter the [license file](License/client.lic) to contain the information pointing to your license server.

You can then place the ODTK Engine zip file at the root level.  For ODTK 7.2.1 the file in named `ODTKEngineLinux_v7.2.1.zip`.

### Example Build Command ###

```docker
docker build . -t jthompson/odtkruntime
```

## Run the container ##

To run the container

| **Flag** | **Value** |
| :----- | :----- |
| -p, --publish | `<localport>:9876` |
| --name | `desired container name` |

### Example Run Command ###

```docker
docker run --publish 9876:9876 --name odtkruntime jthompson/odtkruntime
```

## Testing ##

Now that the container is running it can be tested utilizing the cross platform api

> [ODTK Scripting Guide](https://help.agi.com/ODTK/index.htm#od/ODTKScriptingGuide.htm#CrossPlatformAPI)

### Example using python ###

A full python script can be found at [odtk_automation.py](odtk_automation.py)

```python
from odtk import Client

client = Client(port=9876)

odtk = client.get_root()
odtk_child_count = odtk.children.count

print(odtk_child_count)
```
