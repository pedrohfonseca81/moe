defmodule Moe.Commands do
  def commands do
    %{
      "ban" => Moe.Commands.Ban,
      "help" => Moe.Commands.Help
    }
  end

  def register_slash_commands() do
    commands_spec = for {name, command} <- commands(), do: command.spec(name)

    Nostrum.Api.bulk_overwrite_guild_application_commands(962_099_995_371_270_196, commands_spec)
  end

  def handle_command_interaction(interaction, user) do
    command_names = commands() |> Enum.map(fn {name, _} -> name end)

    name = interaction.data.name

    if(name in command_names) do
      commands()[name].command(interaction, user)
    end
  end
end
