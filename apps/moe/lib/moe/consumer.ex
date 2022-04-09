defmodule Moe.Consumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  alias Moe.Commands
  alias Moe.User
  alias Moe.Repo

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:READY, _data, _ws_state}) do
    Commands.register_slash_commands()
  end

  def handle_event({:INTERACTION_CREATE, interaction, _ws_state}) do
    user = Repo.get(User, interaction.user.id |> Integer.to_string())

    case user do
      %User{} ->
        Gettext.put_locale(Moe.Gettext, user.locale)

        Commands.handle_command_interaction(interaction, user)

      nil ->
        changeset =
          User.changeset(%{
            id: interaction.user.id |> Integer.to_string()
          })

        Repo.insert(changeset)

        Api.create_interaction_response(interaction, %{
          type: 4,
          data: %{content: "Registering you in the db. Run this command again, please."}
        })
    end
  end

  def handle_event(_event), do: :noop
end
