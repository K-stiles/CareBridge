import { createSlice } from "@reduxjs/toolkit";

const initialState = { openned: false, mobile: true };

const sidebarSlice = createSlice({
  name: "sidebar",
  initialState,
  reducers: {
    openSide: (state) => {
      state.openned = !state.openned;
    },
    toggleSidebar: (state) => {
      state.mobile = !state.mobile;
    },
  },
});

export const { openSide, toggleSidebar } = sidebarSlice.actions;

export default sidebarSlice.reducer;
