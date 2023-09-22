defmodule GameService.StaticMapPartition do
  @moduledoc """
  TODO: Documentation for GameService.StaticMapPartition
  """

  use ElvenGard.ECS.Topology.Partition

  require Logger

  # Partition behaviour

  @impl true
  def setup(opts) do
    id = opts[:id] || raise ArgumentError, ":id option is require for a map"

    Logger.debug("StaticMapPartition id: #{id} is starting...")

    # Run system 60 per seconds (60Hz)
    interval = trunc(1 / 60 * 1000)

    {id, systems: systems(), interval: interval}
  end

  # Private functions

  defp systems() do
    [
      GameService.EntityVisibilitySystem,
      GameService.EntityMapActionsSystem
    ]
  end
end
