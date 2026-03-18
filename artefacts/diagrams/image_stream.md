graph TD
  A[GitHub Repo] -->|Webhook Trigger| B[BuildConfig: mediaapi-build]
  B --> C[ImageStream: mediaapi:dev]
  C -->|ImageChange Trigger| D[DeploymentConfig: mediaapi-deploy]
  D --> E[Pod: mediaapi-deploy]
  E --> F[Service]
  F --> G[Route]

  subgraph Base Image Import
    H[ImageStream: mediaapi:base] --> I[Imported from Red Hat Registry]
    H --> B
  end

  subgraph Promotion Flow
    C -->|oc tag| J[ImageStream: mediaapi:prod]
    J -->|ImageChange Trigger| K[DeploymentConfig: mediaapi-prod]
    K --> L[Pod: mediaapi-prod]
  end
