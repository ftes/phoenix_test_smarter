defmodule UserRegistrationTest do
  use Smart.DataCase
  use PhoenixTest.Case

  test "register", %{conn: conn} do
    conn
    |> visit("/")

    # |> click_link("Register")
    # |> open_browser()

    # Password too short
    # |> refute_has(".text-rose-600", text: "at least 12")
    # |> fill_in("Email", with: "f@ftes.de")
    # |> fill_in("Password", with: "short")
    # |> submit()
    # |> assert_has(".text-rose-600", text: "at least 12")

    # Success
    # |> fill_in("Email", with: "f@ftes.de")
    # |> fill_in("Password", with: "long_enough_now")
    # |> submit()
    # |> assert_has("#flash-info", text: "User created")
  end
end
