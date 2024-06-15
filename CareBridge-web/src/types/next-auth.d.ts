/* eslint-disable no-unused-vars */

import { DefaultSession, DefaultUser } from "next-auth";

interface UserData {
  id: string;
  email: string;
  firstname: string;
  lastname: string;
  profile: string;
}

interface IUser extends DefaultUser {
  data: UserData;
  access_token: string;
}

declare module "next-auth" {
  interface User extends IUser {}
  interface Session {
    user?: User;
  }
}

declare module "next-auth/jwt" {
  interface JWT extends IUser {}
}
