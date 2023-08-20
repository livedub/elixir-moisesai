defmodule MoisesAI.Job do
  defstruct id: nil, recipients: 0

  def job_url do
    MoisesAI.endpoint <> "/job"
  end

  def get_job_url(workflowId) do
    job_url() <> "/#{workflowId}"
  end

  @doc """
  Get job
  """
  def get(workflowId) do
    case MoisesAI.API.get(get_job_url(workflowId), []) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        MoisesAI.GetJob.parse(body)
      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Request failed with status: #{status_code}"}
      err -> err
    end
  end

  @doc """
  Send job
  """
  def post(contents, opts) do
    param = %{"contents" => contents}
    body = Map.merge(param, opts)
    url  = job_url()
    case MoisesAI.API.post(url, body) do
      {:ok, response} ->
        response = Enum.map(response, &to_key_atom/1)
        struct(__MODULE__, response)
      err -> err
    end
  end

  def post(body) do
    case MoisesAI.API.post(job_url(), body) do
      {:ok, response} ->
        response = Enum.map(response, &to_key_atom/1)
        struct(__MODULE__, response)
      err -> err
    end
  end

  def to_key_atom({k, v}) do
    {String.to_atom(k), v}
  end
end
