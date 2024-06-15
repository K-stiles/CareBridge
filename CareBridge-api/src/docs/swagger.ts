import swaggerJSDoc from "swagger-jsdoc";
import { Patient, Admin, Doctor } from "./schemas";

const swaggerOptions = {
    definition: {
        openapi: "3.0.0",

        /** DOCS INFO DATA */
        info: {
            title: "Purple Care API Documentation",
            version: "1.0.0",
            description: "API Doctors and their  Patients to interact/transact with ease"
        },

        /** SERVERS  */
        servers: [
            {
                url: "http://localhost:1337",
                description: "Local Server"
            },
            {
                url: "https://pcareapi.cyclic.cloud/api-docs/",
                description: "Development Server"
            },
            {
                url: "https://pcareapi.cyclic..cloud/api-docs/",
                description: "Production Server"
            }
        ],

        /** TAGS  */
        tags: [
            {
                name: "Authentication",
                description: "Client authentication routes"
            },
            {
                name: "Patients",
                description: "Routes for managing patient - related data, authentication, and patient profiles."
            },
            {
                name: "Doctors",
                description: "Routes for creating, updating, and retrieving information about patient doctors."
            },
            {
                name: "Admin",
                description: "Admin routes"
            },
            {
                name: "Appointmet",
                description: "Routes for purchasing, managing, and retrieving appointmets for doctors."
            },
            {
                name: "Specialization",
                description: "Routes related to transportation agencies and their information."
            },
            {
                name: "Service",
                description: "Managing service - related data and operations."
            },

            {
                name: "Drug",
                description: "Managing subordinate patient accounts and permissions."
            },
            {
                name: "Payment",
                description: "Payment routes"
            }
        ],

        /** COMPONENTS  */
        components: {
            securitySchemes: {
                Token: {
                    type: "token",
                    in: "header",
                    name: "authorization"
                }
            },

            /** SCHEMAS  */
            schemas: {
                Patient,
                Doctor,
                Admin
            }
        },

        /** ROUTE PATHS */
        paths: {
            "/api/v1/auth/register": {
                post: {
                    tags: ["Authentication"],
                    summary: "Patient information sent to the server for registration",
                    requestBody: {
                        content: {
                            "application/json": {
                                schema: {
                                    type: "object",
                                    properties: {
                                        patientname: {
                                            type: "string",
                                            example: "trailmail"
                                        },
                                        phone: {
                                            type: "string",
                                            example: "02445554445"
                                        },
                                        password: {
                                            type: "string",
                                            example: "password1234"
                                        }
                                    }
                                }
                            }
                        }
                    },
                    responses: {
                        "201": {
                            headers: {
                                "Set-cookie": {
                                    schema: {
                                        type: "object"
                                    },
                                    description: "contains verifiedEmail verifiedMember id role email in object of name data"
                                }
                            },
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            okay: true,
                                            status: 201,
                                            data: {
                                                verifiedEmail: false,
                                                verifiedMember: false,
                                                role: "member",
                                                id: "9a0b342a-91d3-4bf8-b200-95fff6c416fc",
                                                email: "me@gmail.com"
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        "409": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Email Already Exists"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "/api/v1/auth/otpverification": {
                post: {
                    tags: ["Authentication"],
                    summary: "Verifies patient credentials and OTP",
                    parameters: [
                        {
                            in: "query",
                            name: "patientname",
                            required: true,
                            schema: {
                                type: "string"
                            },
                            example: "trailmail"
                        },
                        {
                            in: "query",
                            name: "phone",
                            required: true,
                            schema: {
                                type: "string"
                            },
                            example: "02445554445"
                        },
                        {
                            in: "query",
                            name: "password",
                            required: true,
                            schema: {
                                type: "string",
                                format: "password"
                            },
                            example: "password1234"
                        },
                        {
                            in: "query",
                            name: "otp",
                            required: true,
                            schema: {
                                type: "string"
                            },
                            example: "123456"
                        }
                    ],
                    responses: {
                        "200": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            okay: true,
                                            status: 200,
                                            data: {
                                                token: "your_generated_token_here",
                                                patient: {
                                                    id: "9a0b342a-91d3-4bf8-b200-95fff6c416fc",
                                                    email: "me@gmail.com",
                                                    role: "member"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        "401": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Invalid credentials"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "/api/v1/auth/login": {
                post: {
                    tags: ["Authentication"],
                    summary: "Log in a patient",
                    description: "Route to login patient or admin",
                    requestBody: {
                        content: {
                            "application/json": {
                                schema: {
                                    type: "object",
                                    properties: {
                                        email: {
                                            type: "string",
                                            description: "Patient Email",
                                            example: "trail.mail@gmail.com"
                                        },
                                        password: {
                                            type: "string",
                                            description: "Patient password",
                                            example: "password1234"
                                        }
                                    }
                                }
                            }
                        }
                    },
                    responses: {
                        "409": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Patient does not exist"
                                        }
                                    }
                                }
                            }
                        },
                        "400": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Invalid Credentials"
                                        }
                                    }
                                }
                            }
                        },
                        "200": {
                            headers: {
                                "Set-cookie": {
                                    schema: {
                                        type: "object"
                                    }
                                }
                            },
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            data: {
                                                verifiedEmail: false,
                                                verifiedMember: false,
                                                role: "member",
                                                id: "9a0b342a-91d3-4bf8-b200-95fff6c416fc",
                                                email: "me@gmail.com"
                                            },
                                            access_token: "your_access_token_here"
                                        }
                                    }
                                }
                            }
                        },
                        "412": {
                            $ref: "#/components/responses/Unauthorized"
                        }
                    }
                }
            },
            "/api/v1/auth/logout": {
                get: {
                    tags: ["Authentication"],
                    summary: "Log out a patient",
                    description: "Route to logout patient or admin",
                    responses: {
                        "200": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            message: "Logout successful"
                                        }
                                    }
                                }
                            }
                        },
                        "401": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Unauthorized"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "/api/v1/patients": {
                get: {
                    summary: "Returns the list of all the patients",
                    tags: ["Patients"],
                    responses: {
                        "200": {
                            description: "The list of all the patients",
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "array",
                                        items: {
                                            $ref: "#/components/schemas/Patient"
                                        }
                                    }
                                }
                            }
                        },
                        "500": {
                            description: "No patient was found"
                        },
                        "404": {
                            description: "Error occurred"
                        }
                    }
                }
            },
            "/api/v1/patients/{id}": {
                get: {
                    summary: "Get a patient by id",
                    tags: ["Patients"],
                    parameters: [
                        {
                            in: "path",
                            name: "id",
                            schema: {
                                type: "string"
                            },
                            required: true,
                            description: "The patient id"
                        }
                    ],
                    responses: {
                        "200": {
                            description: "The patient details by id",
                            content: {
                                "application/json": {
                                    schema: {
                                        $ref: "#/components/schemas/Patient"
                                    }
                                }
                            }
                        },
                        "500": {
                            description: "Patient does not exist"
                        },
                        "404": {
                            description: "Error occurred"
                        }
                    }
                },
                put: {
                    summary: "Update a Patient",
                    tags: ["Patients"],
                    parameters: [
                        {
                            in: "path",
                            name: "id",
                            schema: {
                                type: "string"
                            },
                            required: true,
                            description: "The patient id"
                        }
                    ],
                    requestBody: {
                        required: true,
                        content: {
                            "application/json": {
                                schema: {
                                    example: {
                                        patientname: "Abednego",
                                        phone: "0247157301"
                                    }
                                }
                            }
                        }
                    },
                    responses: {
                        "200": {
                            description: "Successfully updated the patient",
                            content: {
                                "application/json": {
                                    schema: {
                                        $ref: "#/components/schemas/Patient"
                                    }
                                }
                            }
                        },
                        "404": {
                            description: "Error occurred"
                        }
                    }
                },
                delete: {
                    summary: "Delete a Patient",
                    tags: ["Patients"],
                    parameters: [
                        {
                            in: "path",
                            name: "id",
                            schema: {
                                type: "string"
                            },
                            required: true,
                            description: "The patient id"
                        }
                    ],
                    responses: {
                        "200": {
                            description: "Patient account has been successfully deleted",
                            content: {
                                "application/json": {
                                    schema: {
                                        $ref: "#/components/schemas/Patient"
                                    }
                                }
                            }
                        },
                        "404": {
                            description: "Error occurred"
                        }
                    }
                }
            },
            "/api/v1/doctors": {
                post: {
                    summary: "Create a new trip",
                    tags: ["Doctors"],
                    requestBody: {
                        required: true,
                        content: {
                            "application/json": {
                                schema: {
                                    example: {
                                        destinationRegion: "Greater Accra",
                                        arrivalRegion: "Northern",
                                        destination: "Accra",
                                        arrival: "Tamale",
                                        departureDate: "8 Nov. 2022",
                                        arrivalDate: "8 Nov. 2022",
                                        departureTime: "7:00 am",
                                        arrivalTime: "8:00 pm",
                                        duration: "10 hr 41 min",
                                        distance: "613.2 km"
                                    }
                                }
                            }
                        }
                    },
                    responses: {
                        "200": {
                            description: "The trip was successfully created",
                            content: {
                                "application/json": {
                                    schema: {
                                        $ref: "#/components/schemas/Trip"
                                    }
                                }
                            }
                        },
                        "500": {
                            description: "Error occurred"
                        }
                    }
                },
                get: {
                    summary: "Returns the list of all the doctors",
                    tags: ["Doctors"],
                    responses: {
                        "200": {
                            description: "The list of all the doctors",
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "array",
                                        items: {
                                            $ref: "#/components/schemas/Trip"
                                        }
                                    }
                                }
                            }
                        },
                        "500": {
                            description: "No Trip was found"
                        },
                        "404": {
                            description: "Error occurred"
                        }
                    }
                }
            },
            "/api/v1/doctors/{id}": {
                get: {
                    summary: "Get a trip by id",
                    tags: ["Doctors"],
                    parameters: [
                        {
                            in: "path",
                            name: "id",
                            schema: {
                                type: "string"
                            },
                            required: true,
                            description: "The trip id"
                        }
                    ],
                    responses: {
                        "200": {
                            description: "The trip details by id",
                            content: {
                                "application/json": {
                                    schema: {
                                        $ref: "#/components/schemas/Trip"
                                    }
                                }
                            }
                        },
                        "500": {
                            description: "Trip does not exist"
                        },
                        "404": {
                            description: "Error occurred"
                        }
                    }
                },
                put: {
                    summary: "Update a trip",
                    tags: ["Doctors"],
                    parameters: [
                        {
                            in: "path",
                            name: "id",
                            schema: {
                                type: "string"
                            },
                            required: true,
                            description: "The trip id"
                        }
                    ],
                    requestBody: {
                        required: true,
                        content: {
                            "application/json": {
                                schema: {
                                    example: {
                                        destinationRegion: "Greater Accra",
                                        arrivalRegion: "Northern",
                                        destination: "Accra",
                                        arrival: "Tamale",
                                        departureDate: "8 Nov. 2022",
                                        arrivalDate: "8 Nov. 2022",
                                        departureTime: "7:00 am",
                                        arrivalTime: "8:00 pm",
                                        duration: "10 hr 41 min",
                                        distance: "613.2 km"
                                    }
                                }
                            }
                        }
                    },
                    responses: {
                        "200": {
                            description: "Successfully updated the trip",
                            content: {
                                "application/json": {
                                    schema: {
                                        $ref: "#/components/schemas/Trip"
                                    }
                                }
                            }
                        },
                        "404": {
                            description: "Error occurred"
                        }
                    }
                },
                delete: {
                    summary: "Delete a trip",
                    tags: ["Doctors"],
                    parameters: [
                        {
                            in: "path",
                            name: "id",
                            schema: {
                                type: "string"
                            },
                            required: true,
                            description: "The trip id"
                        }
                    ],
                    responses: {
                        "200": {
                            description: "Trip successfully deleted"
                        },
                        "404": {
                            description: "Error occurred"
                        }
                    }
                }
            },
            "/api/v1/admin/register": {
                post: {
                    tags: ["Authentication"],
                    summary: "Create an admin account",
                    requestBody: {
                        content: {
                            "application/json": {
                                schema: {
                                    type: "object",
                                    required: ["patientname", "email", "phone", "password"],
                                    properties: {
                                        patientname: { type: "string", example: "admin123" },
                                        email: { type: "string", example: "admin@example.com" },
                                        phone: { type: "string", example: "123-456-7890" },
                                        password: { type: "string", example: "password1234" },
                                        id: { type: "string", example: "1" },
                                        profile: { type: "string", example: "https://example.com/admin-profile.jpg" },
                                        roles: { type: "integer", example: 1 }
                                    }
                                }
                            }
                        }
                    },
                    responses: {
                        "201": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            message: "Admin account created successfully"
                                        }
                                    }
                                }
                            }
                        },
                        "400": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Invalid input"
                                        }
                                    }
                                }
                            }
                        },
                        "409": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Admin account already exists"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "/api/v1/admin/login": {
                post: {
                    tags: ["Authentication"],
                    summary: "Login as an admin",
                    requestBody: {
                        content: {
                            "application/json": {
                                schema: {
                                    type: "object",
                                    required: ["email", "password"],
                                    properties: {
                                        email: { type: "string", example: "admin@example.com" },
                                        password: { type: "string", example: "password1234" }
                                    }
                                }
                            }
                        }
                    },
                    responses: {
                        "200": {
                            headers: {
                                "Set-cookie": {
                                    schema: {
                                        type: "object"
                                    },
                                    description: "contains verifiedEmail verifiedMember id role email in object of name data"
                                }
                            },
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            data: {
                                                verifiedEmail: false,
                                                verifiedMember: false,
                                                role: "admin",
                                                id: "9a0b342a-91d3-4bf8-b200-95fff6c416fc",
                                                email: "admin@example.com"
                                            },
                                            access_token: ""
                                        }
                                    }
                                }
                            }
                        },
                        "401": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Unauthorized"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "/api/v1/admin/": {
                get: {
                    tags: ["Admin"],
                    summary: "Get all admin accounts",
                    responses: {
                        "200": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "array",
                                        items: {
                                            type: "object",
                                            properties: {
                                                id: { type: "string", example: "1" },
                                                patientname: { type: "string", example: "admin123" },
                                                email: { type: "string", example: "admin@example.com" },
                                                phone: { type: "string", example: "123-456-7890" },
                                                profile: { type: "string", example: "https://example.com/admin-profile.jpg" },
                                                roles: { type: "integer", example: 1 }
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        "401": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Unauthorized"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "/api/v1/admin/{id}": {
                get: {
                    tags: ["Admin"],
                    summary: "Get an admin account by ID",
                    parameters: [
                        {
                            in: "query",
                            name: "id",
                            required: true,
                            schema: {
                                type: "string"
                            },
                            example: "1"
                        }
                    ],
                    responses: {
                        "200": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        properties: {
                                            id: { type: "string", example: "1" },
                                            patientname: { type: "string", example: "admin123" },
                                            email: { type: "string", example: "admin@example.com" },
                                            phone: { type: "string", example: "123-456-7890" },
                                            profile: { type: "string", example: "https://example.com/admin-profile.jpg" },
                                            roles: { type: "integer", example: 1 }
                                        }
                                    }
                                }
                            }
                        },
                        "401": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Unauthorized"
                                        }
                                    }
                                }
                            }
                        },
                        "404": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Admin not found"
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                put: {
                    tags: ["Admin"],
                    summary: "Update an admin account by ID",
                    parameters: [
                        {
                            in: "path",
                            name: "id",
                            required: true,
                            schema: {
                                type: "string"
                            },
                            example: "1"
                        },
                        {
                            in: "query",
                            name: "patientname",
                            schema: {
                                type: "string"
                            },
                            example: "new_admin123"
                        },
                        {
                            in: "query",
                            name: "email",
                            schema: {
                                type: "string"
                            },
                            example: "new_admin@example.com"
                        },
                        {
                            in: "query",
                            name: "phone",
                            schema: {
                                type: "string"
                            },
                            example: "987-654-3210"
                        },
                        {
                            in: "query",
                            name: "profile",
                            schema: {
                                type: "string"
                            },
                            example: "https://example.com/new-admin-profile.jpg"
                        },
                        {
                            in: "query",
                            name: "roles",
                            schema: {
                                type: "integer"
                            },
                            example: 2
                        }
                    ],
                    responses: {
                        "200": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            message: "Admin account updated successfully"
                                        }
                                    }
                                }
                            }
                        },
                        "401": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Unauthorized"
                                        }
                                    }
                                }
                            }
                        },
                        "404": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Admin not found"
                                        }
                                    }
                                }
                            }
                        },
                        "409": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Patientname or email already in use"
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                delete: {
                    summary: "Delete an admin account by ID",
                    tags: ["Admin"],
                    parameters: [
                        {
                            in: "path",
                            name: "id",
                            required: true,
                            schema: {
                                type: "string"
                            },
                            example: "1"
                        }
                    ],
                    responses: {
                        "200": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            message: "Admin account deleted successfully"
                                        }
                                    }
                                }
                            }
                        },
                        "401": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Unauthorized"
                                        }
                                    }
                                }
                            }
                        },
                        "404": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Admin not found"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "/api/v1/admin/logout": {
                post: {
                    tags: ["Authentication"],
                    summary: "Logout as a admin",
                    requestBody: {
                        content: {
                            "application/json": {
                                schema: {
                                    type: "object",
                                    required: ["email", "password"],
                                    properties: {
                                        email: {
                                            type: "string",
                                            example: "admin@example.com"
                                        },
                                        password: {
                                            type: "string",
                                            example: "password1234"
                                        }
                                    }
                                }
                            }
                        }
                    },
                    responses: {
                        "200": {
                            headers: {
                                "Set-cookie": {
                                    schema: {
                                        type: "object"
                                    }
                                }
                            },
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            data: {
                                                verifiedEmail: false,
                                                verifiedMember: false,
                                                role: "admin",
                                                id: "9a0b342a-91d3-4bf8-b200-95fff6c416fc",
                                                email: "admin@example.com"
                                            },
                                            access_token: ""
                                        }
                                    }
                                }
                            }
                        },
                        "401": {
                            content: {
                                "application/json": {
                                    schema: {
                                        type: "object",
                                        example: {
                                            err: "Unauthorized"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    apis: ["./docs/paths/*.ts"]
};

export const specs = swaggerJSDoc(swaggerOptions);
