defmodule Moe.Command do
  alias Nostrum.Struct.Interaction

  @callback spec(String.t()) :: any()
  @callback command(Interaction.t(), any()) :: any()

  def get_option(interaction, name) do
    interaction.data.options |> Enum.find(fn data -> data.name == name end)
  end
end
