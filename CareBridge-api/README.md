# CareBridge Backend 🌐💻

Welcome to the **CareBridge Backend** repository. This backend application serves as the server-side component for the CareBridge app, facilitating communication between clients (mobile/web) and the
database.

## Technologies Used 🚀

-   **Node.js**: JavaScript runtime environment.
-   **TypeScript**: Typed superset of JavaScript.
-   **Express**: Web application framework for Node.js.
-   **PostgreSQL**: Open-source relational database.
-   **Prisma**: Modern ORM for Node.js and TypeScript.

## Installation and Setup ⚙️

1. **Clone the repository**:

    ```bash
    git clone https://github.com/yourusername/carebridge-backend.git
    cd carebridge-backend
    ```

2. **Install dependencies**:

    ```bash
    npm install
    ```

3. **Set up environment variables**:

    - Create a `.env` file based on `.env.example`.
    - Update variables such as database credentials, JWT secret, etc.

4. **Database setup**:

    - Ensure PostgreSQL is installed and running.
    - Create a database for CareBridge.
    - Update Prisma schema (`schema.prisma`) with your database connection details.

5. **Run migrations**:

    ```bash
    npx prisma migrate dev
    ```

6. **Start the server**:
    ```bash
    npm run start
    ```

<!-- ## API Endpoints 🌐

-   **Authentication**:

    -   `/api/auth/signup`: Register a new user.
    -   `/api/auth/login`: Authenticate user and generate JWT token.

-   **Messaging**:

    -   `/api/messages`: CRUD operations for messages between doctors and patients.

-   **Appointments**:

    -   `/api/appointments`: Schedule, update, and cancel appointments.

-   **Medications**:
    -   `/api/medications`: Manage medications (upload, update, delete). -->

## Contributing 🤝

We welcome contributions! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a Pull Request.

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact 📬

If you have any questions or feedback, please reach out to us at [support@carebridgeapp.com](mailto:support@carebridgeapp.com).

---

Thank you for using CareBridge Backend! We aim to provide a robust backend solution for seamless communication and data management in your healthcare app. 🌟
