defmodule Moe.Commands.Help do
  @behaviour Moe.Command

  alias Moe.Command
  alias Nostrum.Api
  alias Nostrum.Struct.Embed
  alias Nostrum.Struct.Embed.Field

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "Command to check all available commands."
    }
  end

  @impl Command
  def command(interaction, _user) do
    commands =
      for {name, command} <- Moe.Commands.commands(),
          do: %Field{name: name, value: command.spec(name).description}

    embed = %Embed{
      title: "Commands",
      fields: commands
    }

    Api.create_interaction_response(interaction, %{
      type: 4,
      data: %{embeds: [embed]}
    })
  end
end
