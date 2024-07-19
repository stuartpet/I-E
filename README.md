# Income & Expenditure Statement API

This API application enables customers to create income and expenditure statements. It calculates disposable income and provides an I&E rating based on the customer's financial data.

## Features

- User authentication using Devise and JWT tokens.
- Create and retrieve income and expenditure statements.
- Calculate disposable income.
- Determine I&E rating based on expenditure-to-income ratio.

## Table of Contents

- [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Endpoints](#endpoints)
  - [Authentication](#authentication)
- [Running Tests](#running-tests)

## Setup

### Prerequisites

- Ruby (version 3.x recommended)
- Rails (version 6.x recommended)
- PostgreSQL (or SQLite for local development)
- Git

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/stuartpet/I-E-Statement-API.git
    cd I-E-Statement-API
    ```

2. **Install dependencies:**

    ```bash
    bundle install
    ```

3. **Set up the database:**

    ```bash
    rails db:create db:migrate
    ```

4. **Set up credentials:**

    Add your JWT secret key to `config/credentials.yml.enc`:

    ```bash
    EDITOR="nano" rails credentials:edit
    ```

    Add the following lines:

    ```yaml
    devise:
      jwt_secret_key: your_jwt_secret_key_here
    ```

## Usage

### Start the Rails server:

The server will start on http://localhost:3000

```
rails server
```

### Endpoints

```
POST /signup
```

```
{
  "user": {
    "email": "user@example.com",
    "password": "password",
  }
}
```

```
POST /login
```
```
{
  "user": {
    "email": "user@example.com",
    "password": "password"
  }
}
```

```
POST /logout
```

```
POST /ie_statements
```
```
{
  "ie_statement": {
    "income": 3000,
    "expenditure": 1000
  }
}
```
Create I&E Statement

```
GET /ie_statements
```
Headers

Authorization: Bearer <your_jwt_token>

```
{
  "ie_statement": {
    "income": 3000,
    "expenditure": 1000
  }
}
```

List I&E Statements

```
GET /ie_statements
```

Headers

Authorization: Bearer <your_jwt_token>

Show I&E Statement

```
GET /ie_statements/:id
```

Header

Authorization: Bearer <your_jwt_token>

### Authentication
Authenticate requests by adding the Authorization: Bearer <your_jwt_token> header to your HTTP requests.

### Running Tests
To run the test suite, execute:

```
rspec
```




