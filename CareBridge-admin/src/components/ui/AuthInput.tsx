"use client";
import { FC } from "react";
import {
  FieldError,
  UseFormRegister,
  UseFormRegisterReturn,
} from "react-hook-form";
import { auth } from "@/models/auth";
import { cn } from "@/lib/utils";

interface AuthInputProps extends React.InputHTMLAttributes<HTMLInputElement> {
  errors?: FieldError;
  label: string;
  placeholder?: string;
  register:
    | UseFormRegisterReturn<"email">
    | UseFormRegisterReturn<"password">
    | UseFormRegister<auth>;
  isValid: boolean;
}

const AuthInput: FC<AuthInputProps> = ({
  label,
  placeholder = "",
  register,
  errors,
  isValid = false,
  className,
  ...props
}) => {
  return (
    <div className="mb-4">
      <label
        htmlFor={label}
        className="text-xs font-normal text-black-200 ml-1 mb-2 block"
      >
        {label}
      </label>
      <div
        className={`flex items-center gap-1 rounded-xl border-2 bg-slate-100 ${
          errors?.message ? "border-red-400" : "border-black-500"
        } ${
          isValid ? "border-primary/50" : "border-black-500"
        } h-[55px] w-full p-2`}
      >
        {/* <Icons.Mail className="ml-2 text-black-500" /> */}
        <input
          type={label}
          id={label}
          placeholder={placeholder}
          {...props}
          {...register}
          className={cn(
            `block h-full w-full text-xs text-slate-600 focus:outline-none placeholder-slate-500 px-1 rounded auto ${className} bg-transparent`
          )}
        />
      </div>

      {/* Form Error States */}
      {errors && (
        <div className="flex gap-2 my-1">
          {/* <Icons.AlertTriangle size={16} className="text-xs text-red-400" /> */}
          <p className="text-xs text-left text-red-400">{errors.message}</p>
        </div>
      )}
    </div>
  );
};

export default AuthInput;
