defmodule SessionService do
  @moduledoc """
  Documentation for `SessionService`.
  """

  defdelegate create_session(username, password), to: SessionService.Worker
  defdelegate authenticate(session_id, username), to: SessionService.Worker
end
