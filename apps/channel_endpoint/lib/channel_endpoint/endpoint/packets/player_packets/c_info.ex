defmodule ChannelEndpoint.Endpoint.PlayerPackets.CInfo do
  @moduledoc """
  TODO: Documentation.
  """

  use Core.SerializableStruct

  import DatabaseService.PlayerEnums,
    only: [
      gender: 1,
      hair_style: 1,
      hair_color: 1,
      character_class: 1
    ]

  alias __MODULE__

  @enforce_keys [
    :character_id,
    :name,
    :group_id,
    :family_id,
    :family_rank,
    :family_name,
    :name_color_id,
    :gender,
    :hair_style,
    :hair_color,
    :class,
    :reputation_icon,
    :compliment,
    :morph,
    :invisible,
    :family_level,
    :morph_upgrade,
    :arena_winner
  ]
  defstruct @enforce_keys

  @type t :: %CInfo{
          character_id: pos_integer,
          name: String.t(),
          group_id: integer,
          family_id: integer,
          family_rank: atom,
          family_name: String.t(),
          name_color_id: non_neg_integer,
          gender: atom,
          hair_style: atom,
          hair_color: atom,
          class: atom,
          reputation_icon: integer,
          compliment: non_neg_integer,
          morph: non_neg_integer,
          invisible: boolean,
          family_level: non_neg_integer,
          morph_upgrade: non_neg_integer,
          arena_winner: boolean
        }

  @impl true
  def serialize(%CInfo{} = struct, _) do
    %CInfo{
      character_id: character_id,
      name: name,
      group_id: group_id,
      family_id: family_id,
      family_rank: family_rank,
      family_name: family_name,
      name_color_id: name_color_id,
      gender: gender,
      hair_style: hair_style,
      hair_color: hair_color,
      class: class,
      reputation_icon: reputation_icon,
      compliment: compliment,
      morph: morph,
      invisible: invisible,
      family_level: family_level,
      morph_upgrade: morph_upgrade,
      arena_winner: arena_winner
    } = struct

    family_i18n =
      if family_id < 0, do: "-1", else: "#{family_id}.#{i18n_family_rank(family_rank)}"

    [
      "c_info", name, "-", group_id, family_i18n, family_name, character_id,
      name_color_id, gender(gender), hair_style(hair_style), hair_color(hair_color),
      character_class(class), reputation_icon, compliment, morph, invisible,
      family_level, morph_upgrade, arena_winner
    ]
  end

  ## Private functions

  defp i18n_family_rank(:head), do: 915
  defp i18n_family_rank(:deputy), do: 916
  defp i18n_family_rank(:keeper), do: 917
  defp i18n_family_rank(:member), do: 918
end
