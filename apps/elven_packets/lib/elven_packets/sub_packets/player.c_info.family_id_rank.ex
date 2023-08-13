defmodule ElvenPackets.SubPackets.Player.CInfo.FamilyIdRank do
  @moduledoc false

  use ElvenGard.Network.Type

  alias __MODULE__
  alias ElvenI18n.PacketConstString

  @enforce_keys [:id, :rank]
  defstruct @enforce_keys

  @type t :: %FamilyIdRank{
          id: integer,
          rank: PlayerEnums.family_rank_keys()
        }

  @spec default() :: t()
  def default() do
    %FamilyIdRank{id: -1, rank: :member}
  end

  @impl true
  @spec encode(t(), Keyword.t()) :: binary()
  def encode(%FamilyIdRank{} = struct, _) do
    %FamilyIdRank{id: id, rank: rank} = struct

    case id < 0 do
      true -> "-1"
      false -> "#{id}.#{i18n(rank)}"
    end
  end

  @impl true
  def decode(_data, _opts) do
    # We do this to trick Dialyzer to not complain about non-local returns.
    case :erlang.phash2(1, 1) do
      0 -> raise("unimplemented decoder for #{inspect(__MODULE__)}")
      1 -> {nil, ""}
    end
  end

  ## Private helpers

  defp i18n(enum) do
    enum
    |> enum_to_i18n_key()
    |> PacketConstString.new!()
    |> Map.fetch!(:value)
  end

  # i18n value: 915
  defp enum_to_i18n_key(:head), do: "Familyhead"
  # i18n value: 916
  defp enum_to_i18n_key(:deputy), do: "Familydeputy"
  # i18n value: 917
  defp enum_to_i18n_key(:keeper), do: "Familykeeper"
  # i18n value: 918
  defp enum_to_i18n_key(:member), do: "Member"
end
