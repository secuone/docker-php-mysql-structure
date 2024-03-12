# PHP with MySQL and Adminer basic structure in Docker

This project provides a basic structure for developing PHP applications using MySQL as the database, all running in Docker containers. It includes Make commands for easy project management.

## Getting Started

### Prerequisites

To run this project, you need to have Docker and Docker Compose installed on your machine.

### Installation

1. Clone this repository to your local machine:

    ```bash
    git clone <repository_url>
    ```

2. Navigate to the project directory:

    ```bash
    cd project_directory_name
    ```

3. Copy the `.env.example` file and rename it to `.env`:

    ```bash
    cp .env.example .env
    ```

4. Configure the environment variables in the `.env` file as needed.

### Usage

1. To build the application, run:

    ```bash
    make setup
    ```

2. To start the application, run:

    ```bash
    make up
    ```

3. Once the application is started, you can access it from your web browser at `http://localhost:8000`.

4. To stop the application, run:

    ```bash
    make down
    ```

## Project Structure

```shell
root
├── app # PHP Code
│   └── index.php
├── etc # Infrastructure
│   └── php
│       └── Dockerfile
├── migrations # DB Migrations
│   └── database.sql # Migration example
├── docker-compose.yml
├── Makefile
└── README.md

```