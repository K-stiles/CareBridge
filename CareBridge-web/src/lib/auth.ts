// import { API_BASE_URL, loginUrl } from "@/services/fetcher";
// import { NextAuthOptions } from "next-auth";
// import CredentialsProvider from "next-auth/providers/credentials";

// type Credentials = {
//   email: string;
//   password: string;
// };
// export const authOptions: NextAuthOptions = {
//   session: {
//     strategy: "jwt",
//   },
//   pages: {
//     signIn: "/",
//     signOut: "/",
//   },
//   providers: [
//     CredentialsProvider({
//       name: "Credentials",
//       credentials: {},
//       async authorize(credentials) {
//         const { email, password } = credentials as Credentials;

//         const requestOptions: RequestInit = {
//           method: "POST",
//           headers: {
//             "Content-Type": "application/json",
//           },
//           body: JSON.stringify({ email, password }),
//         };

//         const res = await fetch(`${API_BASE_URL}${loginUrl}`, requestOptions);
//         const user = await res.json();
//         if (res.ok && user) {
//           return user;
//         } else {
//           return null;
//         }
//       },
//     }),
//   ],
//   callbacks: {
//     async jwt({ token, user }) {
//       return { ...token, ...user };
//     },
//     async session({ token, session }) {
//       if (token && session.user) {
//         // session.user.access_token = token.access_token;
//         // session.user.id = token.id;
//         session.user = token;
//       }
//       return session;
//     },
//     redirect() {
//       return "/dashboard/home";
//     },
//   },
// };
