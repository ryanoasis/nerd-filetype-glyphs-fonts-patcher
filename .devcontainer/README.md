# Development Container

This documentation explains how to use the development container for [Python](https://www.python.org/) in [Visual Studio Code](https://code.visualstudio.com/) integrated development environment (IDE).

The development container specification defines a standard for any development tool to use a container as a full-featured development environment.

## Using the Dev Container

Follow these simple steps to get started:

1. Install [Visual Studio Code](https://code.visualstudio.com/) or [Visual Studio Code Insiders](https://code.visualstudio.com/insiders/).
2. Add the [Remote Development](https://aka.ms/vscode-remote/download/extension/) extension pack to your _Visual Studio Code_.
3. Install and configure [Docker](https://www.docker.com/get-started/) for your operating system.

Once done, open the project folder of this repository in _Visual Studio Code_. Then, press `F1` or `Ctrl+Shift+P` to bring up the Command Palette and type **Dev Containers: Reopen in Container** to start your development environment.

The first time you open the dev containers, the _Docker_ container will be built, and _Python_ dependencies will be installed.

## Additional Information

For more details, explore the links mentioned in this document. Also, visit the [devcontainers GitHub org](https://github.com/devcontainers/) to find the [Development Containers Specification](https://containers.dev/) and additional dev container resources.
