import { PrismaClient, Prisma } from "@prisma/client";

const prisma = new PrismaClient();

const patientData: Prisma.PatientCreateInput[] = [
    {
        email: "afram@gmail.com",
        password: "$2a$10$Y/9Kh8IqthzPuk1LqcDCkO8AH/L9SNwVdR0Rcm5HCeLVq2QskgKdi",
        fullname: "Afram Doe",
        profile: "https://images.unsplash.com/photo-1529688530647-93a6e1916f5f?q=80&w=2498&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        gender: "MALE",
        terms: "ACCEPTED",
    },
    {
        email: "appiah@gmail.com",
        fullname: "appiah Samuel",
        password: "$2a$10$Y/9Kh8IqthzPuk1LqcDCkO8AH/L9SNwVdR0Rcm5HCeLVq2QskgKdi",
        gender: "MALE",
        profile: "https://images.unsplash.com/photo-1531558297330-791932f4f398?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fHw%3D",
        terms: "ACCEPTED",
    },
    {
        email: "kenn@gmail.com",
        fullname: "kenn daniels",
        password: "$2a$10$Y/9Kh8IqthzPuk1LqcDCkO8AH/L9SNwVdR0Rcm5HCeLVq2QskgKdi",
        gender: "MALE",
        profile: "https://images.unsplash.com/photo-1544813813-2c73bec209ca?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fHw%3D",
        terms: "ACCEPTED",
    },

    {
        email: "Jane@gmail.com",
        fullname: "Jane Gunn",
        password: "$2a$10$Y/9Kh8IqthzPuk1LqcDCkO8AH/L9SNwVdR0Rcm5HCeLVq2QskgKdi",
        profile: "https://images.unsplash.com/photo-1523825036634-aab3cce05919?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8",
        gender: "FEMALE",
        terms: "ACCEPTED",
    },
    {
        email: "francisca@gmail.com",
        fullname: "Francisca Peace",
        password: "$2a$10$Y/9Kh8IqthzPuk1LqcDCkO8AH/L9SNwVdR0Rcm5HCeLVq2QskgKdi",
        gender: "FEMALE",
        profile: "https://images.unsplash.com/photo-1563132337-f159f484226c?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
    },
    {
        email: "abena@gmail.com",
        fullname: "Abena Daniels",
        password: "$2a$10$Y/9Kh8IqthzPuk1LqcDCkO8AH/L9SNwVdR0Rcm5HCeLVq2QskgKdi",
        gender: "FEMALE",
        profile: "https://images.unsplash.com/photo-1576363346069-e57aab1813bf?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
    },
    {
        email: "abraham@gmail.com",
        fullname: "Abraham Adams",
        password: "$2a$10$Y/9Kh8IqthzPuk1LqcDCkO8AH/L9SNwVdR0Rcm5HCeLVq2QskgKdi",
        profile: "https://images.unsplash.com/photo-1591470481729-2bcc11e3acb8?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        gender: "MALE",
        terms: "ACCEPTED",
    }
];

const specializationData: Prisma.SpecializationCreateInput[] = [
    { name: "Diagnostic radiology" },
    { name: "Dermatology" },
    { name: "Family medicine" },
    { name: "Medical genetics" },
    { name: "Allergy and Immunology" }
];

const serviceData: Prisma.ServiceCreateInput[] = [
    { name: "cardiology" },
    { name: "dentistry" },
    { name: "neurology" },
    { name: "nutrition" },
    { name: "urology" },
    { name: "gynecology and obstetrics" },
    { name: "podiatry" },
    { name: "ear, nose, and throat" }
];

const drugsData: Prisma.DrugCreateInput[] = [
    { name: "Aspirin", dosage: "10mg" },
    { name: "Ibuprofen", dosage: "15mg" },
    { name: "Acetaminophen Paracetamol", dosage: "18mg" },
    { name: "Lisinopril", dosage: "6mg" },
    { name: "Levothyroxine", dosage: "43mg" },
    { name: "Simvastatin", dosage: "30mg" },
    { name: "Metformin", dosage: "30mg" },
    { name: "Amoxicillin", dosage: "30mg" },
    { name: "Omeprazole", dosage: "30mg" },
    { name: "Albuterol", dosage: "30mg" },
];

