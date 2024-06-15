/**
 * @swagger
 * tags:
 *  name: Patients
 *  description: The patients managing API
 */

/**
 * @swagger
 * /api/patients:
 *    get:
 *      summary: Returns the list of all the patients
 *      tags:
 *          - "Patients"
 *      responses:
 *        200:
 *          description: The list of all the patients
 *          content:
 *            application/json:
 *              schema:
 *                type : array
 *                items:
 *                  $ref: '#/components/schemas/Patient'
 *        500:
 *          description: No patient was found
 *        404:
 *          description: Error occurred
 */

/**
 * @swagger
 * /api/patients/{id}:
 *   get:
 *     summary: Get a patient by id
 *     tags: [Patients]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: The patient id
 *     responses:
 *      200:
 *          description: The patient details by id
 *          content:
 *            application/json:
 *              schema:
 *                $ref: '#/components/schemas/Patient'
 *      500:
 *        description: Patient does not exist
 *      404:
 *        description: Error ocurred
 *
 *
 *
 */

/**
 * @swagger
 * /api/patients/{id}:
 *   put:
 *     summary: Update a Patient
 *     tags: [Patients]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: The patient id
 *     requestBody:
 *      required: true
 *      content:
 *            application/json:
 *              schema:
 *                example:
 *                  patientname: Abednego
 *                  phone: "0247157301"
 *     responses:
 *      200:
 *          description: Successfully updated the patient
 *          content:
 *            application/json:
 *              schema:
 *                $ref: '#/components/schemas/Patient'
 *      404:
 *        description: Error ocurred
 */

/**
 * @swagger
 * /api/patients/{id}:
 *   delete:
 *     summary: Delete a Patient
 *     tags: [Patients]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: The patient id
 *     responses:
 *      200:
 *          description: Patient account has been successfully deleted
 *          content:
 *            application/json:
 *              schema:
 *                $ref: '#/components/schemas/Patient'
 *      404:
 *        description: Error ocurred
 *
 */
