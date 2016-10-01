# Skillz

This library uses `erlport` to launch a python process that exposes the trueskill python library to Elixir. It is severely lacking, but the basics are in place.

#### What's Next?

Exposing more of the trueskill APIs to the Elixir side.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `skillz` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:skillz, "~> 0.2.0"}]
    end
    ```

  2. Ensure `skillz` is started before your application:

    ```elixir
    def application do
      [applications: [:skillz]]
    end
    ```

