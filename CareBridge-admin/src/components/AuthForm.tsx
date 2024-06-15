"use client";
import { FC } from "react";
import { SubmitHandler, useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { signIn } from "next-auth/react";

import Button from "@/ui/Button";
import { auth, authSchema } from "@/models/auth";
import AuthInput from "@/ui/AuthInput";
import { useRouter } from "next/navigation";

const AuthForm: FC<any> = ({}) => {
  const router = useRouter();
  const {
    register,
    handleSubmit,
    formState: { errors, isDirty, isSubmitting, isValid },
  } = useForm<auth>({
    defaultValues: {
      email: "",
      password: "",
    },
    resolver: zodResolver(authSchema),
    mode: "all",
  });

  const onSubmit: SubmitHandler<auth> = async (cred: auth) => {
    // await signIn("credentials", {
    //   email: cred.email,
    //   password: cred.password,
    // });
    router.push("/dashboard");
  };

  return (
    <form
      onSubmit={handleSubmit(onSubmit)}
      noValidate
      className="rounded-md w-full"
    >
      <AuthInput
        label={"email"}
        placeholder={"your@email.com"}
        register={{ ...register("email") }}
        errors={errors.email}
        isValid={isValid}
      />
      <AuthInput
        label={"password"}
        placeholder={"password"}
        register={{ ...register("password") }}
        errors={errors.password}
        className=""
        isValid={isValid}
      />
      <Button
        type="submit"
        className="w-full h-[55px]"
        disabled={!isDirty || !isValid || isSubmitting}
        isloading={isSubmitting}
      >
        submit
      </Button>
    </form>
  );
};

export default AuthForm;
