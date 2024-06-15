// import { createSlice } from "@reduxjs/toolkit";
// import type { PayloadAction } from "@reduxjs/toolkit";
// import { RootState } from "@/store";

// export const USER_TOKEN: Access_token = "user-token";
// export const USER_ID: UserId = "userId";

// const initialState: AuthState = {
//   loading: false,
//   error: null,
//   user: null,
//   token:
//     (typeof localStorage !== "undefined" && localStorage.getItem(USER_TOKEN)) ||
//     "",
//   userId:
//     (typeof localStorage !== "undefined" && localStorage.getItem(USER_ID)) ||
//     "",
// };

// const userSlice = createSlice({
//   name: "user",
//   initialState,
//   reducers: {
//     getUser: (state, action: PayloadAction<User>) => {
//       state.user = action.payload;
//     },
//     getToken_Id: (state, action: PayloadAction<Token_Id>) => {
//       state.userId = action.payload.id;
//       state.token = action.payload.access_token;
//       localStorage.setItem(USER_TOKEN, action.payload.access_token);
//       localStorage.setItem(USER_ID, action.payload.id);
//     },
//     getUserRequest: (state): void => {
//       state.loading = true;
//       state.error = null;
//     },
//     getUserSuccess: (state, action: PayloadAction<GetUserSuccessPayload>) => {
//       state.loading = false;
//       state.user = action.payload;
//     },
//     getUserFailure: (state, action: PayloadAction<GetUserFailurePayload>) => {
//       state.loading = false;
//       state.error = action.payload;
//     },
//     updateUserRequest: (state) => {
//       state.loading = true;
//       state.error = null;
//     },
//     updateUserSuccess: (
//       state,
//       action: PayloadAction<UpdateUserSuccessPayload>
//     ) => {
//       state.loading = false;
//       state.user = action.payload;
//     },
//     updateUserFailure: (
//       state,
//       action: PayloadAction<UpdateUserFailurePayload>
//     ) => {
//       state.loading = false;
//       state.error = action.payload;
//     },
//     logout: (state) => {
//       state.user = null;
//       state.token = "";
//       state.userId = "";
//       typeof localStorage !== "undefined" &&
//         localStorage.removeItem(USER_TOKEN);
//       typeof localStorage !== "undefined" && localStorage.removeItem(USER_ID);
//     },
//   },
// });

// export const loginLoading = (state: RootState) => state.auth.loading;
// export const loginError = (state: RootState) => state.auth.error;
// export const getCurrentUser = (state: RootState) => state.auth.user;
// export const getToken = (state: RootState) => state.auth.token;
// export const getID = (state: RootState) => state.auth.userId;

// export const {
//   getUser,
//   getToken_Id,
//   getUserRequest,
//   getUserSuccess,
//   getUserFailure,
//   logout,
// } = userSlice.actions;

// export default userSlice.reducer;
