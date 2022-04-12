defmodule Moe.Commands.Money do
  @behaviour Moe.Command

  alias Moe.Command
  alias Nostrum.Api

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "Command to check your balance."
    }
  end

  @impl Command
  def command(interaction, user) do
    Api.create_interaction_response(interaction, %{
      type: 4,
      data: %{
        content:
          Gettext.gettext(
            Moe.Gettext,
            "Your balance: %{money}.",
            money: user.money
          )
      }
    })
  end
end
