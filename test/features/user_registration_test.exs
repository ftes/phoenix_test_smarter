defmodule Features.UserRegistrationTest do
  use SmartWeb.ConnCase
  use PhoenixTest.Case, playwright: :chromium, headless: false, slow_mo: 500
  import PhoenixTest

  describe "register user" do
    @tag :playwright
    test "creates account, logs the user in and out and in again", %{conn: conn} do
      conn
      |> visit("/")

      # Register
      |> click_link("Register")
      |> fill_in("Email", with: "f@ftes.de")

      ## Password too short
      |> fill_in("Password", with: "short")
      |> assert_has(".text-rose-600:not(.hidden)", text: "at least 12")

      ## Success
      |> fill_in("Password", with: "password1234")
      |> submit()
      |> assert_has("#flash-info", text: "Account created")

      # Log out
      |> click_link("Log out")
      |> assert_has("#flash-info", text: "Logged out")

      # Log in
      |> click_link("Log in")
      |> fill_in("Email", with: "f@ftes.de")

      ## Wrong password
      |> fill_in("Password", with: "wrong")
      |> submit()
      |> assert_has("#flash-error", text: "Invalid")

      ## Success
      |> fill_in("Email", with: "f@ftes.de")
      |> fill_in("Password", with: "password1234")
      |> submit()
      |> assert_has("#flash-info", text: "Welcome back")
    end
  end
end
