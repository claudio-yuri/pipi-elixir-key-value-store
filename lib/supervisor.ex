defmodule Cache.Supervisor do
    use Supervisor

    def start_link(:ok) do
        Supervisor.start_link(__MODULE__, :ok)
    end

    def init(:ok) do
        children = [
            worker(Cache.Server, [])
        ]

        supervise(children, [strategy: :one_for_all])
    end
end