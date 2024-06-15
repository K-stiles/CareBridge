import { API_BASE_URL, loginUrl } from "@/services/fetcher";
import { NextAuthOptions } from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";

export const authOptions: NextAuthOptions = {
  session: {
    strategy: "jwt",
  },
  pages: {
    signIn: "/",
    signOut: "/",
  },
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {},
      async authorize(credentials) {
        const { email, password } = credentials as {
          email: string;
          password: string;
        };

        const requestOptions: RequestInit = {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ email, password }),
        };

        const res = await fetch(`${API_BASE_URL}${loginUrl}`, requestOptions);
        const user = await res.json();
        if (res.ok && user) {
          return user;
        } else {
          return null;
        }
      },
    }),
  ],
  callbacks: {
    async session({ token, session }) {
      // console.log("token: ", token);
      session.user = token;
      return session;
    },
    async jwt({ token, user }) {
      return { ...token, ...user };
    },
    redirect() {
      return "/dashboard";
    },
  },
};
