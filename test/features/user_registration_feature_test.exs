defmodule Features.UserRegistrationTest do
  use SmartWeb.ConnCase, async: true
  import PhoenixTest

  describe "register user" do
    test "creates account, logs the user in and out and in again", %{conn: conn} do
      conn
      |> visit("/")

      # Register
      |> click_link("Register")
      |> fill_in("Email", with: "f@ftes.de")
      |> fill_in("Password", with: "password1234")
      |> submit()
      |> assert_has("#flash-info", text: "User created")

      # Log out
      |> click_link("Log out")
      |> assert_has("#flash-info", text: "Logged out")

      # Log in
      |> click_link("Log in")
      |> fill_in("Email", with: "f@ftes.de")
      |> fill_in("Email", with: "f@ftes.de")
      |> fill_in("Password", with: "password1234")
      |> submit()
      |> assert_has("#flash-info", text: "Welcome back")
    end
  end
end