// #===========================================================
// #    DEPENDENTS
// #===========================================================

/// DOCTOR RELIES ON SPECIALIZATION AND SERVICE
/// ADD SPECIALIZATION --> ID AND CREATE DOCTOR
/// AFTERWARDS UPDATE DOCTOR WITH SERVICE --> ID
const doctorData: Prisma.DoctorCreateInput[] = [
    {
        email: "John@gmail.com",
        fullname: "John Doe",
        profile: "https://media.istockphoto.com/id/904793412/photo/close-up-of-happy-confident-doctor-looking-away.webp?s=2048x2048&w=is&k=20&c=FfE9NUf43fmE_fN6Y9cDi5va1K_Wy6awu3rGaePNN7c=",
        prn: "123456789",
        gender: "MALE",
        terms: "ACCEPTED",
        specialization: { connect: { id: "543615cb-24b8-4640-ad9c-c17a2fb219d2" } },
        service: { connect: { id: "25595aa3-267c-4d65-8c16-749650492616" } }
    },
    {
        email: "appiah@gmail.com",
        fullname: "appiah Samuel",
        prn: "123456789",
        profile: "https://images.unsplash.com/photo-1609188076864-c35269136b09?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
        gender: "MALE",
        specialization: { connect: { id: "b7eb7bcf-82bc-479b-8375-b468e7688f62" } },
        service: { connect: { id: "25595aa3-267c-4d65-8c16-749650492616" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }
    },
    {
        email: "kenn@gmail.com",
        fullname: "kenn daniels",
        prn: "123456789",
        profile: "https://images.unsplash.com/photo-1582719471137-c3967ffb1c42?auto=format&fit=crop&q=80&w=1972&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
        gender: "MALE",
        specialization: { connect: { id: "6dbd7cc8-2a4b-4b35-b910-dc7938a1ad24" } },
        service: { connect: { id: "25595aa3-267c-4d65-8c16-749650492616" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }
    },
    {
        email: "alice@gmail.com",
        fullname: "Alice Kane",
        prn: "123456789",
        gender: "FEMALE",
        profile: "https://media.istockphoto.com/id/1061001352/photo/portrait-of-confident-senior-female-doctor-in-scrubs.jpg?s=1024x1024&w=is&k=20&c=01wPwCufXrBejFUR70cjTRGD605Yksf073V1gbFX_l4=",
        terms: "ACCEPTED",
        specialization: { connect: { id: "5ba03ecd-f93f-4753-b73d-1b4eb21c5c58" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" }  }
    },
    {
        email: "precious@gmail.com",
        fullname: "Precious Akwa",
        prn: "123456789",
        gender: "FEMALE",
        profile: "https://images.unsplash.com/photo-1666886573681-a8fbe983a3fd?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
        specialization: { connect: { id: "1562bf3f-59d9-4c54-a803-600af3c492b8" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }
    },
    {
        email: "Enock@gmail.com",
        fullname: "Enock Daniels",
        prn: "123456789",
        gender: "MALE",
        profile: "https://images.unsplash.com/photo-1666887360369-1901f341fdad?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
        specialization: { connect: { id: "543615cb-24b8-4640-ad9c-c17a2fb219d2" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }

    },
    {
        email: "Ammed@gmail.com",
        fullname: "Ammed Kenedy",
        prn: "123456789",
        gender: "MALE",
        profile: "https://media.istockphoto.com/id/1318885991/photo/african-american-doctor-in-front-of-building.jpg?s=1024x1024&w=is&k=20&c=VVf78Itela55E11W1IJp0Ys5IXtd_2ADKI4B7jHlsQ4=",
        terms: "ACCEPTED",
        specialization: { connect: { id: "b7eb7bcf-82bc-479b-8375-b468e7688f62" } },
        service: { connect: { id: "1cb495e8-f4ee-45dc-8d39-202a8b2be589" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }
    },
    {
        email: "Gyan@gmail.com",
        fullname: "Gyan stiles",
        prn: "123456789",
        gender: "MALE",
        profile: "https://images.unsplash.com/photo-1666887360742-974c8fce8e6b?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
        specialization: { connect: { id: "6dbd7cc8-2a4b-4b35-b910-dc7938a1ad24" } },
        service: { connect: { id: "1cb495e8-f4ee-45dc-8d39-202a8b2be589" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }
    },
    {
        email: "adel@gmail.com",
        fullname: "Adel gems",
        prn: "123456789",
        gender: "FEMALE",
        profile: "https://images.unsplash.com/photo-1643297654526-d78132dfd25d?auto=format&fit=crop&q=80&w=1974&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
        specialization: { connect: { id: "5ba03ecd-f93f-4753-b73d-1b4eb21c5c58" } },
        service: { connect: { id: "f3d69ec3-6263-4809-93d1-ffe82649b696" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }
    },
    {
        email: "mike@gmail.com",
        fullname: "mike daniels",
        prn: "123456789",
        gender: "MALE",
        profile: "https://images.unsplash.com/photo-1576089275954-40cd98bfcfdb?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
        specialization: { connect: { id: "1562bf3f-59d9-4c54-a803-600af3c492b8" } },
        service: { connect: { id: "787c32c3-ab4d-46e9-be3d-0cc4efc24199" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }
    },
    {
        email: "jennifer@gmail.com",
        fullname: "jennifer jens",
        prn: "123456789",
        gender: "FEMALE",
        profile: "https://images.unsplash.com/photo-1583911860331-9fd6ce32c78f?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        terms: "ACCEPTED",
        specialization: { connect: { id: "6dbd7cc8-2a4b-4b35-b910-dc7938a1ad24" } },
        service: { connect: { id: "787c32c3-ab4d-46e9-be3d-0cc4efc24199" } }
        // session: { create: { userAgent: "PostmanRuntime/7.42.0" } }
    }
];


/// MEDICAL INFO RELIES ON PATIENT ID
/// CREATE MEDICAL INFO WITH PATIENT --> ID NB:ONLY WAY
const medicalInfoData: Prisma.MedicalInfoCreateInput[] = [
    {
        "height": 8.9,
        "weight": 42.6,
        "dateOfBirth": "1990-10-01T00:10:00.000Z",
        "location": "new Hill",
        "chronicDiseaseStatus": true,
        "chronicDiseaseInfo": "1 some chronicDiseaseInfo",
        "allergiesStatus": false,
        "allergiesInfo": "",
        "medicalConditionStatus": true,
        "medicalConditionInfo": "1 some medicalConditionInfo",
        patient: { connect: { id: "27afeb5e-b486-4880-8676-784cfeea31d3" } }
    },
    {
        "height": 8.9,
        "weight": 42.6,
        "dateOfBirth": "1995-10-01T00:10:00.000Z",
        "location": "East Legon",
        "chronicDiseaseStatus": false,
        "chronicDiseaseInfo": "",
        "allergiesStatus": false,
        "allergiesInfo": "",
        "medicalConditionStatus": true,
        "medicalConditionInfo": "2 some medicalConditionInfo",
        patient: { connect: { id: "4c759da8-e6de-4b68-be84-5ac73fb26fce" } }
    },
    {
        "height": 8.9,
        "weight": 42.6,
        "dateOfBirth": "1999-10-01T00:10:00.000Z",
        "location": "Lapaz",
        "chronicDiseaseStatus": false,
        "chronicDiseaseInfo": "",
        "allergiesStatus": false,
        "allergiesInfo": "",
        "medicalConditionStatus": false,
        "medicalConditionInfo": "",
        patient: { connect: { id: "71879795-b581-4dbe-a0e3-e97ca529ec81" } }
    },
    {
        "height": 8.9,
        "weight": 42.6,
        "dateOfBirth": "2002-10-01T00:10:00.000Z",
        "location": "Dansoman",
        "chronicDiseaseStatus": true,
        "chronicDiseaseInfo": "4 some chronicDiseaseInfo",
        "allergiesStatus": false,
        "allergiesInfo": "",
        "medicalConditionStatus": false,
        "medicalConditionInfo": "",
        patient: { connect: { id: "3519dc84-6d2d-4867-b795-3a1abd8e0df2" } }
    },
    {
        "height": 8.9,
        "weight": 42.6,
        "dateOfBirth": "2020-10-01T00:10:00.000Z",
        "location": "Accra",
        "chronicDiseaseStatus": false,
        "chronicDiseaseInfo": "",
        "allergiesStatus": true,
        "allergiesInfo": "5 some allergiesInfo",
        "medicalConditionStatus": true,
        "medicalConditionInfo": "5 some medicalConditionInfo",
        patient: { connect: { id: "eb04088b-df3e-4c53-8226-a6abb53db4d5" } }
    },
];

/// APPOINTMENT RELIES ON PATIENT-ID, SERVICE-ID AND DOCTOR-ID
/// CREATE APPOINTMENT WITH PATIENT-ID, SERVICE-ID AND DOCTOR-ID
const appointmentData: Prisma.AppointmentCreateInput[] = [
    {
        complaint: "frequent sneezing",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "CHAT",
        patient: { connect: { id: "4c759da8-e6de-4b68-be84-5ac73fb26fce" } },
        service: { connect: { id: "25595aa3-267c-4d65-8c16-749650492616" } },
        doctor: { connect: { id: "c628ad61-f49a-45dd-96c8-1cb359fae495" } }
    },
    {
        complaint: "this is my complaint 2",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "VIDEO_CALL",
        patient: { connect: { id: "71879795-b581-4dbe-a0e3-e97ca529ec81" } },
        service: { connect: { id: "25595aa3-267c-4d65-8c16-749650492616" } },
        doctor: { connect: { id: "c628ad61-f49a-45dd-96c8-1cb359fae495" } }
    },
    {
        complaint: "this is my complaint 3",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "VOICE_CALL",
        patient: { connect: { id: "eb04088b-df3e-4c53-8226-a6abb53db4d5" } },
        service: { connect: { id: "25595aa3-267c-4d65-8c16-749650492616" } },
        doctor: { connect: { id: "c628ad61-f49a-45dd-96c8-1cb359fae495" } }
    },
    {
        complaint: "this is my complaint 4",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "CHAT",
        patient: { connect: { id: "3519dc84-6d2d-4867-b795-3a1abd8e0df2" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } },
        doctor: { connect: { id: "f9cd9ad9-0e53-4c1c-87f2-5eae12c27977" } }
    },
    {
        complaint: "this is my complaint 5",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "VIDEO_CALL",
        patient: { connect: { id: "8f922252-3bb9-40c6-ba76-88144ce42871" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } },
        doctor: { connect: { id: "f9cd9ad9-0e53-4c1c-87f2-5eae12c27977" } }
    },
    {
        complaint: "this is my complaint 6",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "VOICE_CALL",
        patient: { connect: { id: "4c759da8-e6de-4b68-be84-5ac73fb26fce" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } },
        doctor: { connect: { id: "f9cd9ad9-0e53-4c1c-87f2-5eae12c27977" } }
    },
    {
        complaint: "this is my complaint 7",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "VIDEO_CALL",
        patient: { connect: { id: "910118bb-8ce5-45a7-ac09-ceefab8d1ddf" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } },
        doctor: { connect: { id: "c14f183c-b496-4496-ad52-f477ee09fd21" } }
    },
    {
        complaint: "this is my complaint 8",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "VOICE_CALL",
        patient: { connect: { id: "8e12e256-c0e8-47f5-ab38-546f158d5251" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } },
        doctor: { connect: { id: "c14f183c-b496-4496-ad52-f477ee09fd21" } }
    },
    {
        complaint: "this is my complaint 9",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "CHAT",
        patient: { connect: { id: "40430787-dce2-44bd-abed-c354304d21f9" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } },
        doctor: { connect: { id: "c14f183c-b496-4496-ad52-f477ee09fd21" } }
    },
    {
        complaint: "this is my complaint 10",
        scheduledDate: "2023-10-31T10:45:00.000Z",
        medium: "VIDEO_CALL",
        patient: { connect: { id: "8f922252-3bb9-40c6-ba76-88144ce42871" } },
        service: { connect: { id: "99cbbd11-7092-4d79-83c2-ba8ee11bdb69" } },
        doctor: { connect: { id: "c14f183c-b496-4496-ad52-f477ee09fd21" } }
    },
];

/// PRESCRIPTION RELIES ON DOCTOR-ID AND PATIENT-ID
/// CREATE PRESCRIPTION WITH DOCTOR-ID AND PATIENT-ID
const prescriptionData: Prisma.PrescriptionCreateInput[] = [
    // {
    //     name: "Prescription 1",
    //     description: "Description for Prescription 1",
    //     doctor: { connect: { id: "" } },
    //     patient: { connect: { id: "" } },
    // }
];



async function main() {
    console.log(`🌱 START SEEDING ...`);

    console.log(`🌊 CLEARING THE LAND ...`);
    // await prisma.patient.deleteMany();
    // await prisma.doctor.deleteMany();
    // await prisma.administrator.deleteMany();
    // await prisma.service.deleteMany();
    // await prisma.appointment.deleteMany();
    // await prisma.session.deleteMany();
    // await prisma.specialization.deleteMany();
    // await prisma.medicalInfo.deleteMany();
    // await prisma.prescription.deleteMany();
    // await prisma.drug.deleteMany();
    console.log(`🎃 CLEARING COMPLETED ...`);

    console.log(`🌵 PATIENT SEEDING ...`);

    /** PATIENTS */
    // for (const _patient of patientData) {
    //     const patient = await prisma.patient.create({ data: _patient });
    //     console.log(`Created patient with id->: ${patient.id}`);
    // }

    console.log(`🌵 SPECIALIZATION SEEDING ...`);

    /** SPECIALIZATIONS */
    // for (const _specialization of specializationData) {
    //     const specialization = await prisma.specialization.create({
    //         data: _specialization
    //     });
    //     console.log(`Created specialization with id->: ${specialization.id}`);
    // }

    console.log(`🌵 SERVICE SEEDING ...`);

    /** SERVICES */
    // for (const _service of serviceData) {
    //     const service = await prisma.service.create({ data: _service });
    //     console.log(`Created service with name->: ${service.name}`);
    // }

    console.log(`🌵 DRUG SEEDING ...`);

    /** DRUGS */
    // for (const _drug of drugsData) {
    //     const drug = await prisma.drug.create({ data: _drug });
    //     console.log(`Created drug with name->: ${drug.name}`);
    // }

    // #===========================================================
    // #    DEPENDENTS
    // #===========================================================
    console.log(`🌵 DOCTOR SEEDING ...`);

    /** DOCTORS */
    // for (const _doctor of doctorData) {
    //     const doctor = await prisma.doctor.create({ data: _doctor });
    //     console.log(`Created doctor with id->: ${doctor.id}`);
    // }

    console.log(`🌵 MEDICALINFO SEEDING ...`);

    /** MEDICALINFOS */
    // for (const _medicalInfo of medicalInfoData) {
    //     const medicalInfo = await prisma.medicalInfo.create({ data: _medicalInfo });
    //     console.log(`Created medicalInfo with id->: ${medicalInfo.id}`);
    // }

    console.log(`🌵 APPOINTMENT SEEDING ...`);

    // /** AAPOINTMENT */
    for (const _appointment of appointmentData) {
        const appointment = await prisma.appointment.create({
            data: _appointment
        });
        console.log(`Created appointment with service id->: ${appointment.serviceId}`);
    }

    console.log(`👍🏼 SEEDIG DONE.`);
}

main()
    .then(async () => {
        await prisma.$disconnect();
    })
    .catch(async (e) => {
        console.error(e);
        await prisma.$disconnect();
        process.exit(1);
    });
