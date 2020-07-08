# ODTK Runtime Container #

 > Unofficial ODTK Engine Runtime Container

## Build the image ##

If you would like to build the image yourself

### Example Build Command ###

```docker
docker build . -t jthompson/odtkruntime
```

## Run the container ##

To run the container

| **Flag** | **Value** |
| :----- | :----- |
| -p, --publish | `<localport>:9876` |
| -v, --volume | `C:\path\to\local\license\*.lic:/app/LicenseData/odtkLicense.lic` |
| --name | `desired container name` |

### Example Run Command ###

```docker
docker run --publish 9876:9876 -v C:\temp\training-STK-DEMO-200708.lic:/app/LicenseData/odtkLicense.lic --name odtkruntime jthompson/odtkruntime
```

## Testing ##

Now that the container is running it can be tested utilizing the cross platfrom api

> [ODTK Scripting Guide](https://help.agi.com/ODTK/index.htm#od/ODTKScriptingGuide.htm#CrossPlatformAPI)

### Example using python ###

```python
from odtk import Client

client = Client(port=9876)

odtk = client.get_root()
odtk_child_count = odtk.children.count

print(odtk_child_count)
```
