import { z } from "zod";

export const authSchema = z.object({
  email: z
    .string()
    .trim()
    .nonempty("Email field is require")
    .email("Invalid Email Format"),

  password: z
    .string()
    .trim()
    .nonempty("Password field is require")
    .min(6, { message: "Password should be atleast 6 characters long" }),
});

export type auth = z.infer<typeof authSchema>;
