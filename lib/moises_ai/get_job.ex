
defmodule MoisesAI.GetJob do
  defstruct id: nil, name: nil, status: nil, workflow: %{}, workflowParams: %{}, result: %{}, createdAt: nil, startedAt: nil, completedAt: nil

  def parse(response) do
    response = Enum.map(response, &to_key_atom/1)
    struct(__MODULE__, response)
  end

  def to_key_atom({k, v}) do
    {String.to_atom(k), v}
  end
end
