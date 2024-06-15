/** PATIENT SCHEMA  */
export const Patient = {
    type: "object",
    required: ["phone"],
    properties: {
        id: {
            type: "string",
            description: "Auto-generated id of the patient"
        },
        phone: {
            type: "string",
            description: "The phone number of the patient"
        },
        patientname: {
            type: "string",
            description: "patientname of the patient"
        },
        isVerifies: {
            type: "boolean",
            description: "The verification status of the patient"
        },
        profile: {
            type: "string",
            description: "The patient's profile picture url"
        }
    },
    example: {
        id: "6365043491f58b9b00a593b6",
        phone: "233055323456",
        patientname: "Jane  Doe",
        isVerified: true,
        profile: "https://dwbshjbds.com/bedhsvjb"
    }
};

/** DOCTOR SCHEMA  */
export const Doctor = {
    type: "object",
    required: ["phone"],
    properties: {
        id: {
            type: "string",
            description: "Auto-generated id of the patient"
        },
        phone: {
            type: "string",
            description: "The phone number of the patient"
        },
        patientname: {
            type: "string",
            description: "patientname of the patient"
        },
        isVerifies: {
            type: "boolean",
            description: "The verification status of the patient"
        },
        profile: {
            type: "string",
            description: "The patient's profile picture url"
        }
    },
    example: {
        id: "6365043491f58b9b00a593b6",
        phone: "233055323456",
        patientname: "Jane  Doe",
        isVerified: true,
        profile: "https://dwbshjbds.com/bedhsvjb"
    }
};

/** ADMIN SCHEMA  */
export const Admin = {
    type: "object",
    properties: {
        id: {
            type: "string",
            description: "Auto-generated id for the admin"
        },
        patientname: {
            type: "string",
            description: "Admin patientname"
        },
        email: {
            type: "string",
            description: "Admin email"
        },
        phone: {
            type: "string",
            description: "Admin contact number"
        },
        profile: {
            type: "string",
            description: "The admin's profile picture url"
        },
        roles: {
            type: "number",
            description: "The admin's roles"
        }
    },
    example: {
        id: "1",
        patientname: "admin123",
        email: "admin@example.com",
        phone: "123-456-7890",
        profile: "https://example.com/admin-profile.jpg",
        roles: 1
    }
};
