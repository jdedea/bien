class ReviewsController < ApplicationController

  # def defines a function
  def index
    #this is our list page for our reviews
    
    # @ defines a variable
    @number = rand(100)

    @reviews = Review.all
  end

  # rails has a convention of new, so that is why we name it "new"
  def new
    #form for adding a new review
    @review = Review.new
  end
  
  def create
    #take the info from the form and add it to the model
    @review = Review.new(form_params)

    # check if the model can be saved
    # if it can be, go to homepage again
    # if it isn't, show the new form
    if @review.save 
      redirect_to root_path
    else
      # show the view for new.html.erb
      render "new"
    end
   
  end

  def show 
    @review = Review.find(params[:id])
  end

  def destroy
    # find the individual review
    @review = Review.find(params[:id])

    @review.destroy

    #redirect to homepage
    redirect_to root_path
  end

  def edit
    #find the indiviudal review to edit
    @review = Review.find(params[:id])
  end

  def update
    #find the individual review
    @review = Review.find(params[:id])
    #update with the new info from the form
    if @review.update(form_params)
      #redirect somewhere new
      redirect_to review_path(@review)
    else
      render "edit"
    end
  end

  def form_params
    params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance)
  end

end
