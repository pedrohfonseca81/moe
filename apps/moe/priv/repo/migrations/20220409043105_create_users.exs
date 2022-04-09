defmodule Moe.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table("users", primary_key: false) do
      add :id, :string, primary_key: true
      add :locale, :string, default: "en_US"
      add :money, :integer, default: 0

      timestamps()
    end
  end
end
