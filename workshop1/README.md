# Workshop1

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

# List of Routes
```
page_path  GET     /                                      Workshop1Web.PageController :index
       vehicle_path  GET     /vehicles                              Workshop1Web.VehicleController :index
       vehicle_path  GET     /vehicles/:id/edit                     Workshop1Web.VehicleController :edit
       vehicle_path  GET     /vehicles/new                          Workshop1Web.VehicleController :new
       vehicle_path  GET     /vehicles/:id                          Workshop1Web.VehicleController :show
       vehicle_path  POST    /vehicles                              Workshop1Web.VehicleController :create
       vehicle_path  PATCH   /vehicles/:id                          Workshop1Web.VehicleController :update
                     PUT     /vehicles/:id                          Workshop1Web.VehicleController :update
       vehicle_path  DELETE  /vehicles/:id                          Workshop1Web.VehicleController :delete
   transporter_path  GET     /transporters                          Workshop1Web.TransporterController :index
   transporter_path  GET     /transporters/:id/edit                 Workshop1Web.TransporterController :edit
   transporter_path  GET     /transporters/new                      Workshop1Web.TransporterController :new
   transporter_path  GET     /transporters/:id                      Workshop1Web.TransporterController :show
   transporter_path  POST    /transporters                          Workshop1Web.TransporterController :create
   transporter_path  PATCH   /transporters/:id                      Workshop1Web.TransporterController :update
                     PUT     /transporters/:id                      Workshop1Web.TransporterController :update
   transporter_path  DELETE  /transporters/:id                      Workshop1Web.TransporterController :delete
   transporter_path  PUT     /transporter/status/:id                Workshop1Web.TransporterController :update_status
live_dashboard_path  GET     /dashboard                             Phoenix.LiveDashboard.PageLive :home
live_dashboard_path  GET     /dashboard/:page                       Phoenix.LiveDashboard.PageLive :page
live_dashboard_path  GET     /dashboard/:node/:page                 Phoenix.LiveDashboard.PageLive :page
                     *       /dev/mailbox                           Plug.Swoosh.MailboxPreview []
          websocket  WS      /live/websocket                        Phoenix.LiveView.Socket
           longpoll  GET     /live/longpoll                         Phoenix.LiveView.Socket
           longpoll  POST    /live/longpoll                         Phoenix.LiveView.Socket
```