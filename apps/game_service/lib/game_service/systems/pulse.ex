defmodule GameService.PulseSystem do
  @moduledoc """
  TODO: Documentation for GameService.PulseSystem

  TL;DR; Update the PulseComponent for a Player and send a disconnection 
  event to everyone who doesn't send his pulse

  TODO: Maybe later optimize this System to run only once per second if taking too much CPU 
  """

  use GameService.System,
    lock_components: [GameService.PlayerComponents.PulseComponent],
    event_subscriptions: [GameService.Events.PlayerPulse]

  require Logger

  alias GameService.Events.PlayerPulse

  @inc_sec 60
  @inc_ms :timer.seconds(@inc_sec)
  @delta :timer.seconds(5)

  # System behaviour

  @impl true
  def run(_context) do
    expire = ElvenGard.ECS.now() - @inc_ms - @delta

    endpoints =
      P.EndpointComponent
      |> Query.select(with: [{P.PulseComponent, [{:<, :last_time, expire}]}])
      |> Query.all()

    case endpoints do
      [] -> :ok
      _ -> GameService.broadcast_to({:invalid_pulse, :expired}, endpoints)
    end
  end

  @impl true
  def run(%PlayerPulse{} = event, _context) do
    %PlayerPulse{
      entity_type: entity_type,
      entity_id: entity_id,
      value: value,
      inserted_at: inserted_at
    } = event

    # Get Entity
    ecs_id = GameService.real_entity_id(entity_type, entity_id)
    {:ok, entity} = Query.fetch_entity(ecs_id)

    # Get the prev pulse
    with {:ok, old_pulse} <- Query.fetch_component(entity, P.PulseComponent),
         # Validate the pulse
         :ok <- validate_value(old_pulse, value),
         :ok <- validate_time(old_pulse, inserted_at) do
      # Then update the PulseComponent
      {:ok, _} =
        ElvenGard.ECS.Command.update_component(entity, P.PulseComponent,
          last_time: inserted_at,
          value: value
        )
    else
      {:error, {:invalid_pulse, _} = error} ->
        # Print the error
        _ = System.error(__MODULE__, error, event)

        # If Pulse event is invalid, we must notify the Endpoint
        {:ok, endpoint} = Query.fetch_component(entity, P.EndpointComponent)
        GameService.send_to(error, endpoint)

      _ ->
        # This case match if the PulseComponent is not found so it shouldn't happen
        :ignore
    end
  end

  ## Helpers

  def validate_value(old_pulse, value) do
    case value == old_pulse.value + @inc_sec do
      true -> :ok
      false -> {:error, {:invalid_pulse, :value}}
    end
  end

  def validate_time(old_pulse, inserted_at) do
    new_time = old_pulse.last_time + @inc_ms
    min_time = new_time - @delta
    max_time = new_time + @delta

    case {inserted_at < min_time, inserted_at > max_time} do
      {false, false} -> :ok
      _ -> {:error, {:invalid_pulse, :time}}
    end
  end
end
