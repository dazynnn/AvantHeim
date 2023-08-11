defmodule ElvenPackets.Types.NsString do
  @moduledoc """
  TODO: ElvenPackets.Types.NsString
  """

  use ElvenGard.Network.Type

  @type t :: String.t()

  ## Behaviour impls

  @impl true
  @spec decode(binary(), Keyword.t()) :: {t(), binary()}
  def decode(data, _opts) when is_binary(data) do
    case String.split(data, ElvenPackets.separator(), parts: 2) do
      [string] -> {string, ""}
      [string, rest] -> {string, rest}
    end
  end

  @impl true
  @spec encode(t(), Keyword.t()) :: binary()
  def encode(data, _opts) when is_binary(data) do
    data
  end
end
