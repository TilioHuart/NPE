# NPE
NPE (Newton Physics Engine), a 2D physics engine written in C++23.

## Architecture

The engine is split into two independent static libraries, orchestrated by a client
(`Sandbox`) that owns the ECS registry.

```mermaid
flowchart LR
    ECS[("<b>ECS registry</b><br/>sandbox")]
    PH["<b>Physics</b>"]
    RD["<b>Renderer</b>"]

    ECS -->|"BodyInput[]"| PH
    PH -->|"BodyState[]"| ECS
    ECS -->|"DrawCommand[]"| RD

    style ECS fill:#4a3f1a,color:#fff,stroke:#c9a227
    style PH fill:#1f4d2b,color:#fff,stroke:#3fa15c
    style RD fill:#1a3a5c,color:#fff,stroke:#4a90d9
```

**`NpePhysics`** brings Newton's laws to the scene: force integration, collision
detection and resolution. It runs headless.

**`NpeRenderer`** displays the scene..

The **`Sandbox`** owns the scene and is the only translation point between the two.
