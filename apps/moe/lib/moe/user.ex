defmodule Moe.User do
  use Ecto.Schema
  alias Ecto.Changeset

  @permitted [:id]

  @primary_key {:id, :string, []}

  schema "users" do
    field(:money, :integer)
    field(:locale, :string)

    timestamps()
  end

  def changeset(params \\ %{}) do
    %__MODULE__{}
    |> Changeset.cast(params, @permitted)
    |> Changeset.validate_required(@permitted)
  end
end
