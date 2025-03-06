# self-hosted-gitea
This is a repository where I have built a containerized GitHub-like VCS service which can be self-hosted on a local machine or server

---
## Tech Stack

![My Skills](https://go-skill-icons.vercel.app/api/icons?i=linux,docker,bash,postgres,git,gitea,vscode,&perline=6)

---
## Why Gitea?

>[!NOTE]
> We use GitHub or GitLab like software daily without knowing how it is installed/managed at the server level. So, for practising Docker I wanted a ready-made application which I can deploy on a container and also from scratch as much as possible.
>
> **Learning :**
>1. Create a PostgreSQL image from the source code.
>2. Make the postgres image dynamic so that it can be modified with runtime values in an environment variable.
>3. Docker multistage Image creation
>4. Docker Volume Backup and Restore process
>5. run Gitea in a container
>6. Manage both the Container through Docker-Compose
>7. Make use of these 2 images for Kubernetes deployment or Cloud deployment learning.
