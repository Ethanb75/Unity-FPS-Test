# Unity MCP Server
https://github.com/CoplayDev/unity-mcp

## Install the Unity Package

In Unity: Window > Package Manager > + > Add package from git URL...

Tip
``
https://github.com/CoplayDev/unity-mcp.git?path=/MCPForUnity#main
``

## starting mcp server for unity

```sh
uvx --prerelease explicit --from "mcpforunityserver>=0.0.0a0" mcp-for-unity --transport http --http-url http://localhost:8080 --project-scoped-tools
```

then, In Unity: Window > MCP for Unity > Toggle MCP Window