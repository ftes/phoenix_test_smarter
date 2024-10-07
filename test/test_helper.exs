ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Smart.Repo, :manual)

Application.put_env(:phoenix_test, :base_url, SmartWeb.Endpoint.url())
