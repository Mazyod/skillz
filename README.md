# Skillz

This library uses `erlport` to launch a python process that exposes the trueskill python library to Elixir. It is severely lacking, but the basics are in place.

#### What's Next?

Exposing more of the trueskill APIs to the Elixir side.

#### The Road to v1.0.0

In case someone is inteseted in helping out, here are some tasks!

+ [ ] Run `pip install --target=./trueskill/ trueskill` as part of the build process, instead of us checking in the python code.
+ [ ] Add docs highlighting the usage of the `TrueSkill` module. *(Hint: it's just a GenServer)*
+ [ ] Publish to Hex.
+ [ ] Some Artwork would be nice :star:.

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

