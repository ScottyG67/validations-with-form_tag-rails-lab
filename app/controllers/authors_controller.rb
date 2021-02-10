class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update]

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  private

  def author_params
    params.permit(:email, :name, :phone_number)
  end

  def set_author
    @author = Author.find(params[:id])
  end

  # <%= form_tag authors_path, method: "post" do %>
  #   <div class="field">
  #     <%= label_tag "name", "Name" %>
  #     <%= text_field_tag "name" %>
  #   </div>
  
  #   <div class="field">
  #     <%= label_tag "email", "Email" %>
  #     <%= text_field_tag "email" %>
  #   </div>
  
  #   <div class="field">
  #     <%= label_tag "phone_number", "Phone Number" %>
  #     <%= text_field_tag "phone_number" %>
  #   </div>
  
  #   <%= submit_tag "Create" %>
  # <% end %>

end
