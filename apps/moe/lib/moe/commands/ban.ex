defmodule Moe.Commands.Ban do
  @behaviour Moe.Command

  alias Moe.Command
  alias Nostrum.Api

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "Ban a member",
      options: [
        %{
          type: 6,
          name: "user",
          description: "User",
          required: true
        }
      ]
    }
  end

  @impl Command
  def command(interaction, _user) do
    %{value: user} = interaction |> Command.get_option("user")

    case Api.create_guild_ban(interaction.guild_id, user, 0) do
      {:ok} ->
        Api.create_interaction_response(interaction, %{
          type: 4,
          data: %{content: "Sucesso!"}
        })

      {:error, _reason} ->
        Api.create_interaction_response(interaction, %{
          type: 4,
          data: %{
            content:
              Gettext.gettext(
                Moe.Gettext,
                "Missing permissions."
              )
          }
        })
    end
  end
end
