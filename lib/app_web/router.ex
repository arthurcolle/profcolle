defmodule AppWeb.Router do
  use AppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/mission", PageController, :mission
    get "/topics", PageController, :topics
    get "/biography", PageController, :biography
    get "/education", PageController, :education
    get "/teaching_experience", PageController, :teaching_experience
    get "/endorsements", PageController, :endorsements
    get "/contact", PageController, :contact
  end
end
